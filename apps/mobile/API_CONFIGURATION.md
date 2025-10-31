# API Configuration Guide

## Backend Server URL

The Flutter app is configured to communicate with the backend server at:

```
http://localhost:8080
```

API endpoints are available under the `/api/v1` path.

## Platform-Specific Configuration

The app automatically detects the platform and uses the appropriate URL:

### iOS Simulator
- **URL**: `http://localhost:8080/api/v1`
- **Works with**: `localhost` or `127.0.0.1`
- **Info.plist**: Configured to allow HTTP connections to localhost

### Android Emulator
- **URL**: `http://10.0.2.2:8080/api/v1`
- **Why**: Android emulator uses `10.0.2.2` to access the host machine's localhost
- **Note**: Android directory not yet initialized in this project

### Web (Flutter Web)
- **URL**: `http://localhost:8080/api/v1`
- **Works with**: Same origin or CORS-enabled backend

### Physical Devices
For testing on physical iOS/Android devices, you need to:
1. Find your computer's IP address on the local network
2. Update the URL in `lib/state/app_providers.dart`

**Example**:
```dart
// For physical devices, replace with your machine's IP
return 'http://192.168.1.100:8080/api/v1';
```

## Configuration File

The API URL is configured in:
```
lib/state/app_providers.dart
```

Look for the `apiBaseUrlProvider`:

```dart
final apiBaseUrlProvider = Provider<String>((ref) {
  if (kIsWeb) {
    return 'http://localhost:8080/api/v1';
  }

  if (Platform.isAndroid) {
    return 'http://10.0.2.2:8080/api/v1';
  } else if (Platform.isIOS) {
    return 'http://localhost:8080/api/v1';
  }

  return 'http://localhost:8080/api/v1';
});
```

## Testing Connection

### 1. Start Backend Services

Make sure your backend is running:

```bash
# Start API Gateway on port 8080
cd apps/backend/api-gateway
./mvnw spring-boot:run

# Verify it's running
curl http://localhost:8080/actuator/health
```

### 2. Run Flutter App

```bash
cd apps/mobile
flutter run
```

### 3. Check Logs

The app includes a Dio logging interceptor in debug mode. You'll see:

```
[dio] --> POST http://localhost:8080/api/v1/events
[dio] Headers: {Content-Type: application/json, ...}
[dio] Body: {"islandId":"isl-001","userId":"user-001",...}
[dio] <-- 200 OK
[dio] Response: {"id":"evt-123",...}
```

### 4. Verify API Calls

When you tap a field in the game:
- You should see API logs in the Flutter console
- Backend should log the event creation
- Event should appear in DynamoDB

## Troubleshooting

### iOS: "Could not connect to the server"

**Solution**: Check Info.plist has NSAppTransportSecurity configured:
```xml
<key>NSAppTransportSecurity</key>
<dict>
    <key>NSAllowsLocalNetworking</key>
    <true/>
    <key>NSExceptionDomains</key>
    <dict>
        <key>localhost</key>
        <dict>
            <key>NSExceptionAllowsInsecureHTTPLoads</key>
            <true/>
        </dict>
    </dict>
</dict>
```

### Android: "Connection refused"

**Solution**: Use `10.0.2.2` instead of `localhost` for emulator

### Physical Device: "Network unreachable"

**Solution**:
1. Ensure device and computer are on same WiFi network
2. Find your computer's IP:
   - macOS: `ifconfig | grep "inet " | grep -v 127.0.0.1`
   - Linux: `ip addr show | grep "inet " | grep -v 127.0.0.1`
   - Windows: `ipconfig`
3. Update apiBaseUrlProvider with actual IP
4. Ensure backend is listening on all interfaces (0.0.0.0), not just localhost

### Backend Not Running

**Check**:
```bash
# Test if backend is accessible
curl http://localhost:8080/actuator/health

# If not running, start it
cd apps/backend/api-gateway
./mvnw spring-boot:run
```

## Environment-Specific URLs

For different environments (dev/staging/prod), you can use flavor-based configuration:

```dart
final apiBaseUrlProvider = Provider<String>((ref) {
  const flavor = String.fromEnvironment('FLAVOR', defaultValue: 'dev');

  switch (flavor) {
    case 'prod':
      return 'https://api.production.com/api/v1';
    case 'staging':
      return 'https://api.staging.com/api/v1';
    default: // dev
      if (Platform.isAndroid) {
        return 'http://10.0.2.2:8080/api/v1';
      }
      return 'http://localhost:8080/api/v1';
  }
});
```

Then run with:
```bash
flutter run --dart-define=FLAVOR=prod
```

## API Endpoints Used

The app calls these endpoints:

### POST /api/v1/events
Create a new scheduled event when user taps a field.

**Request**:
```json
{
  "islandId": "isl-001",
  "userId": "user-001",
  "resourceId": "terrain-farm:5:3",
  "type": "MINES_TYPE"
}
```

**Response**:
```json
{
  "id": "evt-abc123"
}
```

### GET /api/v1/events/{id}
Check event status when collecting reward.

**Response**:
```json
{
  "event": {
    "id": "evt-abc123",
    "status": "COMPLETED",
    "islandId": "isl-001",
    "userId": "user-001",
    "executionDate": "2025-10-31T22:55:30Z",
    "createdDate": "2025-10-31T22:54:00Z"
  }
}
```

## Network Logging

To enable detailed network logs:

The app already includes Dio LogInterceptor in debug mode. You'll see all HTTP requests/responses in the console.

To disable logging in production:
```dart
// In app_providers.dart, the logging is already conditional:
if (kDebugMode) {
  dio.interceptors.add(LogInterceptor(...));
}
```

## CORS Configuration (for Web)

If running Flutter Web, ensure your backend has CORS enabled:

```java
@Configuration
public class WebConfig implements WebMvcConfigurer {
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/api/**")
                .allowedOrigins("http://localhost:*")
                .allowedMethods("GET", "POST", "PUT", "DELETE")
                .allowCredentials(true);
    }
}
```

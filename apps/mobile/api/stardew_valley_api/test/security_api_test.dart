import 'package:test/test.dart';
import 'package:stardew_valley_api/stardew_valley_api.dart';

/// tests for SecurityApi
void main() {
  final instance = StardewValleyApi().getSecurityApi();

  group(SecurityApi, () {
    // Authenticate a user
    //
    //Future<LoginUserResponse> loginUser(LoginUserRequest loginUserRequest) async
    test('test loginUser', () async {
      // TODO
    });

    // Refresh an access token
    //
    //Future<RefreshTokenResponse> refreshToken(RefreshTokenRequest refreshTokenRequest) async
    test('test refreshToken', () async {
      // TODO
    });

    // Verify a user's access token
    //
    //Future<VerifyUserResponse> verifyUser(VerifyUserRequest verifyUserRequest) async
    test('test verifyUser', () async {
      // TODO
    });
  });
}

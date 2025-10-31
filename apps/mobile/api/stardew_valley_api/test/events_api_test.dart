import 'package:test/test.dart';
import 'package:stardew_valley_api/stardew_valley_api.dart';

/// tests for EventsApi
void main() {
  final instance = StardewValleyApi().getEventsApi();

  group(EventsApi, () {
    // Create a new scheduled event (trigger event execution)
    //
    //Future<CreateEventResponse> createEvent(CreateEventRequest createEventRequest) async
    test('test createEvent', () async {
      // TODO
    });

    // Read event by ID
    //
    //Future<ReadEventResponse> readEvent(String id) async
    test('test readEvent', () async {
      // TODO
    });
  });
}

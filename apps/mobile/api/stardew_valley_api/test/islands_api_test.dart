import 'package:test/test.dart';
import 'package:stardew_valley_api/stardew_valley_api.dart';

/// tests for IslandsApi
void main() {
  final instance = StardewValleyApi().getIslandsApi();

  group(IslandsApi, () {
    // Create a new island
    //
    //Future<CreateIslandResponse> createIsland(CreateIslandRequest createIslandRequest) async
    test('test createIsland', () async {
      // TODO
    });

    // Read island by ID
    //
    //Future<ReadIslandResponse> readIsland(String id) async
    test('test readIsland', () async {
      // TODO
    });
  });
}

import 'package:test/test.dart';
import 'package:stardew_valley_api/stardew_valley_api.dart';

/// tests for IslandVariantsApi
void main() {
  final instance = StardewValleyApi().getIslandVariantsApi();

  group(IslandVariantsApi, () {
    // Read island variant by ID
    //
    //Future<IslandVariant> readIslandVariant(String id) async
    test('test readIslandVariant', () async {
      // TODO
    });
  });
}

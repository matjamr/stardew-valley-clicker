import 'package:test/test.dart';
import 'package:stardew_valley_api/stardew_valley_api.dart';

/// tests for AssetsApi
void main() {
  final instance = StardewValleyApi().getAssetsApi();

  group(AssetsApi, () {
    // Create a new asset
    //
    //Future<CreateAssetResponse> createAsset(CreateAssetRequest createAssetRequest) async
    test('test createAsset', () async {
      // TODO
    });

    // Read an asset by ID
    //
    //Future<ReadAssetResponse> readAsset(String id) async
    test('test readAsset', () async {
      // TODO
    });
  });
}

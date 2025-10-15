import 'package:test/test.dart';
import 'package:stardew_valley_api/stardew_valley_api.dart';

/// tests for UsersApi
void main() {
  final instance = StardewValleyApi().getUsersApi();

  group(UsersApi, () {
    // Retrieve a user by ID
    //
    //Future<RetrieveUserResponse> retrieveUser(String id) async
    test('test retrieveUser', () async {
      // TODO
    });

    // Create a new user
    //
    //Future<SaveUserResponse> saveUser(SaveUserRequest saveUserRequest) async
    test('test saveUser', () async {
      // TODO
    });
  });
}

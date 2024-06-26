import 'package:realm/realm.dart';

// Realm: Declare a part file . Run `dart run realm generate` Or `dart run realm generate --watch`
part 'credential.realm.dart';

// Realm: Creating a Realm object data model class

@RealmModel()
class _Credential {
  @PrimaryKey()
  late ObjectId id;
  late ObjectId? userId;
  late String? tokenType;
  late int? expiresIn;
  late String? accessToken;
  late String? refreshToken;
}
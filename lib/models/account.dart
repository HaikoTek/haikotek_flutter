import 'package:realm/realm.dart';

// Realm: Declare a part file . Run `dart run realm generate`
part 'account.g.dart';

// Realm: Creating a Realm object data model class

@RealmModel()
class _Account {
  @PrimaryKey()
  late ObjectId id;
  late String? userName;
  late String? emailAddress;
  late String? password;
  late String? accessToken;
  late String? refreshToken;
}

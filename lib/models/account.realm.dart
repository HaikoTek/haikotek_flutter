// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Account extends _Account with RealmEntity, RealmObjectBase, RealmObject {
  Account(
    ObjectId id, {
    String? userName,
    String? emailAddress,
    String? password,
    String? accessToken,
    String? refreshToken,
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'userName', userName);
    RealmObjectBase.set(this, 'emailAddress', emailAddress);
    RealmObjectBase.set(this, 'password', password);
    RealmObjectBase.set(this, 'accessToken', accessToken);
    RealmObjectBase.set(this, 'refreshToken', refreshToken);
  }

  Account._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String? get userName =>
      RealmObjectBase.get<String>(this, 'userName') as String?;
  @override
  set userName(String? value) => RealmObjectBase.set(this, 'userName', value);

  @override
  String? get emailAddress =>
      RealmObjectBase.get<String>(this, 'emailAddress') as String?;
  @override
  set emailAddress(String? value) =>
      RealmObjectBase.set(this, 'emailAddress', value);

  @override
  String? get password =>
      RealmObjectBase.get<String>(this, 'password') as String?;
  @override
  set password(String? value) => RealmObjectBase.set(this, 'password', value);

  @override
  String? get accessToken =>
      RealmObjectBase.get<String>(this, 'accessToken') as String?;
  @override
  set accessToken(String? value) =>
      RealmObjectBase.set(this, 'accessToken', value);

  @override
  String? get refreshToken =>
      RealmObjectBase.get<String>(this, 'refreshToken') as String?;
  @override
  set refreshToken(String? value) =>
      RealmObjectBase.set(this, 'refreshToken', value);

  @override
  Stream<RealmObjectChanges<Account>> get changes =>
      RealmObjectBase.getChanges<Account>(this);

  @override
  Stream<RealmObjectChanges<Account>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<Account>(this, keyPaths);

  @override
  Account freeze() => RealmObjectBase.freezeObject<Account>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'userName': userName.toEJson(),
      'emailAddress': emailAddress.toEJson(),
      'password': password.toEJson(),
      'accessToken': accessToken.toEJson(),
      'refreshToken': refreshToken.toEJson(),
    };
  }

  static EJsonValue _toEJson(Account value) => value.toEJson();
  static Account _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'userName': EJsonValue userName,
        'emailAddress': EJsonValue emailAddress,
        'password': EJsonValue password,
        'accessToken': EJsonValue accessToken,
        'refreshToken': EJsonValue refreshToken,
      } =>
        Account(
          fromEJson(id),
          userName: fromEJson(userName),
          emailAddress: fromEJson(emailAddress),
          password: fromEJson(password),
          accessToken: fromEJson(accessToken),
          refreshToken: fromEJson(refreshToken),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(Account._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, Account, 'Account', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('userName', RealmPropertyType.string, optional: true),
      SchemaProperty('emailAddress', RealmPropertyType.string, optional: true),
      SchemaProperty('password', RealmPropertyType.string, optional: true),
      SchemaProperty('accessToken', RealmPropertyType.string, optional: true),
      SchemaProperty('refreshToken', RealmPropertyType.string, optional: true),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

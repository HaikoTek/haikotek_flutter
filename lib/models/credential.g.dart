// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credential.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Credential extends _Credential
    with RealmEntity, RealmObjectBase, RealmObject {
  Credential(
    ObjectId id, {
    ObjectId? userId,
    String? tokenType,
    int? expiresIn,
    String? accessToken,
    String? refreshToken,
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'userId', userId);
    RealmObjectBase.set(this, 'tokenType', tokenType);
    RealmObjectBase.set(this, 'expiresIn', expiresIn);
    RealmObjectBase.set(this, 'accessToken', accessToken);
    RealmObjectBase.set(this, 'refreshToken', refreshToken);
  }

  Credential._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  ObjectId? get userId =>
      RealmObjectBase.get<ObjectId>(this, 'userId') as ObjectId?;
  @override
  set userId(ObjectId? value) => RealmObjectBase.set(this, 'userId', value);

  @override
  String? get tokenType =>
      RealmObjectBase.get<String>(this, 'tokenType') as String?;
  @override
  set tokenType(String? value) => RealmObjectBase.set(this, 'tokenType', value);

  @override
  int? get expiresIn => RealmObjectBase.get<int>(this, 'expiresIn') as int?;
  @override
  set expiresIn(int? value) => RealmObjectBase.set(this, 'expiresIn', value);

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
  Stream<RealmObjectChanges<Credential>> get changes =>
      RealmObjectBase.getChanges<Credential>(this);

  @override
  Credential freeze() => RealmObjectBase.freezeObject<Credential>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Credential._);
    return const SchemaObject(
        ObjectType.realmObject, Credential, 'Credential', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('userId', RealmPropertyType.objectid, optional: true),
      SchemaProperty('tokenType', RealmPropertyType.string, optional: true),
      SchemaProperty('expiresIn', RealmPropertyType.int, optional: true),
      SchemaProperty('accessToken', RealmPropertyType.string, optional: true),
      SchemaProperty('refreshToken', RealmPropertyType.string, optional: true),
    ]);
  }
}

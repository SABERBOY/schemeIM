// This is a generated file - do not edit.
//
// Generated from models/room.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;
import 'package:protobuf/well_known_types/google/protobuf/timestamp.pb.dart'
    as $1;

import 'user.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// 聊天室模型
class Room extends $pb.GeneratedMessage {
  factory Room({
    $core.String? id,
    $core.String? title,
    $core.String? countryFlag,
    $core.String? tags,
    $core.String? hostId,
    $0.User? host,
    $core.String? description,
    $core.int? onlineCount,
    $1.Timestamp? createdAt,
    $1.Timestamp? updatedAt,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (title != null) result.title = title;
    if (countryFlag != null) result.countryFlag = countryFlag;
    if (tags != null) result.tags = tags;
    if (hostId != null) result.hostId = hostId;
    if (host != null) result.host = host;
    if (description != null) result.description = description;
    if (onlineCount != null) result.onlineCount = onlineCount;
    if (createdAt != null) result.createdAt = createdAt;
    if (updatedAt != null) result.updatedAt = updatedAt;
    return result;
  }

  Room._();

  factory Room.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Room.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Room',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'models'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..aOS(3, _omitFieldNames ? '' : 'countryFlag')
    ..aOS(4, _omitFieldNames ? '' : 'tags')
    ..aOS(5, _omitFieldNames ? '' : 'hostId')
    ..aOM<$0.User>(6, _omitFieldNames ? '' : 'host', subBuilder: $0.User.create)
    ..aOS(7, _omitFieldNames ? '' : 'description')
    ..aI(8, _omitFieldNames ? '' : 'onlineCount')
    ..aOM<$1.Timestamp>(9, _omitFieldNames ? '' : 'createdAt',
        subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(10, _omitFieldNames ? '' : 'updatedAt',
        subBuilder: $1.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Room clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Room copyWith(void Function(Room) updates) =>
      super.copyWith((message) => updates(message as Room)) as Room;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Room create() => Room._();
  @$core.override
  Room createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Room getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Room>(create);
  static Room? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get countryFlag => $_getSZ(2);
  @$pb.TagNumber(3)
  set countryFlag($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCountryFlag() => $_has(2);
  @$pb.TagNumber(3)
  void clearCountryFlag() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get tags => $_getSZ(3);
  @$pb.TagNumber(4)
  set tags($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTags() => $_has(3);
  @$pb.TagNumber(4)
  void clearTags() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get hostId => $_getSZ(4);
  @$pb.TagNumber(5)
  set hostId($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasHostId() => $_has(4);
  @$pb.TagNumber(5)
  void clearHostId() => $_clearField(5);

  @$pb.TagNumber(6)
  $0.User get host => $_getN(5);
  @$pb.TagNumber(6)
  set host($0.User value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasHost() => $_has(5);
  @$pb.TagNumber(6)
  void clearHost() => $_clearField(6);
  @$pb.TagNumber(6)
  $0.User ensureHost() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.String get description => $_getSZ(6);
  @$pb.TagNumber(7)
  set description($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasDescription() => $_has(6);
  @$pb.TagNumber(7)
  void clearDescription() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.int get onlineCount => $_getIZ(7);
  @$pb.TagNumber(8)
  set onlineCount($core.int value) => $_setSignedInt32(7, value);
  @$pb.TagNumber(8)
  $core.bool hasOnlineCount() => $_has(7);
  @$pb.TagNumber(8)
  void clearOnlineCount() => $_clearField(8);

  @$pb.TagNumber(9)
  $1.Timestamp get createdAt => $_getN(8);
  @$pb.TagNumber(9)
  set createdAt($1.Timestamp value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasCreatedAt() => $_has(8);
  @$pb.TagNumber(9)
  void clearCreatedAt() => $_clearField(9);
  @$pb.TagNumber(9)
  $1.Timestamp ensureCreatedAt() => $_ensure(8);

  @$pb.TagNumber(10)
  $1.Timestamp get updatedAt => $_getN(9);
  @$pb.TagNumber(10)
  set updatedAt($1.Timestamp value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasUpdatedAt() => $_has(9);
  @$pb.TagNumber(10)
  void clearUpdatedAt() => $_clearField(10);
  @$pb.TagNumber(10)
  $1.Timestamp ensureUpdatedAt() => $_ensure(9);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

// This is a generated file - do not edit.
//
// Generated from models/social.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;
import 'package:protobuf/well_known_types/google/protobuf/timestamp.pb.dart'
    as $0;

import 'social.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'social.pbenum.dart';

/// 好友关系
class Friend extends $pb.GeneratedMessage {
  factory Friend({
    $core.String? userId,
    $core.String? friendId,
    FriendStatus? status,
    $0.Timestamp? createdAt,
    $0.Timestamp? updatedAt,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (friendId != null) result.friendId = friendId;
    if (status != null) result.status = status;
    if (createdAt != null) result.createdAt = createdAt;
    if (updatedAt != null) result.updatedAt = updatedAt;
    return result;
  }

  Friend._();

  factory Friend.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Friend.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Friend',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'models'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'friendId')
    ..aE<FriendStatus>(3, _omitFieldNames ? '' : 'status',
        enumValues: FriendStatus.values)
    ..aOM<$0.Timestamp>(4, _omitFieldNames ? '' : 'createdAt',
        subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(5, _omitFieldNames ? '' : 'updatedAt',
        subBuilder: $0.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Friend clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Friend copyWith(void Function(Friend) updates) =>
      super.copyWith((message) => updates(message as Friend)) as Friend;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Friend create() => Friend._();
  @$core.override
  Friend createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Friend getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Friend>(create);
  static Friend? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get friendId => $_getSZ(1);
  @$pb.TagNumber(2)
  set friendId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFriendId() => $_has(1);
  @$pb.TagNumber(2)
  void clearFriendId() => $_clearField(2);

  @$pb.TagNumber(3)
  FriendStatus get status => $_getN(2);
  @$pb.TagNumber(3)
  set status(FriendStatus value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasStatus() => $_has(2);
  @$pb.TagNumber(3)
  void clearStatus() => $_clearField(3);

  @$pb.TagNumber(4)
  $0.Timestamp get createdAt => $_getN(3);
  @$pb.TagNumber(4)
  set createdAt($0.Timestamp value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasCreatedAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearCreatedAt() => $_clearField(4);
  @$pb.TagNumber(4)
  $0.Timestamp ensureCreatedAt() => $_ensure(3);

  @$pb.TagNumber(5)
  $0.Timestamp get updatedAt => $_getN(4);
  @$pb.TagNumber(5)
  set updatedAt($0.Timestamp value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasUpdatedAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearUpdatedAt() => $_clearField(5);
  @$pb.TagNumber(5)
  $0.Timestamp ensureUpdatedAt() => $_ensure(4);
}

/// 关注关系
class Follow extends $pb.GeneratedMessage {
  factory Follow({
    $core.String? followerId,
    $core.String? followingId,
    $0.Timestamp? createdAt,
  }) {
    final result = create();
    if (followerId != null) result.followerId = followerId;
    if (followingId != null) result.followingId = followingId;
    if (createdAt != null) result.createdAt = createdAt;
    return result;
  }

  Follow._();

  factory Follow.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Follow.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Follow',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'models'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'followerId')
    ..aOS(2, _omitFieldNames ? '' : 'followingId')
    ..aOM<$0.Timestamp>(3, _omitFieldNames ? '' : 'createdAt',
        subBuilder: $0.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Follow clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Follow copyWith(void Function(Follow) updates) =>
      super.copyWith((message) => updates(message as Follow)) as Follow;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Follow create() => Follow._();
  @$core.override
  Follow createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Follow getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Follow>(create);
  static Follow? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get followerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set followerId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFollowerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFollowerId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get followingId => $_getSZ(1);
  @$pb.TagNumber(2)
  set followingId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFollowingId() => $_has(1);
  @$pb.TagNumber(2)
  void clearFollowingId() => $_clearField(2);

  @$pb.TagNumber(3)
  $0.Timestamp get createdAt => $_getN(2);
  @$pb.TagNumber(3)
  set createdAt($0.Timestamp value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasCreatedAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearCreatedAt() => $_clearField(3);
  @$pb.TagNumber(3)
  $0.Timestamp ensureCreatedAt() => $_ensure(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

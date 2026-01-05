// This is a generated file - do not edit.
//
// Generated from messages/chatroom.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../models/room.pb.dart' as $0;
import '../models/user.pb.dart' as $1;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// 创建聊天室请求
class ChatRoomCreateRequest extends $pb.GeneratedMessage {
  factory ChatRoomCreateRequest({
    $core.String? chatroomId,
    $core.String? name,
    $core.String? hostId,
    $core.String? tags,
    $core.String? countryFlag,
    $core.String? description,
    $core.int? destroyType,
    $core.int? destroyTime,
    $core.bool? isBan,
    $core.Iterable<$core.String>? whiteUserIds,
    $core.bool? needNotify,
    $core.String? extra,
  }) {
    final result = create();
    if (chatroomId != null) result.chatroomId = chatroomId;
    if (name != null) result.name = name;
    if (hostId != null) result.hostId = hostId;
    if (tags != null) result.tags = tags;
    if (countryFlag != null) result.countryFlag = countryFlag;
    if (description != null) result.description = description;
    if (destroyType != null) result.destroyType = destroyType;
    if (destroyTime != null) result.destroyTime = destroyTime;
    if (isBan != null) result.isBan = isBan;
    if (whiteUserIds != null) result.whiteUserIds.addAll(whiteUserIds);
    if (needNotify != null) result.needNotify = needNotify;
    if (extra != null) result.extra = extra;
    return result;
  }

  ChatRoomCreateRequest._();

  factory ChatRoomCreateRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChatRoomCreateRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChatRoomCreateRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'messages'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chatroomId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'hostId')
    ..aOS(4, _omitFieldNames ? '' : 'tags')
    ..aOS(5, _omitFieldNames ? '' : 'countryFlag')
    ..aOS(6, _omitFieldNames ? '' : 'description')
    ..aI(7, _omitFieldNames ? '' : 'destroyType')
    ..aI(8, _omitFieldNames ? '' : 'destroyTime')
    ..aOB(9, _omitFieldNames ? '' : 'isBan')
    ..pPS(10, _omitFieldNames ? '' : 'whiteUserIds')
    ..aOB(11, _omitFieldNames ? '' : 'needNotify')
    ..aOS(12, _omitFieldNames ? '' : 'extra')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatRoomCreateRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatRoomCreateRequest copyWith(
          void Function(ChatRoomCreateRequest) updates) =>
      super.copyWith((message) => updates(message as ChatRoomCreateRequest))
          as ChatRoomCreateRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatRoomCreateRequest create() => ChatRoomCreateRequest._();
  @$core.override
  ChatRoomCreateRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChatRoomCreateRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChatRoomCreateRequest>(create);
  static ChatRoomCreateRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get chatroomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chatroomId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChatroomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatroomId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get hostId => $_getSZ(2);
  @$pb.TagNumber(3)
  set hostId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasHostId() => $_has(2);
  @$pb.TagNumber(3)
  void clearHostId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get tags => $_getSZ(3);
  @$pb.TagNumber(4)
  set tags($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTags() => $_has(3);
  @$pb.TagNumber(4)
  void clearTags() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get countryFlag => $_getSZ(4);
  @$pb.TagNumber(5)
  set countryFlag($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCountryFlag() => $_has(4);
  @$pb.TagNumber(5)
  void clearCountryFlag() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get description => $_getSZ(5);
  @$pb.TagNumber(6)
  set description($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasDescription() => $_has(5);
  @$pb.TagNumber(6)
  void clearDescription() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.int get destroyType => $_getIZ(6);
  @$pb.TagNumber(7)
  set destroyType($core.int value) => $_setSignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasDestroyType() => $_has(6);
  @$pb.TagNumber(7)
  void clearDestroyType() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.int get destroyTime => $_getIZ(7);
  @$pb.TagNumber(8)
  set destroyTime($core.int value) => $_setSignedInt32(7, value);
  @$pb.TagNumber(8)
  $core.bool hasDestroyTime() => $_has(7);
  @$pb.TagNumber(8)
  void clearDestroyTime() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.bool get isBan => $_getBF(8);
  @$pb.TagNumber(9)
  set isBan($core.bool value) => $_setBool(8, value);
  @$pb.TagNumber(9)
  $core.bool hasIsBan() => $_has(8);
  @$pb.TagNumber(9)
  void clearIsBan() => $_clearField(9);

  @$pb.TagNumber(10)
  $pb.PbList<$core.String> get whiteUserIds => $_getList(9);

  @$pb.TagNumber(11)
  $core.bool get needNotify => $_getBF(10);
  @$pb.TagNumber(11)
  set needNotify($core.bool value) => $_setBool(10, value);
  @$pb.TagNumber(11)
  $core.bool hasNeedNotify() => $_has(10);
  @$pb.TagNumber(11)
  void clearNeedNotify() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.String get extra => $_getSZ(11);
  @$pb.TagNumber(12)
  set extra($core.String value) => $_setString(11, value);
  @$pb.TagNumber(12)
  $core.bool hasExtra() => $_has(11);
  @$pb.TagNumber(12)
  void clearExtra() => $_clearField(12);
}

/// 创建聊天室响应
class ChatRoomCreateResponse extends $pb.GeneratedMessage {
  factory ChatRoomCreateResponse({
    $core.String? chatroomId,
    $core.String? message,
  }) {
    final result = create();
    if (chatroomId != null) result.chatroomId = chatroomId;
    if (message != null) result.message = message;
    return result;
  }

  ChatRoomCreateResponse._();

  factory ChatRoomCreateResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChatRoomCreateResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChatRoomCreateResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'messages'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chatroomId')
    ..aOS(6, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatRoomCreateResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatRoomCreateResponse copyWith(
          void Function(ChatRoomCreateResponse) updates) =>
      super.copyWith((message) => updates(message as ChatRoomCreateResponse))
          as ChatRoomCreateResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatRoomCreateResponse create() => ChatRoomCreateResponse._();
  @$core.override
  ChatRoomCreateResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChatRoomCreateResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChatRoomCreateResponse>(create);
  static ChatRoomCreateResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get chatroomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chatroomId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChatroomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatroomId() => $_clearField(1);

  @$pb.TagNumber(6)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(6)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(6)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(6)
  void clearMessage() => $_clearField(6);
}

/// 麦位管理请求
class MicRequest extends $pb.GeneratedMessage {
  factory MicRequest({
    $core.int? position,
    $core.String? action,
  }) {
    final result = create();
    if (position != null) result.position = position;
    if (action != null) result.action = action;
    return result;
  }

  MicRequest._();

  factory MicRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MicRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MicRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'messages'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'position')
    ..aOS(2, _omitFieldNames ? '' : 'action')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MicRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MicRequest copyWith(void Function(MicRequest) updates) =>
      super.copyWith((message) => updates(message as MicRequest)) as MicRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MicRequest create() => MicRequest._();
  @$core.override
  MicRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MicRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MicRequest>(create);
  static MicRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get position => $_getIZ(0);
  @$pb.TagNumber(1)
  set position($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPosition() => $_has(0);
  @$pb.TagNumber(1)
  void clearPosition() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get action => $_getSZ(1);
  @$pb.TagNumber(2)
  set action($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAction() => $_has(1);
  @$pb.TagNumber(2)
  void clearAction() => $_clearField(2);
}

/// 批量用户操作请求（封禁、解封、禁言、取消禁言等）
class BatchUsersRequest extends $pb.GeneratedMessage {
  factory BatchUsersRequest({
    $core.Iterable<$core.String>? userIds,
    $core.int? minute,
    $core.bool? needNotify,
    $core.String? extra,
  }) {
    final result = create();
    if (userIds != null) result.userIds.addAll(userIds);
    if (minute != null) result.minute = minute;
    if (needNotify != null) result.needNotify = needNotify;
    if (extra != null) result.extra = extra;
    return result;
  }

  BatchUsersRequest._();

  factory BatchUsersRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BatchUsersRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BatchUsersRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'messages'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'userIds')
    ..aI(2, _omitFieldNames ? '' : 'minute', fieldType: $pb.PbFieldType.OU3)
    ..aOB(3, _omitFieldNames ? '' : 'needNotify')
    ..aOS(4, _omitFieldNames ? '' : 'extra')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BatchUsersRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BatchUsersRequest copyWith(void Function(BatchUsersRequest) updates) =>
      super.copyWith((message) => updates(message as BatchUsersRequest))
          as BatchUsersRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BatchUsersRequest create() => BatchUsersRequest._();
  @$core.override
  BatchUsersRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BatchUsersRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BatchUsersRequest>(create);
  static BatchUsersRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get userIds => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get minute => $_getIZ(1);
  @$pb.TagNumber(2)
  set minute($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMinute() => $_has(1);
  @$pb.TagNumber(2)
  void clearMinute() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get needNotify => $_getBF(2);
  @$pb.TagNumber(3)
  set needNotify($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasNeedNotify() => $_has(2);
  @$pb.TagNumber(3)
  void clearNeedNotify() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get extra => $_getSZ(3);
  @$pb.TagNumber(4)
  set extra($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasExtra() => $_has(3);
  @$pb.TagNumber(4)
  void clearExtra() => $_clearField(4);
}

/// 消息降级请求
class MessageDemotionRequest extends $pb.GeneratedMessage {
  factory MessageDemotionRequest({
    $core.Iterable<$core.String>? objectNames,
  }) {
    final result = create();
    if (objectNames != null) result.objectNames.addAll(objectNames);
    return result;
  }

  MessageDemotionRequest._();

  factory MessageDemotionRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MessageDemotionRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MessageDemotionRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'messages'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'objectNames')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MessageDemotionRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MessageDemotionRequest copyWith(
          void Function(MessageDemotionRequest) updates) =>
      super.copyWith((message) => updates(message as MessageDemotionRequest))
          as MessageDemotionRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MessageDemotionRequest create() => MessageDemotionRequest._();
  @$core.override
  MessageDemotionRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MessageDemotionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MessageDemotionRequest>(create);
  static MessageDemotionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get objectNames => $_getList(0);
}

/// 白名单消息类型请求
class WhitelistMessageTypeRequest extends $pb.GeneratedMessage {
  factory WhitelistMessageTypeRequest({
    $core.Iterable<$core.String>? objectNames,
  }) {
    final result = create();
    if (objectNames != null) result.objectNames.addAll(objectNames);
    return result;
  }

  WhitelistMessageTypeRequest._();

  factory WhitelistMessageTypeRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WhitelistMessageTypeRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WhitelistMessageTypeRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'messages'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'objectNames')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WhitelistMessageTypeRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WhitelistMessageTypeRequest copyWith(
          void Function(WhitelistMessageTypeRequest) updates) =>
      super.copyWith(
              (message) => updates(message as WhitelistMessageTypeRequest))
          as WhitelistMessageTypeRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WhitelistMessageTypeRequest create() =>
      WhitelistMessageTypeRequest._();
  @$core.override
  WhitelistMessageTypeRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static WhitelistMessageTypeRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WhitelistMessageTypeRequest>(create);
  static WhitelistMessageTypeRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get objectNames => $_getList(0);
}

/// 白名单用户请求
class WhitelistUsersRequest extends $pb.GeneratedMessage {
  factory WhitelistUsersRequest({
    $core.Iterable<$core.String>? userIds,
  }) {
    final result = create();
    if (userIds != null) result.userIds.addAll(userIds);
    return result;
  }

  WhitelistUsersRequest._();

  factory WhitelistUsersRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WhitelistUsersRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WhitelistUsersRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'messages'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'userIds')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WhitelistUsersRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WhitelistUsersRequest copyWith(
          void Function(WhitelistUsersRequest) updates) =>
      super.copyWith((message) => updates(message as WhitelistUsersRequest))
          as WhitelistUsersRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WhitelistUsersRequest create() => WhitelistUsersRequest._();
  @$core.override
  WhitelistUsersRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static WhitelistUsersRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WhitelistUsersRequest>(create);
  static WhitelistUsersRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get userIds => $_getList(0);
}

/// 聊天室属性请求
class ChatRoomAttributeRequest extends $pb.GeneratedMessage {
  factory ChatRoomAttributeRequest({
    $core.String? userId,
    $core.String? key,
    $core.String? value,
    $core.int? autoDelete,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (key != null) result.key = key;
    if (value != null) result.value = value;
    if (autoDelete != null) result.autoDelete = autoDelete;
    return result;
  }

  ChatRoomAttributeRequest._();

  factory ChatRoomAttributeRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChatRoomAttributeRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChatRoomAttributeRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'messages'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'key')
    ..aOS(3, _omitFieldNames ? '' : 'value')
    ..aI(4, _omitFieldNames ? '' : 'autoDelete')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatRoomAttributeRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatRoomAttributeRequest copyWith(
          void Function(ChatRoomAttributeRequest) updates) =>
      super.copyWith((message) => updates(message as ChatRoomAttributeRequest))
          as ChatRoomAttributeRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatRoomAttributeRequest create() => ChatRoomAttributeRequest._();
  @$core.override
  ChatRoomAttributeRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChatRoomAttributeRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChatRoomAttributeRequest>(create);
  static ChatRoomAttributeRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get key => $_getSZ(1);
  @$pb.TagNumber(2)
  set key($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearKey() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get value => $_getSZ(2);
  @$pb.TagNumber(3)
  set value($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearValue() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get autoDelete => $_getIZ(3);
  @$pb.TagNumber(4)
  set autoDelete($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAutoDelete() => $_has(3);
  @$pb.TagNumber(4)
  void clearAutoDelete() => $_clearField(4);
}

/// 全员禁言请求
class BanAllUsersRequest extends $pb.GeneratedMessage {
  factory BanAllUsersRequest({
    $core.bool? needNotify,
    $core.String? extra,
  }) {
    final result = create();
    if (needNotify != null) result.needNotify = needNotify;
    if (extra != null) result.extra = extra;
    return result;
  }

  BanAllUsersRequest._();

  factory BanAllUsersRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BanAllUsersRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BanAllUsersRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'messages'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'needNotify')
    ..aOS(2, _omitFieldNames ? '' : 'extra')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BanAllUsersRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BanAllUsersRequest copyWith(void Function(BanAllUsersRequest) updates) =>
      super.copyWith((message) => updates(message as BanAllUsersRequest))
          as BanAllUsersRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BanAllUsersRequest create() => BanAllUsersRequest._();
  @$core.override
  BanAllUsersRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BanAllUsersRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BanAllUsersRequest>(create);
  static BanAllUsersRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get needNotify => $_getBF(0);
  @$pb.TagNumber(1)
  set needNotify($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasNeedNotify() => $_has(0);
  @$pb.TagNumber(1)
  void clearNeedNotify() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get extra => $_getSZ(1);
  @$pb.TagNumber(2)
  set extra($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasExtra() => $_has(1);
  @$pb.TagNumber(2)
  void clearExtra() => $_clearField(2);
}

/// 禁言白名单用户请求
class BanWhitelistUsersRequest extends $pb.GeneratedMessage {
  factory BanWhitelistUsersRequest({
    $core.Iterable<$core.String>? userIds,
    $core.bool? needNotify,
    $core.String? extra,
  }) {
    final result = create();
    if (userIds != null) result.userIds.addAll(userIds);
    if (needNotify != null) result.needNotify = needNotify;
    if (extra != null) result.extra = extra;
    return result;
  }

  BanWhitelistUsersRequest._();

  factory BanWhitelistUsersRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BanWhitelistUsersRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BanWhitelistUsersRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'messages'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'userIds')
    ..aOB(2, _omitFieldNames ? '' : 'needNotify')
    ..aOS(3, _omitFieldNames ? '' : 'extra')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BanWhitelistUsersRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BanWhitelistUsersRequest copyWith(
          void Function(BanWhitelistUsersRequest) updates) =>
      super.copyWith((message) => updates(message as BanWhitelistUsersRequest))
          as BanWhitelistUsersRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BanWhitelistUsersRequest create() => BanWhitelistUsersRequest._();
  @$core.override
  BanWhitelistUsersRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BanWhitelistUsersRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BanWhitelistUsersRequest>(create);
  static BanWhitelistUsersRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get userIds => $_getList(0);

  @$pb.TagNumber(2)
  $core.bool get needNotify => $_getBF(1);
  @$pb.TagNumber(2)
  set needNotify($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNeedNotify() => $_has(1);
  @$pb.TagNumber(2)
  void clearNeedNotify() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get extra => $_getSZ(2);
  @$pb.TagNumber(3)
  set extra($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasExtra() => $_has(2);
  @$pb.TagNumber(3)
  void clearExtra() => $_clearField(3);
}

/// 查询聊天室请求
class QueryChatRoomsRequest extends $pb.GeneratedMessage {
  factory QueryChatRoomsRequest() => create();

  QueryChatRoomsRequest._();

  factory QueryChatRoomsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QueryChatRoomsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QueryChatRoomsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'messages'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryChatRoomsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryChatRoomsRequest copyWith(
          void Function(QueryChatRoomsRequest) updates) =>
      super.copyWith((message) => updates(message as QueryChatRoomsRequest))
          as QueryChatRoomsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QueryChatRoomsRequest create() => QueryChatRoomsRequest._();
  @$core.override
  QueryChatRoomsRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QueryChatRoomsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QueryChatRoomsRequest>(create);
  static QueryChatRoomsRequest? _defaultInstance;
}

/// 聊天室列表响应
class ChatRoomListResponse extends $pb.GeneratedMessage {
  factory ChatRoomListResponse({
    $core.Iterable<$0.Room>? list,
    $fixnum.Int64? total,
  }) {
    final result = create();
    if (list != null) result.list.addAll(list);
    if (total != null) result.total = total;
    return result;
  }

  ChatRoomListResponse._();

  factory ChatRoomListResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChatRoomListResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChatRoomListResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'messages'),
      createEmptyInstance: create)
    ..pPM<$0.Room>(1, _omitFieldNames ? '' : 'list', subBuilder: $0.Room.create)
    ..aInt64(2, _omitFieldNames ? '' : 'total')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatRoomListResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatRoomListResponse copyWith(void Function(ChatRoomListResponse) updates) =>
      super.copyWith((message) => updates(message as ChatRoomListResponse))
          as ChatRoomListResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatRoomListResponse create() => ChatRoomListResponse._();
  @$core.override
  ChatRoomListResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChatRoomListResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChatRoomListResponse>(create);
  static ChatRoomListResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$0.Room> get list => $_getList(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get total => $_getI64(1);
  @$pb.TagNumber(2)
  set total($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTotal() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotal() => $_clearField(2);
}

/// 用户列表响应
class UserListResponse extends $pb.GeneratedMessage {
  factory UserListResponse({
    $core.Iterable<$1.User>? list,
    $fixnum.Int64? total,
  }) {
    final result = create();
    if (list != null) result.list.addAll(list);
    if (total != null) result.total = total;
    return result;
  }

  UserListResponse._();

  factory UserListResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserListResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserListResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'messages'),
      createEmptyInstance: create)
    ..pPM<$1.User>(1, _omitFieldNames ? '' : 'list', subBuilder: $1.User.create)
    ..aInt64(2, _omitFieldNames ? '' : 'total')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserListResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserListResponse copyWith(void Function(UserListResponse) updates) =>
      super.copyWith((message) => updates(message as UserListResponse))
          as UserListResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserListResponse create() => UserListResponse._();
  @$core.override
  UserListResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserListResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserListResponse>(create);
  static UserListResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$1.User> get list => $_getList(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get total => $_getI64(1);
  @$pb.TagNumber(2)
  set total($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTotal() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotal() => $_clearField(2);
}

/// 字符串列表响应（用于获取各种列表）
class StringListResponse extends $pb.GeneratedMessage {
  factory StringListResponse({
    $core.Iterable<$core.String>? list,
  }) {
    final result = create();
    if (list != null) result.list.addAll(list);
    return result;
  }

  StringListResponse._();

  factory StringListResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StringListResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StringListResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'messages'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'list')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StringListResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StringListResponse copyWith(void Function(StringListResponse) updates) =>
      super.copyWith((message) => updates(message as StringListResponse))
          as StringListResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StringListResponse create() => StringListResponse._();
  @$core.override
  StringListResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StringListResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StringListResponse>(create);
  static StringListResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get list => $_getList(0);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

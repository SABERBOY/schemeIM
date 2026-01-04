// This is a generated file - do not edit.
//
// Generated from services/api.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../messages/chatroom.pb.dart' as $7;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// 辅助消息定义
class ChatRoomIdRequest extends $pb.GeneratedMessage {
  factory ChatRoomIdRequest({
    $core.String? chatroomId,
  }) {
    final result = create();
    if (chatroomId != null) result.chatroomId = chatroomId;
    return result;
  }

  ChatRoomIdRequest._();

  factory ChatRoomIdRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChatRoomIdRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChatRoomIdRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'services'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chatroomId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatRoomIdRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatRoomIdRequest copyWith(void Function(ChatRoomIdRequest) updates) =>
      super.copyWith((message) => updates(message as ChatRoomIdRequest))
          as ChatRoomIdRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatRoomIdRequest create() => ChatRoomIdRequest._();
  @$core.override
  ChatRoomIdRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChatRoomIdRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChatRoomIdRequest>(create);
  static ChatRoomIdRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get chatroomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chatroomId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChatroomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatroomId() => $_clearField(1);
}

class ChatRoomMicRequest extends $pb.GeneratedMessage {
  factory ChatRoomMicRequest({
    $core.String? chatroomId,
    $7.MicRequest? micRequest,
  }) {
    final result = create();
    if (chatroomId != null) result.chatroomId = chatroomId;
    if (micRequest != null) result.micRequest = micRequest;
    return result;
  }

  ChatRoomMicRequest._();

  factory ChatRoomMicRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChatRoomMicRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChatRoomMicRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'services'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chatroomId')
    ..aOM<$7.MicRequest>(2, _omitFieldNames ? '' : 'micRequest',
        subBuilder: $7.MicRequest.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatRoomMicRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatRoomMicRequest copyWith(void Function(ChatRoomMicRequest) updates) =>
      super.copyWith((message) => updates(message as ChatRoomMicRequest))
          as ChatRoomMicRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatRoomMicRequest create() => ChatRoomMicRequest._();
  @$core.override
  ChatRoomMicRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChatRoomMicRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChatRoomMicRequest>(create);
  static ChatRoomMicRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get chatroomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chatroomId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChatroomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatroomId() => $_clearField(1);

  @$pb.TagNumber(2)
  $7.MicRequest get micRequest => $_getN(1);
  @$pb.TagNumber(2)
  set micRequest($7.MicRequest value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasMicRequest() => $_has(1);
  @$pb.TagNumber(2)
  void clearMicRequest() => $_clearField(2);
  @$pb.TagNumber(2)
  $7.MicRequest ensureMicRequest() => $_ensure(1);
}

class ChatRoomUserRequest extends $pb.GeneratedMessage {
  factory ChatRoomUserRequest({
    $core.String? chatroomId,
    $core.String? userId,
  }) {
    final result = create();
    if (chatroomId != null) result.chatroomId = chatroomId;
    if (userId != null) result.userId = userId;
    return result;
  }

  ChatRoomUserRequest._();

  factory ChatRoomUserRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChatRoomUserRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChatRoomUserRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'services'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chatroomId')
    ..aOS(2, _omitFieldNames ? '' : 'userId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatRoomUserRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatRoomUserRequest copyWith(void Function(ChatRoomUserRequest) updates) =>
      super.copyWith((message) => updates(message as ChatRoomUserRequest))
          as ChatRoomUserRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatRoomUserRequest create() => ChatRoomUserRequest._();
  @$core.override
  ChatRoomUserRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChatRoomUserRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChatRoomUserRequest>(create);
  static ChatRoomUserRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get chatroomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chatroomId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChatroomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatroomId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => $_clearField(2);
}

class ChatRoomUsersRequest extends $pb.GeneratedMessage {
  factory ChatRoomUsersRequest({
    $core.String? chatroomId,
    $core.Iterable<$core.String>? userIds,
  }) {
    final result = create();
    if (chatroomId != null) result.chatroomId = chatroomId;
    if (userIds != null) result.userIds.addAll(userIds);
    return result;
  }

  ChatRoomUsersRequest._();

  factory ChatRoomUsersRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChatRoomUsersRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChatRoomUsersRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'services'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chatroomId')
    ..pPS(2, _omitFieldNames ? '' : 'userIds')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatRoomUsersRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatRoomUsersRequest copyWith(void Function(ChatRoomUsersRequest) updates) =>
      super.copyWith((message) => updates(message as ChatRoomUsersRequest))
          as ChatRoomUsersRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatRoomUsersRequest create() => ChatRoomUsersRequest._();
  @$core.override
  ChatRoomUsersRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChatRoomUsersRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChatRoomUsersRequest>(create);
  static ChatRoomUsersRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get chatroomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chatroomId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChatroomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatroomId() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get userIds => $_getList(1);
}

class ChatRoomBatchUsersRequest extends $pb.GeneratedMessage {
  factory ChatRoomBatchUsersRequest({
    $core.String? chatroomId,
    $7.BatchUsersRequest? batchRequest,
  }) {
    final result = create();
    if (chatroomId != null) result.chatroomId = chatroomId;
    if (batchRequest != null) result.batchRequest = batchRequest;
    return result;
  }

  ChatRoomBatchUsersRequest._();

  factory ChatRoomBatchUsersRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChatRoomBatchUsersRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChatRoomBatchUsersRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'services'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chatroomId')
    ..aOM<$7.BatchUsersRequest>(2, _omitFieldNames ? '' : 'batchRequest',
        subBuilder: $7.BatchUsersRequest.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatRoomBatchUsersRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatRoomBatchUsersRequest copyWith(
          void Function(ChatRoomBatchUsersRequest) updates) =>
      super.copyWith((message) => updates(message as ChatRoomBatchUsersRequest))
          as ChatRoomBatchUsersRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatRoomBatchUsersRequest create() => ChatRoomBatchUsersRequest._();
  @$core.override
  ChatRoomBatchUsersRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChatRoomBatchUsersRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChatRoomBatchUsersRequest>(create);
  static ChatRoomBatchUsersRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get chatroomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chatroomId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChatroomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatroomId() => $_clearField(1);

  @$pb.TagNumber(2)
  $7.BatchUsersRequest get batchRequest => $_getN(1);
  @$pb.TagNumber(2)
  set batchRequest($7.BatchUsersRequest value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasBatchRequest() => $_has(1);
  @$pb.TagNumber(2)
  void clearBatchRequest() => $_clearField(2);
  @$pb.TagNumber(2)
  $7.BatchUsersRequest ensureBatchRequest() => $_ensure(1);
}

class ChatRoomWhitelistUsersRequest extends $pb.GeneratedMessage {
  factory ChatRoomWhitelistUsersRequest({
    $core.String? chatroomId,
    $7.WhitelistUsersRequest? whitelistRequest,
  }) {
    final result = create();
    if (chatroomId != null) result.chatroomId = chatroomId;
    if (whitelistRequest != null) result.whitelistRequest = whitelistRequest;
    return result;
  }

  ChatRoomWhitelistUsersRequest._();

  factory ChatRoomWhitelistUsersRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChatRoomWhitelistUsersRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChatRoomWhitelistUsersRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'services'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chatroomId')
    ..aOM<$7.WhitelistUsersRequest>(
        2, _omitFieldNames ? '' : 'whitelistRequest',
        subBuilder: $7.WhitelistUsersRequest.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatRoomWhitelistUsersRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatRoomWhitelistUsersRequest copyWith(
          void Function(ChatRoomWhitelistUsersRequest) updates) =>
      super.copyWith(
              (message) => updates(message as ChatRoomWhitelistUsersRequest))
          as ChatRoomWhitelistUsersRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatRoomWhitelistUsersRequest create() =>
      ChatRoomWhitelistUsersRequest._();
  @$core.override
  ChatRoomWhitelistUsersRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChatRoomWhitelistUsersRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChatRoomWhitelistUsersRequest>(create);
  static ChatRoomWhitelistUsersRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get chatroomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chatroomId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChatroomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatroomId() => $_clearField(1);

  @$pb.TagNumber(2)
  $7.WhitelistUsersRequest get whitelistRequest => $_getN(1);
  @$pb.TagNumber(2)
  set whitelistRequest($7.WhitelistUsersRequest value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasWhitelistRequest() => $_has(1);
  @$pb.TagNumber(2)
  void clearWhitelistRequest() => $_clearField(2);
  @$pb.TagNumber(2)
  $7.WhitelistUsersRequest ensureWhitelistRequest() => $_ensure(1);
}

class ChatRoomAttributeRequest extends $pb.GeneratedMessage {
  factory ChatRoomAttributeRequest({
    $core.String? chatroomId,
    $7.ChatRoomAttributeRequest? attributeRequest,
  }) {
    final result = create();
    if (chatroomId != null) result.chatroomId = chatroomId;
    if (attributeRequest != null) result.attributeRequest = attributeRequest;
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
      package: const $pb.PackageName(_omitMessageNames ? '' : 'services'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chatroomId')
    ..aOM<$7.ChatRoomAttributeRequest>(
        2, _omitFieldNames ? '' : 'attributeRequest',
        subBuilder: $7.ChatRoomAttributeRequest.create)
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
  $core.String get chatroomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chatroomId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChatroomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatroomId() => $_clearField(1);

  @$pb.TagNumber(2)
  $7.ChatRoomAttributeRequest get attributeRequest => $_getN(1);
  @$pb.TagNumber(2)
  set attributeRequest($7.ChatRoomAttributeRequest value) =>
      $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasAttributeRequest() => $_has(1);
  @$pb.TagNumber(2)
  void clearAttributeRequest() => $_clearField(2);
  @$pb.TagNumber(2)
  $7.ChatRoomAttributeRequest ensureAttributeRequest() => $_ensure(1);
}

class ChatRoomBanAllRequest extends $pb.GeneratedMessage {
  factory ChatRoomBanAllRequest({
    $core.String? chatroomId,
    $7.BanAllUsersRequest? banRequest,
  }) {
    final result = create();
    if (chatroomId != null) result.chatroomId = chatroomId;
    if (banRequest != null) result.banRequest = banRequest;
    return result;
  }

  ChatRoomBanAllRequest._();

  factory ChatRoomBanAllRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChatRoomBanAllRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChatRoomBanAllRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'services'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chatroomId')
    ..aOM<$7.BanAllUsersRequest>(2, _omitFieldNames ? '' : 'banRequest',
        subBuilder: $7.BanAllUsersRequest.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatRoomBanAllRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatRoomBanAllRequest copyWith(
          void Function(ChatRoomBanAllRequest) updates) =>
      super.copyWith((message) => updates(message as ChatRoomBanAllRequest))
          as ChatRoomBanAllRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatRoomBanAllRequest create() => ChatRoomBanAllRequest._();
  @$core.override
  ChatRoomBanAllRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChatRoomBanAllRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChatRoomBanAllRequest>(create);
  static ChatRoomBanAllRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get chatroomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chatroomId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChatroomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatroomId() => $_clearField(1);

  @$pb.TagNumber(2)
  $7.BanAllUsersRequest get banRequest => $_getN(1);
  @$pb.TagNumber(2)
  set banRequest($7.BanAllUsersRequest value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasBanRequest() => $_has(1);
  @$pb.TagNumber(2)
  void clearBanRequest() => $_clearField(2);
  @$pb.TagNumber(2)
  $7.BanAllUsersRequest ensureBanRequest() => $_ensure(1);
}

class ChatRoomBanWhitelistUsersRequest extends $pb.GeneratedMessage {
  factory ChatRoomBanWhitelistUsersRequest({
    $core.String? chatroomId,
    $7.BanWhitelistUsersRequest? whitelistRequest,
  }) {
    final result = create();
    if (chatroomId != null) result.chatroomId = chatroomId;
    if (whitelistRequest != null) result.whitelistRequest = whitelistRequest;
    return result;
  }

  ChatRoomBanWhitelistUsersRequest._();

  factory ChatRoomBanWhitelistUsersRequest.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChatRoomBanWhitelistUsersRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChatRoomBanWhitelistUsersRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'services'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chatroomId')
    ..aOM<$7.BanWhitelistUsersRequest>(
        2, _omitFieldNames ? '' : 'whitelistRequest',
        subBuilder: $7.BanWhitelistUsersRequest.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatRoomBanWhitelistUsersRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatRoomBanWhitelistUsersRequest copyWith(
          void Function(ChatRoomBanWhitelistUsersRequest) updates) =>
      super.copyWith(
              (message) => updates(message as ChatRoomBanWhitelistUsersRequest))
          as ChatRoomBanWhitelistUsersRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatRoomBanWhitelistUsersRequest create() =>
      ChatRoomBanWhitelistUsersRequest._();
  @$core.override
  ChatRoomBanWhitelistUsersRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChatRoomBanWhitelistUsersRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChatRoomBanWhitelistUsersRequest>(
          create);
  static ChatRoomBanWhitelistUsersRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get chatroomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chatroomId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChatroomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatroomId() => $_clearField(1);

  @$pb.TagNumber(2)
  $7.BanWhitelistUsersRequest get whitelistRequest => $_getN(1);
  @$pb.TagNumber(2)
  set whitelistRequest($7.BanWhitelistUsersRequest value) =>
      $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasWhitelistRequest() => $_has(1);
  @$pb.TagNumber(2)
  void clearWhitelistRequest() => $_clearField(2);
  @$pb.TagNumber(2)
  $7.BanWhitelistUsersRequest ensureWhitelistRequest() => $_ensure(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

// This is a generated file - do not edit.
//
// Generated from messages/wallet.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// 充值请求
class RechargeRequest extends $pb.GeneratedMessage {
  factory RechargeRequest({
    $fixnum.Int64? amount,
  }) {
    final result = create();
    if (amount != null) result.amount = amount;
    return result;
  }

  RechargeRequest._();

  factory RechargeRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RechargeRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RechargeRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'messages'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'amount')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RechargeRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RechargeRequest copyWith(void Function(RechargeRequest) updates) =>
      super.copyWith((message) => updates(message as RechargeRequest))
          as RechargeRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RechargeRequest create() => RechargeRequest._();
  @$core.override
  RechargeRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RechargeRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RechargeRequest>(create);
  static RechargeRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get amount => $_getI64(0);
  @$pb.TagNumber(1)
  set amount($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAmount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAmount() => $_clearField(1);
}

/// 发送礼物请求
class SendGiftRequest extends $pb.GeneratedMessage {
  factory SendGiftRequest({
    $core.String? toUserId,
    $core.String? giftId,
  }) {
    final result = create();
    if (toUserId != null) result.toUserId = toUserId;
    if (giftId != null) result.giftId = giftId;
    return result;
  }

  SendGiftRequest._();

  factory SendGiftRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SendGiftRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SendGiftRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'messages'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'toUserId')
    ..aOS(2, _omitFieldNames ? '' : 'giftId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendGiftRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendGiftRequest copyWith(void Function(SendGiftRequest) updates) =>
      super.copyWith((message) => updates(message as SendGiftRequest))
          as SendGiftRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SendGiftRequest create() => SendGiftRequest._();
  @$core.override
  SendGiftRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SendGiftRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SendGiftRequest>(create);
  static SendGiftRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get toUserId => $_getSZ(0);
  @$pb.TagNumber(1)
  set toUserId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasToUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearToUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get giftId => $_getSZ(1);
  @$pb.TagNumber(2)
  set giftId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGiftId() => $_has(1);
  @$pb.TagNumber(2)
  void clearGiftId() => $_clearField(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

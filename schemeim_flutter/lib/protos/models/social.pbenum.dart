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

/// 好友关系状态枚举
class FriendStatus extends $pb.ProtobufEnum {
  static const FriendStatus FRIEND_STATUS_REQUESTED =
      FriendStatus._(0, _omitEnumNames ? '' : 'FRIEND_STATUS_REQUESTED');
  static const FriendStatus FRIEND_STATUS_ACCEPTED =
      FriendStatus._(1, _omitEnumNames ? '' : 'FRIEND_STATUS_ACCEPTED');

  static const $core.List<FriendStatus> values = <FriendStatus>[
    FRIEND_STATUS_REQUESTED,
    FRIEND_STATUS_ACCEPTED,
  ];

  static final $core.List<FriendStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static FriendStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const FriendStatus._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');

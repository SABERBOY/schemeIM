// This is a generated file - do not edit.
//
// Generated from messages/social.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports
// ignore_for_file: unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use addFriendRequestDescriptor instead')
const AddFriendRequest$json = {
  '1': 'AddFriendRequest',
  '2': [
    {'1': 'target_id', '3': 1, '4': 1, '5': 9, '10': 'targetId'},
  ],
};

/// Descriptor for `AddFriendRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addFriendRequestDescriptor = $convert.base64Decode(
    'ChBBZGRGcmllbmRSZXF1ZXN0EhsKCXRhcmdldF9pZBgBIAEoCVIIdGFyZ2V0SWQ=');

@$core.Deprecated('Use followRequestDescriptor instead')
const FollowRequest$json = {
  '1': 'FollowRequest',
  '2': [
    {'1': 'target_id', '3': 1, '4': 1, '5': 9, '10': 'targetId'},
    {'1': 'action', '3': 2, '4': 1, '5': 9, '10': 'action'},
  ],
};

/// Descriptor for `FollowRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List followRequestDescriptor = $convert.base64Decode(
    'Cg1Gb2xsb3dSZXF1ZXN0EhsKCXRhcmdldF9pZBgBIAEoCVIIdGFyZ2V0SWQSFgoGYWN0aW9uGA'
    'IgASgJUgZhY3Rpb24=');

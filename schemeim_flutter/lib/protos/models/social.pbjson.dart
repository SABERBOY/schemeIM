// This is a generated file - do not edit.
//
// Generated from models/social.proto.

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

@$core.Deprecated('Use friendStatusDescriptor instead')
const FriendStatus$json = {
  '1': 'FriendStatus',
  '2': [
    {'1': 'FRIEND_STATUS_REQUESTED', '2': 0},
    {'1': 'FRIEND_STATUS_ACCEPTED', '2': 1},
  ],
};

/// Descriptor for `FriendStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List friendStatusDescriptor = $convert.base64Decode(
    'CgxGcmllbmRTdGF0dXMSGwoXRlJJRU5EX1NUQVRVU19SRVFVRVNURUQQABIaChZGUklFTkRfU1'
    'RBVFVTX0FDQ0VQVEVEEAE=');

@$core.Deprecated('Use friendDescriptor instead')
const Friend$json = {
  '1': 'Friend',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'friend_id', '3': 2, '4': 1, '5': 9, '10': 'friendId'},
    {
      '1': 'status',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.models.FriendStatus',
      '10': 'status'
    },
    {
      '1': 'created_at',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'createdAt'
    },
    {
      '1': 'updated_at',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'updatedAt'
    },
  ],
};

/// Descriptor for `Friend`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List friendDescriptor = $convert.base64Decode(
    'CgZGcmllbmQSFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklkEhsKCWZyaWVuZF9pZBgCIAEoCVIIZn'
    'JpZW5kSWQSLAoGc3RhdHVzGAMgASgOMhQubW9kZWxzLkZyaWVuZFN0YXR1c1IGc3RhdHVzEjkK'
    'CmNyZWF0ZWRfYXQYBCABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgljcmVhdGVkQX'
    'QSOQoKdXBkYXRlZF9hdBgFIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCXVwZGF0'
    'ZWRBdA==');

@$core.Deprecated('Use followDescriptor instead')
const Follow$json = {
  '1': 'Follow',
  '2': [
    {'1': 'follower_id', '3': 1, '4': 1, '5': 9, '10': 'followerId'},
    {'1': 'following_id', '3': 2, '4': 1, '5': 9, '10': 'followingId'},
    {
      '1': 'created_at',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'createdAt'
    },
  ],
};

/// Descriptor for `Follow`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List followDescriptor = $convert.base64Decode(
    'CgZGb2xsb3cSHwoLZm9sbG93ZXJfaWQYASABKAlSCmZvbGxvd2VySWQSIQoMZm9sbG93aW5nX2'
    'lkGAIgASgJUgtmb2xsb3dpbmdJZBI5CgpjcmVhdGVkX2F0GAMgASgLMhouZ29vZ2xlLnByb3Rv'
    'YnVmLlRpbWVzdGFtcFIJY3JlYXRlZEF0');

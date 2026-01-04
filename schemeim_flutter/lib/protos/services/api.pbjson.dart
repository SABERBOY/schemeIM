// This is a generated file - do not edit.
//
// Generated from services/api.proto.

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

@$core.Deprecated('Use chatRoomIdRequestDescriptor instead')
const ChatRoomIdRequest$json = {
  '1': 'ChatRoomIdRequest',
  '2': [
    {'1': 'chatroom_id', '3': 1, '4': 1, '5': 9, '10': 'chatroomId'},
  ],
};

/// Descriptor for `ChatRoomIdRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatRoomIdRequestDescriptor = $convert.base64Decode(
    'ChFDaGF0Um9vbUlkUmVxdWVzdBIfCgtjaGF0cm9vbV9pZBgBIAEoCVIKY2hhdHJvb21JZA==');

@$core.Deprecated('Use chatRoomMicRequestDescriptor instead')
const ChatRoomMicRequest$json = {
  '1': 'ChatRoomMicRequest',
  '2': [
    {'1': 'chatroom_id', '3': 1, '4': 1, '5': 9, '10': 'chatroomId'},
    {
      '1': 'mic_request',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.messages.MicRequest',
      '10': 'micRequest'
    },
  ],
};

/// Descriptor for `ChatRoomMicRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatRoomMicRequestDescriptor = $convert.base64Decode(
    'ChJDaGF0Um9vbU1pY1JlcXVlc3QSHwoLY2hhdHJvb21faWQYASABKAlSCmNoYXRyb29tSWQSNQ'
    'oLbWljX3JlcXVlc3QYAiABKAsyFC5tZXNzYWdlcy5NaWNSZXF1ZXN0UgptaWNSZXF1ZXN0');

@$core.Deprecated('Use chatRoomUserRequestDescriptor instead')
const ChatRoomUserRequest$json = {
  '1': 'ChatRoomUserRequest',
  '2': [
    {'1': 'chatroom_id', '3': 1, '4': 1, '5': 9, '10': 'chatroomId'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `ChatRoomUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatRoomUserRequestDescriptor = $convert.base64Decode(
    'ChNDaGF0Um9vbVVzZXJSZXF1ZXN0Eh8KC2NoYXRyb29tX2lkGAEgASgJUgpjaGF0cm9vbUlkEh'
    'cKB3VzZXJfaWQYAiABKAlSBnVzZXJJZA==');

@$core.Deprecated('Use chatRoomUsersRequestDescriptor instead')
const ChatRoomUsersRequest$json = {
  '1': 'ChatRoomUsersRequest',
  '2': [
    {'1': 'chatroom_id', '3': 1, '4': 1, '5': 9, '10': 'chatroomId'},
    {'1': 'user_ids', '3': 2, '4': 3, '5': 9, '10': 'userIds'},
  ],
};

/// Descriptor for `ChatRoomUsersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatRoomUsersRequestDescriptor = $convert.base64Decode(
    'ChRDaGF0Um9vbVVzZXJzUmVxdWVzdBIfCgtjaGF0cm9vbV9pZBgBIAEoCVIKY2hhdHJvb21JZB'
    'IZCgh1c2VyX2lkcxgCIAMoCVIHdXNlcklkcw==');

@$core.Deprecated('Use chatRoomBatchUsersRequestDescriptor instead')
const ChatRoomBatchUsersRequest$json = {
  '1': 'ChatRoomBatchUsersRequest',
  '2': [
    {'1': 'chatroom_id', '3': 1, '4': 1, '5': 9, '10': 'chatroomId'},
    {
      '1': 'batch_request',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.messages.BatchUsersRequest',
      '10': 'batchRequest'
    },
  ],
};

/// Descriptor for `ChatRoomBatchUsersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatRoomBatchUsersRequestDescriptor = $convert.base64Decode(
    'ChlDaGF0Um9vbUJhdGNoVXNlcnNSZXF1ZXN0Eh8KC2NoYXRyb29tX2lkGAEgASgJUgpjaGF0cm'
    '9vbUlkEkAKDWJhdGNoX3JlcXVlc3QYAiABKAsyGy5tZXNzYWdlcy5CYXRjaFVzZXJzUmVxdWVz'
    'dFIMYmF0Y2hSZXF1ZXN0');

@$core.Deprecated('Use chatRoomWhitelistUsersRequestDescriptor instead')
const ChatRoomWhitelistUsersRequest$json = {
  '1': 'ChatRoomWhitelistUsersRequest',
  '2': [
    {'1': 'chatroom_id', '3': 1, '4': 1, '5': 9, '10': 'chatroomId'},
    {
      '1': 'whitelist_request',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.messages.WhitelistUsersRequest',
      '10': 'whitelistRequest'
    },
  ],
};

/// Descriptor for `ChatRoomWhitelistUsersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatRoomWhitelistUsersRequestDescriptor =
    $convert.base64Decode(
        'Ch1DaGF0Um9vbVdoaXRlbGlzdFVzZXJzUmVxdWVzdBIfCgtjaGF0cm9vbV9pZBgBIAEoCVIKY2'
        'hhdHJvb21JZBJMChF3aGl0ZWxpc3RfcmVxdWVzdBgCIAEoCzIfLm1lc3NhZ2VzLldoaXRlbGlz'
        'dFVzZXJzUmVxdWVzdFIQd2hpdGVsaXN0UmVxdWVzdA==');

@$core.Deprecated('Use chatRoomAttributeRequestDescriptor instead')
const ChatRoomAttributeRequest$json = {
  '1': 'ChatRoomAttributeRequest',
  '2': [
    {'1': 'chatroom_id', '3': 1, '4': 1, '5': 9, '10': 'chatroomId'},
    {
      '1': 'attribute_request',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.messages.ChatRoomAttributeRequest',
      '10': 'attributeRequest'
    },
  ],
};

/// Descriptor for `ChatRoomAttributeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatRoomAttributeRequestDescriptor = $convert.base64Decode(
    'ChhDaGF0Um9vbUF0dHJpYnV0ZVJlcXVlc3QSHwoLY2hhdHJvb21faWQYASABKAlSCmNoYXRyb2'
    '9tSWQSTwoRYXR0cmlidXRlX3JlcXVlc3QYAiABKAsyIi5tZXNzYWdlcy5DaGF0Um9vbUF0dHJp'
    'YnV0ZVJlcXVlc3RSEGF0dHJpYnV0ZVJlcXVlc3Q=');

@$core.Deprecated('Use chatRoomBanAllRequestDescriptor instead')
const ChatRoomBanAllRequest$json = {
  '1': 'ChatRoomBanAllRequest',
  '2': [
    {'1': 'chatroom_id', '3': 1, '4': 1, '5': 9, '10': 'chatroomId'},
    {
      '1': 'ban_request',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.messages.BanAllUsersRequest',
      '10': 'banRequest'
    },
  ],
};

/// Descriptor for `ChatRoomBanAllRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatRoomBanAllRequestDescriptor = $convert.base64Decode(
    'ChVDaGF0Um9vbUJhbkFsbFJlcXVlc3QSHwoLY2hhdHJvb21faWQYASABKAlSCmNoYXRyb29tSW'
    'QSPQoLYmFuX3JlcXVlc3QYAiABKAsyHC5tZXNzYWdlcy5CYW5BbGxVc2Vyc1JlcXVlc3RSCmJh'
    'blJlcXVlc3Q=');

@$core.Deprecated('Use chatRoomBanWhitelistUsersRequestDescriptor instead')
const ChatRoomBanWhitelistUsersRequest$json = {
  '1': 'ChatRoomBanWhitelistUsersRequest',
  '2': [
    {'1': 'chatroom_id', '3': 1, '4': 1, '5': 9, '10': 'chatroomId'},
    {
      '1': 'whitelist_request',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.messages.BanWhitelistUsersRequest',
      '10': 'whitelistRequest'
    },
  ],
};

/// Descriptor for `ChatRoomBanWhitelistUsersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatRoomBanWhitelistUsersRequestDescriptor =
    $convert.base64Decode(
        'CiBDaGF0Um9vbUJhbldoaXRlbGlzdFVzZXJzUmVxdWVzdBIfCgtjaGF0cm9vbV9pZBgBIAEoCV'
        'IKY2hhdHJvb21JZBJPChF3aGl0ZWxpc3RfcmVxdWVzdBgCIAEoCzIiLm1lc3NhZ2VzLkJhbldo'
        'aXRlbGlzdFVzZXJzUmVxdWVzdFIQd2hpdGVsaXN0UmVxdWVzdA==');

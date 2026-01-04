// This is a generated file - do not edit.
//
// Generated from messages/chatroom.proto.

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

@$core.Deprecated('Use chatRoomCreateRequestDescriptor instead')
const ChatRoomCreateRequest$json = {
  '1': 'ChatRoomCreateRequest',
  '2': [
    {'1': 'chatroom_id', '3': 1, '4': 1, '5': 9, '10': 'chatroomId'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'host_id', '3': 3, '4': 1, '5': 9, '10': 'hostId'},
    {'1': 'tags', '3': 4, '4': 1, '5': 9, '10': 'tags'},
    {'1': 'country_flag', '3': 5, '4': 1, '5': 9, '10': 'countryFlag'},
    {'1': 'description', '3': 6, '4': 1, '5': 9, '10': 'description'},
    {'1': 'destroy_type', '3': 7, '4': 1, '5': 5, '10': 'destroyType'},
    {'1': 'destroy_time', '3': 8, '4': 1, '5': 5, '10': 'destroyTime'},
    {'1': 'is_ban', '3': 9, '4': 1, '5': 8, '10': 'isBan'},
    {'1': 'white_user_ids', '3': 10, '4': 3, '5': 9, '10': 'whiteUserIds'},
    {'1': 'need_notify', '3': 11, '4': 1, '5': 8, '10': 'needNotify'},
    {'1': 'extra', '3': 12, '4': 1, '5': 9, '10': 'extra'},
  ],
};

/// Descriptor for `ChatRoomCreateRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatRoomCreateRequestDescriptor = $convert.base64Decode(
    'ChVDaGF0Um9vbUNyZWF0ZVJlcXVlc3QSHwoLY2hhdHJvb21faWQYASABKAlSCmNoYXRyb29tSW'
    'QSEgoEbmFtZRgCIAEoCVIEbmFtZRIXCgdob3N0X2lkGAMgASgJUgZob3N0SWQSEgoEdGFncxgE'
    'IAEoCVIEdGFncxIhCgxjb3VudHJ5X2ZsYWcYBSABKAlSC2NvdW50cnlGbGFnEiAKC2Rlc2NyaX'
    'B0aW9uGAYgASgJUgtkZXNjcmlwdGlvbhIhCgxkZXN0cm95X3R5cGUYByABKAVSC2Rlc3Ryb3lU'
    'eXBlEiEKDGRlc3Ryb3lfdGltZRgIIAEoBVILZGVzdHJveVRpbWUSFQoGaXNfYmFuGAkgASgIUg'
    'Vpc0JhbhIkCg53aGl0ZV91c2VyX2lkcxgKIAMoCVIMd2hpdGVVc2VySWRzEh8KC25lZWRfbm90'
    'aWZ5GAsgASgIUgpuZWVkTm90aWZ5EhQKBWV4dHJhGAwgASgJUgVleHRyYQ==');

@$core.Deprecated('Use micRequestDescriptor instead')
const MicRequest$json = {
  '1': 'MicRequest',
  '2': [
    {'1': 'position', '3': 1, '4': 1, '5': 5, '10': 'position'},
    {'1': 'action', '3': 2, '4': 1, '5': 9, '10': 'action'},
  ],
};

/// Descriptor for `MicRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List micRequestDescriptor = $convert.base64Decode(
    'CgpNaWNSZXF1ZXN0EhoKCHBvc2l0aW9uGAEgASgFUghwb3NpdGlvbhIWCgZhY3Rpb24YAiABKA'
    'lSBmFjdGlvbg==');

@$core.Deprecated('Use batchUsersRequestDescriptor instead')
const BatchUsersRequest$json = {
  '1': 'BatchUsersRequest',
  '2': [
    {'1': 'user_ids', '3': 1, '4': 3, '5': 9, '10': 'userIds'},
    {'1': 'minute', '3': 2, '4': 1, '5': 13, '10': 'minute'},
    {'1': 'need_notify', '3': 3, '4': 1, '5': 8, '10': 'needNotify'},
    {'1': 'extra', '3': 4, '4': 1, '5': 9, '10': 'extra'},
  ],
};

/// Descriptor for `BatchUsersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List batchUsersRequestDescriptor = $convert.base64Decode(
    'ChFCYXRjaFVzZXJzUmVxdWVzdBIZCgh1c2VyX2lkcxgBIAMoCVIHdXNlcklkcxIWCgZtaW51dG'
    'UYAiABKA1SBm1pbnV0ZRIfCgtuZWVkX25vdGlmeRgDIAEoCFIKbmVlZE5vdGlmeRIUCgVleHRy'
    'YRgEIAEoCVIFZXh0cmE=');

@$core.Deprecated('Use messageDemotionRequestDescriptor instead')
const MessageDemotionRequest$json = {
  '1': 'MessageDemotionRequest',
  '2': [
    {'1': 'object_names', '3': 1, '4': 3, '5': 9, '10': 'objectNames'},
  ],
};

/// Descriptor for `MessageDemotionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageDemotionRequestDescriptor =
    $convert.base64Decode(
        'ChZNZXNzYWdlRGVtb3Rpb25SZXF1ZXN0EiEKDG9iamVjdF9uYW1lcxgBIAMoCVILb2JqZWN0Tm'
        'FtZXM=');

@$core.Deprecated('Use whitelistMessageTypeRequestDescriptor instead')
const WhitelistMessageTypeRequest$json = {
  '1': 'WhitelistMessageTypeRequest',
  '2': [
    {'1': 'object_names', '3': 1, '4': 3, '5': 9, '10': 'objectNames'},
  ],
};

/// Descriptor for `WhitelistMessageTypeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List whitelistMessageTypeRequestDescriptor =
    $convert.base64Decode(
        'ChtXaGl0ZWxpc3RNZXNzYWdlVHlwZVJlcXVlc3QSIQoMb2JqZWN0X25hbWVzGAEgAygJUgtvYm'
        'plY3ROYW1lcw==');

@$core.Deprecated('Use whitelistUsersRequestDescriptor instead')
const WhitelistUsersRequest$json = {
  '1': 'WhitelistUsersRequest',
  '2': [
    {'1': 'user_ids', '3': 1, '4': 3, '5': 9, '10': 'userIds'},
  ],
};

/// Descriptor for `WhitelistUsersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List whitelistUsersRequestDescriptor =
    $convert.base64Decode(
        'ChVXaGl0ZWxpc3RVc2Vyc1JlcXVlc3QSGQoIdXNlcl9pZHMYASADKAlSB3VzZXJJZHM=');

@$core.Deprecated('Use chatRoomAttributeRequestDescriptor instead')
const ChatRoomAttributeRequest$json = {
  '1': 'ChatRoomAttributeRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'key', '3': 2, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 3, '4': 1, '5': 9, '10': 'value'},
    {'1': 'auto_delete', '3': 4, '4': 1, '5': 5, '10': 'autoDelete'},
  ],
};

/// Descriptor for `ChatRoomAttributeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatRoomAttributeRequestDescriptor = $convert.base64Decode(
    'ChhDaGF0Um9vbUF0dHJpYnV0ZVJlcXVlc3QSFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklkEhAKA2'
    'tleRgCIAEoCVIDa2V5EhQKBXZhbHVlGAMgASgJUgV2YWx1ZRIfCgthdXRvX2RlbGV0ZRgEIAEo'
    'BVIKYXV0b0RlbGV0ZQ==');

@$core.Deprecated('Use banAllUsersRequestDescriptor instead')
const BanAllUsersRequest$json = {
  '1': 'BanAllUsersRequest',
  '2': [
    {'1': 'need_notify', '3': 1, '4': 1, '5': 8, '10': 'needNotify'},
    {'1': 'extra', '3': 2, '4': 1, '5': 9, '10': 'extra'},
  ],
};

/// Descriptor for `BanAllUsersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List banAllUsersRequestDescriptor = $convert.base64Decode(
    'ChJCYW5BbGxVc2Vyc1JlcXVlc3QSHwoLbmVlZF9ub3RpZnkYASABKAhSCm5lZWROb3RpZnkSFA'
    'oFZXh0cmEYAiABKAlSBWV4dHJh');

@$core.Deprecated('Use banWhitelistUsersRequestDescriptor instead')
const BanWhitelistUsersRequest$json = {
  '1': 'BanWhitelistUsersRequest',
  '2': [
    {'1': 'user_ids', '3': 1, '4': 3, '5': 9, '10': 'userIds'},
    {'1': 'need_notify', '3': 2, '4': 1, '5': 8, '10': 'needNotify'},
    {'1': 'extra', '3': 3, '4': 1, '5': 9, '10': 'extra'},
  ],
};

/// Descriptor for `BanWhitelistUsersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List banWhitelistUsersRequestDescriptor =
    $convert.base64Decode(
        'ChhCYW5XaGl0ZWxpc3RVc2Vyc1JlcXVlc3QSGQoIdXNlcl9pZHMYASADKAlSB3VzZXJJZHMSHw'
        'oLbmVlZF9ub3RpZnkYAiABKAhSCm5lZWROb3RpZnkSFAoFZXh0cmEYAyABKAlSBWV4dHJh');

@$core.Deprecated('Use queryChatRoomsRequestDescriptor instead')
const QueryChatRoomsRequest$json = {
  '1': 'QueryChatRoomsRequest',
};

/// Descriptor for `QueryChatRoomsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryChatRoomsRequestDescriptor =
    $convert.base64Decode('ChVRdWVyeUNoYXRSb29tc1JlcXVlc3Q=');

@$core.Deprecated('Use chatRoomListResponseDescriptor instead')
const ChatRoomListResponse$json = {
  '1': 'ChatRoomListResponse',
  '2': [
    {'1': 'list', '3': 1, '4': 3, '5': 11, '6': '.models.Room', '10': 'list'},
    {'1': 'total', '3': 2, '4': 1, '5': 3, '10': 'total'},
  ],
};

/// Descriptor for `ChatRoomListResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatRoomListResponseDescriptor = $convert.base64Decode(
    'ChRDaGF0Um9vbUxpc3RSZXNwb25zZRIgCgRsaXN0GAEgAygLMgwubW9kZWxzLlJvb21SBGxpc3'
    'QSFAoFdG90YWwYAiABKANSBXRvdGFs');

@$core.Deprecated('Use userListResponseDescriptor instead')
const UserListResponse$json = {
  '1': 'UserListResponse',
  '2': [
    {'1': 'list', '3': 1, '4': 3, '5': 11, '6': '.models.User', '10': 'list'},
    {'1': 'total', '3': 2, '4': 1, '5': 3, '10': 'total'},
  ],
};

/// Descriptor for `UserListResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userListResponseDescriptor = $convert.base64Decode(
    'ChBVc2VyTGlzdFJlc3BvbnNlEiAKBGxpc3QYASADKAsyDC5tb2RlbHMuVXNlclIEbGlzdBIUCg'
    'V0b3RhbBgCIAEoA1IFdG90YWw=');

@$core.Deprecated('Use stringListResponseDescriptor instead')
const StringListResponse$json = {
  '1': 'StringListResponse',
  '2': [
    {'1': 'list', '3': 1, '4': 3, '5': 9, '10': 'list'},
  ],
};

/// Descriptor for `StringListResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stringListResponseDescriptor = $convert
    .base64Decode('ChJTdHJpbmdMaXN0UmVzcG9uc2USEgoEbGlzdBgBIAMoCVIEbGlzdA==');

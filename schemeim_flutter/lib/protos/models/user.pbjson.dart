// This is a generated file - do not edit.
//
// Generated from models/user.proto.

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

@$core.Deprecated('Use userDescriptor instead')
const User$json = {
  '1': 'User',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'phone_number', '3': 2, '4': 1, '5': 9, '10': 'phoneNumber'},
    {'1': 'display_name', '3': 3, '4': 1, '5': 9, '10': 'displayName'},
    {'1': 'avatar_url', '3': 4, '4': 1, '5': 9, '10': 'avatarUrl'},
    {'1': 'frame_url', '3': 5, '4': 1, '5': 9, '10': 'frameUrl'},
    {'1': 'gold_balance', '3': 6, '4': 1, '5': 3, '10': 'goldBalance'},
    {'1': 'level', '3': 7, '4': 1, '5': 5, '10': 'level'},
    {'1': 'is_verified', '3': 8, '4': 1, '5': 8, '10': 'isVerified'},
    {'1': 'rank_name', '3': 9, '4': 1, '5': 9, '10': 'rankName'},
    {'1': 'rank_color_hex', '3': 10, '4': 1, '5': 9, '10': 'rankColorHex'},
    {
      '1': 'created_at',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'createdAt'
    },
    {
      '1': 'updated_at',
      '3': 12,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'updatedAt'
    },
  ],
};

/// Descriptor for `User`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userDescriptor = $convert.base64Decode(
    'CgRVc2VyEg4KAmlkGAEgASgJUgJpZBIhCgxwaG9uZV9udW1iZXIYAiABKAlSC3Bob25lTnVtYm'
    'VyEiEKDGRpc3BsYXlfbmFtZRgDIAEoCVILZGlzcGxheU5hbWUSHQoKYXZhdGFyX3VybBgEIAEo'
    'CVIJYXZhdGFyVXJsEhsKCWZyYW1lX3VybBgFIAEoCVIIZnJhbWVVcmwSIQoMZ29sZF9iYWxhbm'
    'NlGAYgASgDUgtnb2xkQmFsYW5jZRIUCgVsZXZlbBgHIAEoBVIFbGV2ZWwSHwoLaXNfdmVyaWZp'
    'ZWQYCCABKAhSCmlzVmVyaWZpZWQSGwoJcmFua19uYW1lGAkgASgJUghyYW5rTmFtZRIkCg5yYW'
    '5rX2NvbG9yX2hleBgKIAEoCVIMcmFua0NvbG9ySGV4EjkKCmNyZWF0ZWRfYXQYCyABKAsyGi5n'
    'b29nbGUucHJvdG9idWYuVGltZXN0YW1wUgljcmVhdGVkQXQSOQoKdXBkYXRlZF9hdBgMIAEoCz'
    'IaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCXVwZGF0ZWRBdA==');

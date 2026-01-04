// This is a generated file - do not edit.
//
// Generated from models/room.proto.

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

@$core.Deprecated('Use roomDescriptor instead')
const Room$json = {
  '1': 'Room',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    {'1': 'country_flag', '3': 3, '4': 1, '5': 9, '10': 'countryFlag'},
    {'1': 'tags', '3': 4, '4': 1, '5': 9, '10': 'tags'},
    {'1': 'host_id', '3': 5, '4': 1, '5': 9, '10': 'hostId'},
    {'1': 'host', '3': 6, '4': 1, '5': 11, '6': '.models.User', '10': 'host'},
    {'1': 'description', '3': 7, '4': 1, '5': 9, '10': 'description'},
    {'1': 'online_count', '3': 8, '4': 1, '5': 5, '10': 'onlineCount'},
    {
      '1': 'created_at',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'createdAt'
    },
    {
      '1': 'updated_at',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'updatedAt'
    },
  ],
};

/// Descriptor for `Room`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roomDescriptor = $convert.base64Decode(
    'CgRSb29tEg4KAmlkGAEgASgJUgJpZBIUCgV0aXRsZRgCIAEoCVIFdGl0bGUSIQoMY291bnRyeV'
    '9mbGFnGAMgASgJUgtjb3VudHJ5RmxhZxISCgR0YWdzGAQgASgJUgR0YWdzEhcKB2hvc3RfaWQY'
    'BSABKAlSBmhvc3RJZBIgCgRob3N0GAYgASgLMgwubW9kZWxzLlVzZXJSBGhvc3QSIAoLZGVzY3'
    'JpcHRpb24YByABKAlSC2Rlc2NyaXB0aW9uEiEKDG9ubGluZV9jb3VudBgIIAEoBVILb25saW5l'
    'Q291bnQSOQoKY3JlYXRlZF9hdBgJIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCW'
    'NyZWF0ZWRBdBI5Cgp1cGRhdGVkX2F0GAogASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFt'
    'cFIJdXBkYXRlZEF0');

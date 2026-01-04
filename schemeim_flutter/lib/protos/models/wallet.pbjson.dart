// This is a generated file - do not edit.
//
// Generated from models/wallet.proto.

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

@$core.Deprecated('Use walletDescriptor instead')
const Wallet$json = {
  '1': 'Wallet',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'coins', '3': 2, '4': 1, '5': 3, '10': 'coins'},
    {'1': 'diamonds', '3': 3, '4': 1, '5': 3, '10': 'diamonds'},
    {
      '1': 'updated_at',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'updatedAt'
    },
  ],
};

/// Descriptor for `Wallet`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List walletDescriptor = $convert.base64Decode(
    'CgZXYWxsZXQSFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklkEhQKBWNvaW5zGAIgASgDUgVjb2lucx'
    'IaCghkaWFtb25kcxgDIAEoA1IIZGlhbW9uZHMSOQoKdXBkYXRlZF9hdBgEIAEoCzIaLmdvb2ds'
    'ZS5wcm90b2J1Zi5UaW1lc3RhbXBSCXVwZGF0ZWRBdA==');

@$core.Deprecated('Use giftDescriptor instead')
const Gift$json = {
  '1': 'Gift',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'price_diamonds', '3': 3, '4': 1, '5': 3, '10': 'priceDiamonds'},
    {'1': 'icon_url', '3': 4, '4': 1, '5': 9, '10': 'iconUrl'},
    {'1': 'animation_url', '3': 5, '4': 1, '5': 9, '10': 'animationUrl'},
    {
      '1': 'created_at',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'createdAt'
    },
    {
      '1': 'updated_at',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'updatedAt'
    },
  ],
};

/// Descriptor for `Gift`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List giftDescriptor = $convert.base64Decode(
    'CgRHaWZ0Eg4KAmlkGAEgASgJUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEiUKDnByaWNlX2RpYW'
    '1vbmRzGAMgASgDUg1wcmljZURpYW1vbmRzEhkKCGljb25fdXJsGAQgASgJUgdpY29uVXJsEiMK'
    'DWFuaW1hdGlvbl91cmwYBSABKAlSDGFuaW1hdGlvblVybBI5CgpjcmVhdGVkX2F0GAYgASgLMh'
    'ouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJY3JlYXRlZEF0EjkKCnVwZGF0ZWRfYXQYByAB'
    'KAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgl1cGRhdGVkQXQ=');

@$core.Deprecated('Use transactionDescriptor instead')
const Transaction$json = {
  '1': 'Transaction',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'type', '3': 3, '4': 1, '5': 9, '10': 'type'},
    {'1': 'amount', '3': 4, '4': 1, '5': 3, '10': 'amount'},
    {'1': 'currency', '3': 5, '4': 1, '5': 9, '10': 'currency'},
    {'1': 'related_id', '3': 6, '4': 1, '5': 9, '10': 'relatedId'},
    {
      '1': 'created_at',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'createdAt'
    },
  ],
};

/// Descriptor for `Transaction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transactionDescriptor = $convert.base64Decode(
    'CgtUcmFuc2FjdGlvbhIOCgJpZBgBIAEoCVICaWQSFwoHdXNlcl9pZBgCIAEoCVIGdXNlcklkEh'
    'IKBHR5cGUYAyABKAlSBHR5cGUSFgoGYW1vdW50GAQgASgDUgZhbW91bnQSGgoIY3VycmVuY3kY'
    'BSABKAlSCGN1cnJlbmN5Eh0KCnJlbGF0ZWRfaWQYBiABKAlSCXJlbGF0ZWRJZBI5CgpjcmVhdG'
    'VkX2F0GAcgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJY3JlYXRlZEF0');

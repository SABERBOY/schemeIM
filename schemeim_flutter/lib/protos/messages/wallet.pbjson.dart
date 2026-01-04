// This is a generated file - do not edit.
//
// Generated from messages/wallet.proto.

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

@$core.Deprecated('Use rechargeRequestDescriptor instead')
const RechargeRequest$json = {
  '1': 'RechargeRequest',
  '2': [
    {'1': 'amount', '3': 1, '4': 1, '5': 3, '10': 'amount'},
  ],
};

/// Descriptor for `RechargeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rechargeRequestDescriptor = $convert
    .base64Decode('Cg9SZWNoYXJnZVJlcXVlc3QSFgoGYW1vdW50GAEgASgDUgZhbW91bnQ=');

@$core.Deprecated('Use sendGiftRequestDescriptor instead')
const SendGiftRequest$json = {
  '1': 'SendGiftRequest',
  '2': [
    {'1': 'to_user_id', '3': 1, '4': 1, '5': 9, '10': 'toUserId'},
    {'1': 'gift_id', '3': 2, '4': 1, '5': 9, '10': 'giftId'},
  ],
};

/// Descriptor for `SendGiftRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendGiftRequestDescriptor = $convert.base64Decode(
    'Cg9TZW5kR2lmdFJlcXVlc3QSHAoKdG9fdXNlcl9pZBgBIAEoCVIIdG9Vc2VySWQSFwoHZ2lmdF'
    '9pZBgCIAEoCVIGZ2lmdElk');

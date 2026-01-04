// This is a generated file - do not edit.
//
// Generated from models/game.proto.

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

@$core.Deprecated('Use gameTableStatusDescriptor instead')
const GameTableStatus$json = {
  '1': 'GameTableStatus',
  '2': [
    {'1': 'GAME_TABLE_STATUS_WAITING', '2': 0},
    {'1': 'GAME_TABLE_STATUS_PLAYING', '2': 1},
    {'1': 'GAME_TABLE_STATUS_FINISHED', '2': 2},
  ],
};

/// Descriptor for `GameTableStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List gameTableStatusDescriptor = $convert.base64Decode(
    'Cg9HYW1lVGFibGVTdGF0dXMSHQoZR0FNRV9UQUJMRV9TVEFUVVNfV0FJVElORxAAEh0KGUdBTU'
    'VfVEFCTEVfU1RBVFVTX1BMQVlJTkcQARIeChpHQU1FX1RBQkxFX1NUQVRVU19GSU5JU0hFRBAC');

@$core.Deprecated('Use gameDescriptor instead')
const Game$json = {
  '1': 'Game',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'icon_url', '3': 3, '4': 1, '5': 9, '10': 'iconUrl'},
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

/// Descriptor for `Game`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gameDescriptor = $convert.base64Decode(
    'CgRHYW1lEg4KAmlkGAEgASgJUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEhkKCGljb25fdXJsGA'
    'MgASgJUgdpY29uVXJsEjkKCmNyZWF0ZWRfYXQYBCABKAsyGi5nb29nbGUucHJvdG9idWYuVGlt'
    'ZXN0YW1wUgljcmVhdGVkQXQSOQoKdXBkYXRlZF9hdBgFIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi'
    '5UaW1lc3RhbXBSCXVwZGF0ZWRBdA==');

@$core.Deprecated('Use gameTableDescriptor instead')
const GameTable$json = {
  '1': 'GameTable',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'game_id', '3': 2, '4': 1, '5': 9, '10': 'gameId'},
    {'1': 'room_id', '3': 3, '4': 1, '5': 9, '10': 'roomId'},
    {'1': 'creator_id', '3': 4, '4': 1, '5': 9, '10': 'creatorId'},
    {'1': 'config', '3': 5, '4': 1, '5': 9, '10': 'config'},
    {
      '1': 'status',
      '3': 6,
      '4': 1,
      '5': 14,
      '6': '.models.GameTableStatus',
      '10': 'status'
    },
    {
      '1': 'created_at',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'createdAt'
    },
    {
      '1': 'updated_at',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'updatedAt'
    },
  ],
};

/// Descriptor for `GameTable`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gameTableDescriptor = $convert.base64Decode(
    'CglHYW1lVGFibGUSDgoCaWQYASABKAlSAmlkEhcKB2dhbWVfaWQYAiABKAlSBmdhbWVJZBIXCg'
    'dyb29tX2lkGAMgASgJUgZyb29tSWQSHQoKY3JlYXRvcl9pZBgEIAEoCVIJY3JlYXRvcklkEhYK'
    'BmNvbmZpZxgFIAEoCVIGY29uZmlnEi8KBnN0YXR1cxgGIAEoDjIXLm1vZGVscy5HYW1lVGFibG'
    'VTdGF0dXNSBnN0YXR1cxI5CgpjcmVhdGVkX2F0GAcgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRp'
    'bWVzdGFtcFIJY3JlYXRlZEF0EjkKCnVwZGF0ZWRfYXQYCCABKAsyGi5nb29nbGUucHJvdG9idW'
    'YuVGltZXN0YW1wUgl1cGRhdGVkQXQ=');

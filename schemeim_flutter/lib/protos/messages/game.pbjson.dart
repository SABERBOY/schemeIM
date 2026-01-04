// This is a generated file - do not edit.
//
// Generated from messages/game.proto.

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

@$core.Deprecated('Use createTableRequestDescriptor instead')
const CreateTableRequest$json = {
  '1': 'CreateTableRequest',
  '2': [
    {'1': 'game_id', '3': 1, '4': 1, '5': 9, '10': 'gameId'},
    {
      '1': 'config',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Struct',
      '10': 'config'
    },
  ],
};

/// Descriptor for `CreateTableRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createTableRequestDescriptor = $convert.base64Decode(
    'ChJDcmVhdGVUYWJsZVJlcXVlc3QSFwoHZ2FtZV9pZBgBIAEoCVIGZ2FtZUlkEi8KBmNvbmZpZx'
    'gCIAEoCzIXLmdvb2dsZS5wcm90b2J1Zi5TdHJ1Y3RSBmNvbmZpZw==');

@$core.Deprecated('Use joinTableRequestDescriptor instead')
const JoinTableRequest$json = {
  '1': 'JoinTableRequest',
  '2': [
    {'1': 'table_id', '3': 1, '4': 1, '5': 9, '10': 'tableId'},
  ],
};

/// Descriptor for `JoinTableRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List joinTableRequestDescriptor = $convert.base64Decode(
    'ChBKb2luVGFibGVSZXF1ZXN0EhkKCHRhYmxlX2lkGAEgASgJUgd0YWJsZUlk');

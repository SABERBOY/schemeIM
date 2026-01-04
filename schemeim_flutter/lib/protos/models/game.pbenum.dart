// This is a generated file - do not edit.
//
// Generated from models/game.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 游戏桌状态枚举
class GameTableStatus extends $pb.ProtobufEnum {
  static const GameTableStatus GAME_TABLE_STATUS_WAITING =
      GameTableStatus._(0, _omitEnumNames ? '' : 'GAME_TABLE_STATUS_WAITING');
  static const GameTableStatus GAME_TABLE_STATUS_PLAYING =
      GameTableStatus._(1, _omitEnumNames ? '' : 'GAME_TABLE_STATUS_PLAYING');
  static const GameTableStatus GAME_TABLE_STATUS_FINISHED =
      GameTableStatus._(2, _omitEnumNames ? '' : 'GAME_TABLE_STATUS_FINISHED');

  static const $core.List<GameTableStatus> values = <GameTableStatus>[
    GAME_TABLE_STATUS_WAITING,
    GAME_TABLE_STATUS_PLAYING,
    GAME_TABLE_STATUS_FINISHED,
  ];

  static final $core.List<GameTableStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static GameTableStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const GameTableStatus._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');

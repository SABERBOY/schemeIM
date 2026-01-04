// This is a generated file - do not edit.
//
// Generated from services/api.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;
import 'package:protobuf/well_known_types/google/protobuf/empty.pb.dart' as $2;

import '../messages/auth.pb.dart' as $0;
import '../messages/chatroom.pb.dart' as $7;
import '../messages/game.pb.dart' as $6;
import '../messages/social.pb.dart' as $5;
import '../messages/user.pb.dart' as $3;
import '../messages/wallet.pb.dart' as $4;
import '../models/common.pb.dart' as $1;
import 'api.pb.dart' as $8;

export 'api.pb.dart';

/// 认证服务
@$pb.GrpcServiceName('services.AuthService')
class AuthServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  AuthServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$1.Response> sendOTP(
    $0.SendOTPRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$sendOTP, request, options: options);
  }

  $grpc.ResponseFuture<$0.LoginResponse> login(
    $0.LoginRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$login, request, options: options);
  }

  // method descriptors

  static final _$sendOTP = $grpc.ClientMethod<$0.SendOTPRequest, $1.Response>(
      '/services.AuthService/SendOTP',
      ($0.SendOTPRequest value) => value.writeToBuffer(),
      $1.Response.fromBuffer);
  static final _$login = $grpc.ClientMethod<$0.LoginRequest, $0.LoginResponse>(
      '/services.AuthService/Login',
      ($0.LoginRequest value) => value.writeToBuffer(),
      $0.LoginResponse.fromBuffer);
}

@$pb.GrpcServiceName('services.AuthService')
abstract class AuthServiceBase extends $grpc.Service {
  $core.String get $name => 'services.AuthService';

  AuthServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.SendOTPRequest, $1.Response>(
        'SendOTP',
        sendOTP_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SendOTPRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.LoginRequest, $0.LoginResponse>(
        'Login',
        login_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LoginRequest.fromBuffer(value),
        ($0.LoginResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.Response> sendOTP_Pre($grpc.ServiceCall $call,
      $async.Future<$0.SendOTPRequest> $request) async {
    return sendOTP($call, await $request);
  }

  $async.Future<$1.Response> sendOTP(
      $grpc.ServiceCall call, $0.SendOTPRequest request);

  $async.Future<$0.LoginResponse> login_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.LoginRequest> $request) async {
    return login($call, await $request);
  }

  $async.Future<$0.LoginResponse> login(
      $grpc.ServiceCall call, $0.LoginRequest request);
}

/// 用户服务
@$pb.GrpcServiceName('services.UserService')
class UserServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  UserServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$1.Response> getProfile(
    $2.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getProfile, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> updateProfile(
    $3.UpdateProfileRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$updateProfile, request, options: options);
  }

  $grpc.ResponseFuture<$3.SearchUsersResponse> searchUsers(
    $3.SearchUsersRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$searchUsers, request, options: options);
  }

  // method descriptors

  static final _$getProfile = $grpc.ClientMethod<$2.Empty, $1.Response>(
      '/services.UserService/GetProfile',
      ($2.Empty value) => value.writeToBuffer(),
      $1.Response.fromBuffer);
  static final _$updateProfile =
      $grpc.ClientMethod<$3.UpdateProfileRequest, $1.Response>(
          '/services.UserService/UpdateProfile',
          ($3.UpdateProfileRequest value) => value.writeToBuffer(),
          $1.Response.fromBuffer);
  static final _$searchUsers =
      $grpc.ClientMethod<$3.SearchUsersRequest, $3.SearchUsersResponse>(
          '/services.UserService/SearchUsers',
          ($3.SearchUsersRequest value) => value.writeToBuffer(),
          $3.SearchUsersResponse.fromBuffer);
}

@$pb.GrpcServiceName('services.UserService')
abstract class UserServiceBase extends $grpc.Service {
  $core.String get $name => 'services.UserService';

  UserServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.Empty, $1.Response>(
        'GetProfile',
        getProfile_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.Empty.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.UpdateProfileRequest, $1.Response>(
        'UpdateProfile',
        updateProfile_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $3.UpdateProfileRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$3.SearchUsersRequest, $3.SearchUsersResponse>(
            'SearchUsers',
            searchUsers_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $3.SearchUsersRequest.fromBuffer(value),
            ($3.SearchUsersResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.Response> getProfile_Pre(
      $grpc.ServiceCall $call, $async.Future<$2.Empty> $request) async {
    return getProfile($call, await $request);
  }

  $async.Future<$1.Response> getProfile(
      $grpc.ServiceCall call, $2.Empty request);

  $async.Future<$1.Response> updateProfile_Pre($grpc.ServiceCall $call,
      $async.Future<$3.UpdateProfileRequest> $request) async {
    return updateProfile($call, await $request);
  }

  $async.Future<$1.Response> updateProfile(
      $grpc.ServiceCall call, $3.UpdateProfileRequest request);

  $async.Future<$3.SearchUsersResponse> searchUsers_Pre($grpc.ServiceCall $call,
      $async.Future<$3.SearchUsersRequest> $request) async {
    return searchUsers($call, await $request);
  }

  $async.Future<$3.SearchUsersResponse> searchUsers(
      $grpc.ServiceCall call, $3.SearchUsersRequest request);
}

/// 钱包服务
@$pb.GrpcServiceName('services.WalletService')
class WalletServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  WalletServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$1.Response> getWallet(
    $2.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getWallet, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> recharge(
    $4.RechargeRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$recharge, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> listGifts(
    $2.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listGifts, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> sendGift(
    $4.SendGiftRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$sendGift, request, options: options);
  }

  // method descriptors

  static final _$getWallet = $grpc.ClientMethod<$2.Empty, $1.Response>(
      '/services.WalletService/GetWallet',
      ($2.Empty value) => value.writeToBuffer(),
      $1.Response.fromBuffer);
  static final _$recharge = $grpc.ClientMethod<$4.RechargeRequest, $1.Response>(
      '/services.WalletService/Recharge',
      ($4.RechargeRequest value) => value.writeToBuffer(),
      $1.Response.fromBuffer);
  static final _$listGifts = $grpc.ClientMethod<$2.Empty, $1.Response>(
      '/services.WalletService/ListGifts',
      ($2.Empty value) => value.writeToBuffer(),
      $1.Response.fromBuffer);
  static final _$sendGift = $grpc.ClientMethod<$4.SendGiftRequest, $1.Response>(
      '/services.WalletService/SendGift',
      ($4.SendGiftRequest value) => value.writeToBuffer(),
      $1.Response.fromBuffer);
}

@$pb.GrpcServiceName('services.WalletService')
abstract class WalletServiceBase extends $grpc.Service {
  $core.String get $name => 'services.WalletService';

  WalletServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.Empty, $1.Response>(
        'GetWallet',
        getWallet_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.Empty.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.RechargeRequest, $1.Response>(
        'Recharge',
        recharge_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.RechargeRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.Empty, $1.Response>(
        'ListGifts',
        listGifts_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.Empty.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.SendGiftRequest, $1.Response>(
        'SendGift',
        sendGift_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.SendGiftRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
  }

  $async.Future<$1.Response> getWallet_Pre(
      $grpc.ServiceCall $call, $async.Future<$2.Empty> $request) async {
    return getWallet($call, await $request);
  }

  $async.Future<$1.Response> getWallet(
      $grpc.ServiceCall call, $2.Empty request);

  $async.Future<$1.Response> recharge_Pre($grpc.ServiceCall $call,
      $async.Future<$4.RechargeRequest> $request) async {
    return recharge($call, await $request);
  }

  $async.Future<$1.Response> recharge(
      $grpc.ServiceCall call, $4.RechargeRequest request);

  $async.Future<$1.Response> listGifts_Pre(
      $grpc.ServiceCall $call, $async.Future<$2.Empty> $request) async {
    return listGifts($call, await $request);
  }

  $async.Future<$1.Response> listGifts(
      $grpc.ServiceCall call, $2.Empty request);

  $async.Future<$1.Response> sendGift_Pre($grpc.ServiceCall $call,
      $async.Future<$4.SendGiftRequest> $request) async {
    return sendGift($call, await $request);
  }

  $async.Future<$1.Response> sendGift(
      $grpc.ServiceCall call, $4.SendGiftRequest request);
}

/// 社交服务
@$pb.GrpcServiceName('services.SocialService')
class SocialServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  SocialServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$1.Response> listFriends(
    $2.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listFriends, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> addFriend(
    $5.AddFriendRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$addFriend, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> acceptFriend(
    $5.AddFriendRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$acceptFriend, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> followUser(
    $5.FollowRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$followUser, request, options: options);
  }

  // method descriptors

  static final _$listFriends = $grpc.ClientMethod<$2.Empty, $1.Response>(
      '/services.SocialService/ListFriends',
      ($2.Empty value) => value.writeToBuffer(),
      $1.Response.fromBuffer);
  static final _$addFriend =
      $grpc.ClientMethod<$5.AddFriendRequest, $1.Response>(
          '/services.SocialService/AddFriend',
          ($5.AddFriendRequest value) => value.writeToBuffer(),
          $1.Response.fromBuffer);
  static final _$acceptFriend =
      $grpc.ClientMethod<$5.AddFriendRequest, $1.Response>(
          '/services.SocialService/AcceptFriend',
          ($5.AddFriendRequest value) => value.writeToBuffer(),
          $1.Response.fromBuffer);
  static final _$followUser = $grpc.ClientMethod<$5.FollowRequest, $1.Response>(
      '/services.SocialService/FollowUser',
      ($5.FollowRequest value) => value.writeToBuffer(),
      $1.Response.fromBuffer);
}

@$pb.GrpcServiceName('services.SocialService')
abstract class SocialServiceBase extends $grpc.Service {
  $core.String get $name => 'services.SocialService';

  SocialServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.Empty, $1.Response>(
        'ListFriends',
        listFriends_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.Empty.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.AddFriendRequest, $1.Response>(
        'AddFriend',
        addFriend_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.AddFriendRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.AddFriendRequest, $1.Response>(
        'AcceptFriend',
        acceptFriend_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.AddFriendRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.FollowRequest, $1.Response>(
        'FollowUser',
        followUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.FollowRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
  }

  $async.Future<$1.Response> listFriends_Pre(
      $grpc.ServiceCall $call, $async.Future<$2.Empty> $request) async {
    return listFriends($call, await $request);
  }

  $async.Future<$1.Response> listFriends(
      $grpc.ServiceCall call, $2.Empty request);

  $async.Future<$1.Response> addFriend_Pre($grpc.ServiceCall $call,
      $async.Future<$5.AddFriendRequest> $request) async {
    return addFriend($call, await $request);
  }

  $async.Future<$1.Response> addFriend(
      $grpc.ServiceCall call, $5.AddFriendRequest request);

  $async.Future<$1.Response> acceptFriend_Pre($grpc.ServiceCall $call,
      $async.Future<$5.AddFriendRequest> $request) async {
    return acceptFriend($call, await $request);
  }

  $async.Future<$1.Response> acceptFriend(
      $grpc.ServiceCall call, $5.AddFriendRequest request);

  $async.Future<$1.Response> followUser_Pre(
      $grpc.ServiceCall $call, $async.Future<$5.FollowRequest> $request) async {
    return followUser($call, await $request);
  }

  $async.Future<$1.Response> followUser(
      $grpc.ServiceCall call, $5.FollowRequest request);
}

/// 游戏服务
@$pb.GrpcServiceName('services.GameService')
class GameServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  GameServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$1.Response> listGames(
    $2.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listGames, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> createTable(
    $6.CreateTableRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$createTable, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> joinTable(
    $6.JoinTableRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$joinTable, request, options: options);
  }

  // method descriptors

  static final _$listGames = $grpc.ClientMethod<$2.Empty, $1.Response>(
      '/services.GameService/ListGames',
      ($2.Empty value) => value.writeToBuffer(),
      $1.Response.fromBuffer);
  static final _$createTable =
      $grpc.ClientMethod<$6.CreateTableRequest, $1.Response>(
          '/services.GameService/CreateTable',
          ($6.CreateTableRequest value) => value.writeToBuffer(),
          $1.Response.fromBuffer);
  static final _$joinTable =
      $grpc.ClientMethod<$6.JoinTableRequest, $1.Response>(
          '/services.GameService/JoinTable',
          ($6.JoinTableRequest value) => value.writeToBuffer(),
          $1.Response.fromBuffer);
}

@$pb.GrpcServiceName('services.GameService')
abstract class GameServiceBase extends $grpc.Service {
  $core.String get $name => 'services.GameService';

  GameServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.Empty, $1.Response>(
        'ListGames',
        listGames_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.Empty.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$6.CreateTableRequest, $1.Response>(
        'CreateTable',
        createTable_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $6.CreateTableRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$6.JoinTableRequest, $1.Response>(
        'JoinTable',
        joinTable_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $6.JoinTableRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
  }

  $async.Future<$1.Response> listGames_Pre(
      $grpc.ServiceCall $call, $async.Future<$2.Empty> $request) async {
    return listGames($call, await $request);
  }

  $async.Future<$1.Response> listGames(
      $grpc.ServiceCall call, $2.Empty request);

  $async.Future<$1.Response> createTable_Pre($grpc.ServiceCall $call,
      $async.Future<$6.CreateTableRequest> $request) async {
    return createTable($call, await $request);
  }

  $async.Future<$1.Response> createTable(
      $grpc.ServiceCall call, $6.CreateTableRequest request);

  $async.Future<$1.Response> joinTable_Pre($grpc.ServiceCall $call,
      $async.Future<$6.JoinTableRequest> $request) async {
    return joinTable($call, await $request);
  }

  $async.Future<$1.Response> joinTable(
      $grpc.ServiceCall call, $6.JoinTableRequest request);
}

/// 聊天室服务
@$pb.GrpcServiceName('services.ChatRoomService')
class ChatRoomServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  ChatRoomServiceClient(super.channel, {super.options, super.interceptors});

  /// 聊天室管理
  $grpc.ResponseFuture<$1.Response> listChatRooms(
    $2.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listChatRooms, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> createChatRoom(
    $7.ChatRoomCreateRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$createChatRoom, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> destroyChatRoom(
    $8.ChatRoomIdRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$destroyChatRoom, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> getChatRoomInfo(
    $8.ChatRoomIdRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getChatRoomInfo, request, options: options);
  }

  $grpc.ResponseFuture<$7.ChatRoomListResponse> queryChatRooms(
    $7.QueryChatRoomsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$queryChatRooms, request, options: options);
  }

  /// 麦位管理
  $grpc.ResponseFuture<$1.Response> manageMic(
    $8.ChatRoomMicRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$manageMic, request, options: options);
  }

  /// 成员管理
  $grpc.ResponseFuture<$7.UserListResponse> getChatRoomUsers(
    $8.ChatRoomIdRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getChatRoomUsers, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> checkUserInChatRoom(
    $8.ChatRoomUserRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$checkUserInChatRoom, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> checkUsersInChatRoom(
    $8.ChatRoomUsersRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$checkUsersInChatRoom, request, options: options);
  }

  /// 封禁管理
  $grpc.ResponseFuture<$1.Response> blockUsers(
    $8.ChatRoomBatchUsersRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$blockUsers, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> unblockUsers(
    $8.ChatRoomBatchUsersRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$unblockUsers, request, options: options);
  }

  $grpc.ResponseFuture<$7.StringListResponse> getBlockedUsers(
    $8.ChatRoomIdRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getBlockedUsers, request, options: options);
  }

  /// 禁言管理
  $grpc.ResponseFuture<$1.Response> gagUsers(
    $8.ChatRoomBatchUsersRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$gagUsers, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> ungagUsers(
    $8.ChatRoomBatchUsersRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$ungagUsers, request, options: options);
  }

  $grpc.ResponseFuture<$7.StringListResponse> getGaggedUsers(
    $8.ChatRoomIdRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getGaggedUsers, request, options: options);
  }

  /// 消息管理
  $grpc.ResponseFuture<$1.Response> addMessageDemotion(
    $7.MessageDemotionRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$addMessageDemotion, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> removeMessageDemotion(
    $7.MessageDemotionRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$removeMessageDemotion, request, options: options);
  }

  $grpc.ResponseFuture<$7.StringListResponse> getMessageDemotionList(
    $2.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getMessageDemotionList, request,
        options: options);
  }

  $grpc.ResponseFuture<$1.Response> addWhitelistMessageType(
    $7.WhitelistMessageTypeRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$addWhitelistMessageType, request,
        options: options);
  }

  $grpc.ResponseFuture<$1.Response> removeWhitelistMessageType(
    $7.WhitelistMessageTypeRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$removeWhitelistMessageType, request,
        options: options);
  }

  $grpc.ResponseFuture<$7.StringListResponse> getWhitelistMessageTypes(
    $2.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getWhitelistMessageTypes, request,
        options: options);
  }

  /// 消息分发控制
  $grpc.ResponseFuture<$1.Response> stopMessageDistribution(
    $8.ChatRoomIdRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$stopMessageDistribution, request,
        options: options);
  }

  $grpc.ResponseFuture<$1.Response> resumeMessageDistribution(
    $8.ChatRoomIdRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$resumeMessageDistribution, request,
        options: options);
  }

  /// 保活管理
  $grpc.ResponseFuture<$1.Response> addKeepAliveChatRoom(
    $8.ChatRoomIdRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$addKeepAliveChatRoom, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> removeKeepAliveChatRoom(
    $8.ChatRoomIdRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$removeKeepAliveChatRoom, request,
        options: options);
  }

  $grpc.ResponseFuture<$7.StringListResponse> getKeepAliveChatRooms(
    $2.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getKeepAliveChatRooms, request, options: options);
  }

  /// 白名单用户管理
  $grpc.ResponseFuture<$1.Response> addWhitelistUsers(
    $8.ChatRoomWhitelistUsersRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$addWhitelistUsers, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> removeWhitelistUsers(
    $8.ChatRoomWhitelistUsersRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$removeWhitelistUsers, request, options: options);
  }

  $grpc.ResponseFuture<$7.StringListResponse> getWhitelistUsers(
    $8.ChatRoomIdRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getWhitelistUsers, request, options: options);
  }

  /// 属性管理
  $grpc.ResponseFuture<$1.Response> setChatRoomAttributes(
    $8.ChatRoomAttributeRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$setChatRoomAttributes, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> removeChatRoomAttributes(
    $8.ChatRoomAttributeRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$removeChatRoomAttributes, request,
        options: options);
  }

  $grpc.ResponseFuture<$1.Response> getChatRoomAttributes(
    $8.ChatRoomIdRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getChatRoomAttributes, request, options: options);
  }

  /// 全员禁言
  $grpc.ResponseFuture<$1.Response> banAllUsers(
    $8.ChatRoomBanAllRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$banAllUsers, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> unbanAllUsers(
    $8.ChatRoomIdRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$unbanAllUsers, request, options: options);
  }

  $grpc.ResponseFuture<$7.StringListResponse> getBannedChatRooms(
    $2.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getBannedChatRooms, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> checkChatRoomBanStatus(
    $8.ChatRoomIdRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$checkChatRoomBanStatus, request,
        options: options);
  }

  /// 禁言白名单
  $grpc.ResponseFuture<$1.Response> addUserBanWhitelist(
    $8.ChatRoomBanWhitelistUsersRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$addUserBanWhitelist, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> removeUserBanWhitelist(
    $8.ChatRoomBanWhitelistUsersRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$removeUserBanWhitelist, request,
        options: options);
  }

  $grpc.ResponseFuture<$7.StringListResponse> getUserBanWhitelist(
    $8.ChatRoomIdRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getUserBanWhitelist, request, options: options);
  }

  // method descriptors

  static final _$listChatRooms = $grpc.ClientMethod<$2.Empty, $1.Response>(
      '/services.ChatRoomService/ListChatRooms',
      ($2.Empty value) => value.writeToBuffer(),
      $1.Response.fromBuffer);
  static final _$createChatRoom =
      $grpc.ClientMethod<$7.ChatRoomCreateRequest, $1.Response>(
          '/services.ChatRoomService/CreateChatRoom',
          ($7.ChatRoomCreateRequest value) => value.writeToBuffer(),
          $1.Response.fromBuffer);
  static final _$destroyChatRoom =
      $grpc.ClientMethod<$8.ChatRoomIdRequest, $1.Response>(
          '/services.ChatRoomService/DestroyChatRoom',
          ($8.ChatRoomIdRequest value) => value.writeToBuffer(),
          $1.Response.fromBuffer);
  static final _$getChatRoomInfo =
      $grpc.ClientMethod<$8.ChatRoomIdRequest, $1.Response>(
          '/services.ChatRoomService/GetChatRoomInfo',
          ($8.ChatRoomIdRequest value) => value.writeToBuffer(),
          $1.Response.fromBuffer);
  static final _$queryChatRooms =
      $grpc.ClientMethod<$7.QueryChatRoomsRequest, $7.ChatRoomListResponse>(
          '/services.ChatRoomService/QueryChatRooms',
          ($7.QueryChatRoomsRequest value) => value.writeToBuffer(),
          $7.ChatRoomListResponse.fromBuffer);
  static final _$manageMic =
      $grpc.ClientMethod<$8.ChatRoomMicRequest, $1.Response>(
          '/services.ChatRoomService/ManageMic',
          ($8.ChatRoomMicRequest value) => value.writeToBuffer(),
          $1.Response.fromBuffer);
  static final _$getChatRoomUsers =
      $grpc.ClientMethod<$8.ChatRoomIdRequest, $7.UserListResponse>(
          '/services.ChatRoomService/GetChatRoomUsers',
          ($8.ChatRoomIdRequest value) => value.writeToBuffer(),
          $7.UserListResponse.fromBuffer);
  static final _$checkUserInChatRoom =
      $grpc.ClientMethod<$8.ChatRoomUserRequest, $1.Response>(
          '/services.ChatRoomService/CheckUserInChatRoom',
          ($8.ChatRoomUserRequest value) => value.writeToBuffer(),
          $1.Response.fromBuffer);
  static final _$checkUsersInChatRoom =
      $grpc.ClientMethod<$8.ChatRoomUsersRequest, $1.Response>(
          '/services.ChatRoomService/CheckUsersInChatRoom',
          ($8.ChatRoomUsersRequest value) => value.writeToBuffer(),
          $1.Response.fromBuffer);
  static final _$blockUsers =
      $grpc.ClientMethod<$8.ChatRoomBatchUsersRequest, $1.Response>(
          '/services.ChatRoomService/BlockUsers',
          ($8.ChatRoomBatchUsersRequest value) => value.writeToBuffer(),
          $1.Response.fromBuffer);
  static final _$unblockUsers =
      $grpc.ClientMethod<$8.ChatRoomBatchUsersRequest, $1.Response>(
          '/services.ChatRoomService/UnblockUsers',
          ($8.ChatRoomBatchUsersRequest value) => value.writeToBuffer(),
          $1.Response.fromBuffer);
  static final _$getBlockedUsers =
      $grpc.ClientMethod<$8.ChatRoomIdRequest, $7.StringListResponse>(
          '/services.ChatRoomService/GetBlockedUsers',
          ($8.ChatRoomIdRequest value) => value.writeToBuffer(),
          $7.StringListResponse.fromBuffer);
  static final _$gagUsers =
      $grpc.ClientMethod<$8.ChatRoomBatchUsersRequest, $1.Response>(
          '/services.ChatRoomService/GagUsers',
          ($8.ChatRoomBatchUsersRequest value) => value.writeToBuffer(),
          $1.Response.fromBuffer);
  static final _$ungagUsers =
      $grpc.ClientMethod<$8.ChatRoomBatchUsersRequest, $1.Response>(
          '/services.ChatRoomService/UngagUsers',
          ($8.ChatRoomBatchUsersRequest value) => value.writeToBuffer(),
          $1.Response.fromBuffer);
  static final _$getGaggedUsers =
      $grpc.ClientMethod<$8.ChatRoomIdRequest, $7.StringListResponse>(
          '/services.ChatRoomService/GetGaggedUsers',
          ($8.ChatRoomIdRequest value) => value.writeToBuffer(),
          $7.StringListResponse.fromBuffer);
  static final _$addMessageDemotion =
      $grpc.ClientMethod<$7.MessageDemotionRequest, $1.Response>(
          '/services.ChatRoomService/AddMessageDemotion',
          ($7.MessageDemotionRequest value) => value.writeToBuffer(),
          $1.Response.fromBuffer);
  static final _$removeMessageDemotion =
      $grpc.ClientMethod<$7.MessageDemotionRequest, $1.Response>(
          '/services.ChatRoomService/RemoveMessageDemotion',
          ($7.MessageDemotionRequest value) => value.writeToBuffer(),
          $1.Response.fromBuffer);
  static final _$getMessageDemotionList =
      $grpc.ClientMethod<$2.Empty, $7.StringListResponse>(
          '/services.ChatRoomService/GetMessageDemotionList',
          ($2.Empty value) => value.writeToBuffer(),
          $7.StringListResponse.fromBuffer);
  static final _$addWhitelistMessageType =
      $grpc.ClientMethod<$7.WhitelistMessageTypeRequest, $1.Response>(
          '/services.ChatRoomService/AddWhitelistMessageType',
          ($7.WhitelistMessageTypeRequest value) => value.writeToBuffer(),
          $1.Response.fromBuffer);
  static final _$removeWhitelistMessageType =
      $grpc.ClientMethod<$7.WhitelistMessageTypeRequest, $1.Response>(
          '/services.ChatRoomService/RemoveWhitelistMessageType',
          ($7.WhitelistMessageTypeRequest value) => value.writeToBuffer(),
          $1.Response.fromBuffer);
  static final _$getWhitelistMessageTypes =
      $grpc.ClientMethod<$2.Empty, $7.StringListResponse>(
          '/services.ChatRoomService/GetWhitelistMessageTypes',
          ($2.Empty value) => value.writeToBuffer(),
          $7.StringListResponse.fromBuffer);
  static final _$stopMessageDistribution =
      $grpc.ClientMethod<$8.ChatRoomIdRequest, $1.Response>(
          '/services.ChatRoomService/StopMessageDistribution',
          ($8.ChatRoomIdRequest value) => value.writeToBuffer(),
          $1.Response.fromBuffer);
  static final _$resumeMessageDistribution =
      $grpc.ClientMethod<$8.ChatRoomIdRequest, $1.Response>(
          '/services.ChatRoomService/ResumeMessageDistribution',
          ($8.ChatRoomIdRequest value) => value.writeToBuffer(),
          $1.Response.fromBuffer);
  static final _$addKeepAliveChatRoom =
      $grpc.ClientMethod<$8.ChatRoomIdRequest, $1.Response>(
          '/services.ChatRoomService/AddKeepAliveChatRoom',
          ($8.ChatRoomIdRequest value) => value.writeToBuffer(),
          $1.Response.fromBuffer);
  static final _$removeKeepAliveChatRoom =
      $grpc.ClientMethod<$8.ChatRoomIdRequest, $1.Response>(
          '/services.ChatRoomService/RemoveKeepAliveChatRoom',
          ($8.ChatRoomIdRequest value) => value.writeToBuffer(),
          $1.Response.fromBuffer);
  static final _$getKeepAliveChatRooms =
      $grpc.ClientMethod<$2.Empty, $7.StringListResponse>(
          '/services.ChatRoomService/GetKeepAliveChatRooms',
          ($2.Empty value) => value.writeToBuffer(),
          $7.StringListResponse.fromBuffer);
  static final _$addWhitelistUsers =
      $grpc.ClientMethod<$8.ChatRoomWhitelistUsersRequest, $1.Response>(
          '/services.ChatRoomService/AddWhitelistUsers',
          ($8.ChatRoomWhitelistUsersRequest value) => value.writeToBuffer(),
          $1.Response.fromBuffer);
  static final _$removeWhitelistUsers =
      $grpc.ClientMethod<$8.ChatRoomWhitelistUsersRequest, $1.Response>(
          '/services.ChatRoomService/RemoveWhitelistUsers',
          ($8.ChatRoomWhitelistUsersRequest value) => value.writeToBuffer(),
          $1.Response.fromBuffer);
  static final _$getWhitelistUsers =
      $grpc.ClientMethod<$8.ChatRoomIdRequest, $7.StringListResponse>(
          '/services.ChatRoomService/GetWhitelistUsers',
          ($8.ChatRoomIdRequest value) => value.writeToBuffer(),
          $7.StringListResponse.fromBuffer);
  static final _$setChatRoomAttributes =
      $grpc.ClientMethod<$8.ChatRoomAttributeRequest, $1.Response>(
          '/services.ChatRoomService/SetChatRoomAttributes',
          ($8.ChatRoomAttributeRequest value) => value.writeToBuffer(),
          $1.Response.fromBuffer);
  static final _$removeChatRoomAttributes =
      $grpc.ClientMethod<$8.ChatRoomAttributeRequest, $1.Response>(
          '/services.ChatRoomService/RemoveChatRoomAttributes',
          ($8.ChatRoomAttributeRequest value) => value.writeToBuffer(),
          $1.Response.fromBuffer);
  static final _$getChatRoomAttributes =
      $grpc.ClientMethod<$8.ChatRoomIdRequest, $1.Response>(
          '/services.ChatRoomService/GetChatRoomAttributes',
          ($8.ChatRoomIdRequest value) => value.writeToBuffer(),
          $1.Response.fromBuffer);
  static final _$banAllUsers =
      $grpc.ClientMethod<$8.ChatRoomBanAllRequest, $1.Response>(
          '/services.ChatRoomService/BanAllUsers',
          ($8.ChatRoomBanAllRequest value) => value.writeToBuffer(),
          $1.Response.fromBuffer);
  static final _$unbanAllUsers =
      $grpc.ClientMethod<$8.ChatRoomIdRequest, $1.Response>(
          '/services.ChatRoomService/UnbanAllUsers',
          ($8.ChatRoomIdRequest value) => value.writeToBuffer(),
          $1.Response.fromBuffer);
  static final _$getBannedChatRooms =
      $grpc.ClientMethod<$2.Empty, $7.StringListResponse>(
          '/services.ChatRoomService/GetBannedChatRooms',
          ($2.Empty value) => value.writeToBuffer(),
          $7.StringListResponse.fromBuffer);
  static final _$checkChatRoomBanStatus =
      $grpc.ClientMethod<$8.ChatRoomIdRequest, $1.Response>(
          '/services.ChatRoomService/CheckChatRoomBanStatus',
          ($8.ChatRoomIdRequest value) => value.writeToBuffer(),
          $1.Response.fromBuffer);
  static final _$addUserBanWhitelist =
      $grpc.ClientMethod<$8.ChatRoomBanWhitelistUsersRequest, $1.Response>(
          '/services.ChatRoomService/AddUserBanWhitelist',
          ($8.ChatRoomBanWhitelistUsersRequest value) => value.writeToBuffer(),
          $1.Response.fromBuffer);
  static final _$removeUserBanWhitelist =
      $grpc.ClientMethod<$8.ChatRoomBanWhitelistUsersRequest, $1.Response>(
          '/services.ChatRoomService/RemoveUserBanWhitelist',
          ($8.ChatRoomBanWhitelistUsersRequest value) => value.writeToBuffer(),
          $1.Response.fromBuffer);
  static final _$getUserBanWhitelist =
      $grpc.ClientMethod<$8.ChatRoomIdRequest, $7.StringListResponse>(
          '/services.ChatRoomService/GetUserBanWhitelist',
          ($8.ChatRoomIdRequest value) => value.writeToBuffer(),
          $7.StringListResponse.fromBuffer);
}

@$pb.GrpcServiceName('services.ChatRoomService')
abstract class ChatRoomServiceBase extends $grpc.Service {
  $core.String get $name => 'services.ChatRoomService';

  ChatRoomServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.Empty, $1.Response>(
        'ListChatRooms',
        listChatRooms_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.Empty.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.ChatRoomCreateRequest, $1.Response>(
        'CreateChatRoom',
        createChatRoom_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $7.ChatRoomCreateRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.ChatRoomIdRequest, $1.Response>(
        'DestroyChatRoom',
        destroyChatRoom_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.ChatRoomIdRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.ChatRoomIdRequest, $1.Response>(
        'GetChatRoomInfo',
        getChatRoomInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.ChatRoomIdRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$7.QueryChatRoomsRequest, $7.ChatRoomListResponse>(
            'QueryChatRooms',
            queryChatRooms_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $7.QueryChatRoomsRequest.fromBuffer(value),
            ($7.ChatRoomListResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.ChatRoomMicRequest, $1.Response>(
        'ManageMic',
        manageMic_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $8.ChatRoomMicRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.ChatRoomIdRequest, $7.UserListResponse>(
        'GetChatRoomUsers',
        getChatRoomUsers_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.ChatRoomIdRequest.fromBuffer(value),
        ($7.UserListResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.ChatRoomUserRequest, $1.Response>(
        'CheckUserInChatRoom',
        checkUserInChatRoom_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $8.ChatRoomUserRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.ChatRoomUsersRequest, $1.Response>(
        'CheckUsersInChatRoom',
        checkUsersInChatRoom_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $8.ChatRoomUsersRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.ChatRoomBatchUsersRequest, $1.Response>(
        'BlockUsers',
        blockUsers_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $8.ChatRoomBatchUsersRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.ChatRoomBatchUsersRequest, $1.Response>(
        'UnblockUsers',
        unblockUsers_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $8.ChatRoomBatchUsersRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.ChatRoomIdRequest, $7.StringListResponse>(
        'GetBlockedUsers',
        getBlockedUsers_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.ChatRoomIdRequest.fromBuffer(value),
        ($7.StringListResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.ChatRoomBatchUsersRequest, $1.Response>(
        'GagUsers',
        gagUsers_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $8.ChatRoomBatchUsersRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.ChatRoomBatchUsersRequest, $1.Response>(
        'UngagUsers',
        ungagUsers_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $8.ChatRoomBatchUsersRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.ChatRoomIdRequest, $7.StringListResponse>(
        'GetGaggedUsers',
        getGaggedUsers_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.ChatRoomIdRequest.fromBuffer(value),
        ($7.StringListResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.MessageDemotionRequest, $1.Response>(
        'AddMessageDemotion',
        addMessageDemotion_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $7.MessageDemotionRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.MessageDemotionRequest, $1.Response>(
        'RemoveMessageDemotion',
        removeMessageDemotion_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $7.MessageDemotionRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.Empty, $7.StringListResponse>(
        'GetMessageDemotionList',
        getMessageDemotionList_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.Empty.fromBuffer(value),
        ($7.StringListResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.WhitelistMessageTypeRequest, $1.Response>(
        'AddWhitelistMessageType',
        addWhitelistMessageType_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $7.WhitelistMessageTypeRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.WhitelistMessageTypeRequest, $1.Response>(
        'RemoveWhitelistMessageType',
        removeWhitelistMessageType_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $7.WhitelistMessageTypeRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.Empty, $7.StringListResponse>(
        'GetWhitelistMessageTypes',
        getWhitelistMessageTypes_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.Empty.fromBuffer(value),
        ($7.StringListResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.ChatRoomIdRequest, $1.Response>(
        'StopMessageDistribution',
        stopMessageDistribution_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.ChatRoomIdRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.ChatRoomIdRequest, $1.Response>(
        'ResumeMessageDistribution',
        resumeMessageDistribution_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.ChatRoomIdRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.ChatRoomIdRequest, $1.Response>(
        'AddKeepAliveChatRoom',
        addKeepAliveChatRoom_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.ChatRoomIdRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.ChatRoomIdRequest, $1.Response>(
        'RemoveKeepAliveChatRoom',
        removeKeepAliveChatRoom_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.ChatRoomIdRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.Empty, $7.StringListResponse>(
        'GetKeepAliveChatRooms',
        getKeepAliveChatRooms_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.Empty.fromBuffer(value),
        ($7.StringListResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$8.ChatRoomWhitelistUsersRequest, $1.Response>(
            'AddWhitelistUsers',
            addWhitelistUsers_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $8.ChatRoomWhitelistUsersRequest.fromBuffer(value),
            ($1.Response value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$8.ChatRoomWhitelistUsersRequest, $1.Response>(
            'RemoveWhitelistUsers',
            removeWhitelistUsers_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $8.ChatRoomWhitelistUsersRequest.fromBuffer(value),
            ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.ChatRoomIdRequest, $7.StringListResponse>(
        'GetWhitelistUsers',
        getWhitelistUsers_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.ChatRoomIdRequest.fromBuffer(value),
        ($7.StringListResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.ChatRoomAttributeRequest, $1.Response>(
        'SetChatRoomAttributes',
        setChatRoomAttributes_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $8.ChatRoomAttributeRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.ChatRoomAttributeRequest, $1.Response>(
        'RemoveChatRoomAttributes',
        removeChatRoomAttributes_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $8.ChatRoomAttributeRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.ChatRoomIdRequest, $1.Response>(
        'GetChatRoomAttributes',
        getChatRoomAttributes_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.ChatRoomIdRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.ChatRoomBanAllRequest, $1.Response>(
        'BanAllUsers',
        banAllUsers_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $8.ChatRoomBanAllRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.ChatRoomIdRequest, $1.Response>(
        'UnbanAllUsers',
        unbanAllUsers_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.ChatRoomIdRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.Empty, $7.StringListResponse>(
        'GetBannedChatRooms',
        getBannedChatRooms_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.Empty.fromBuffer(value),
        ($7.StringListResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.ChatRoomIdRequest, $1.Response>(
        'CheckChatRoomBanStatus',
        checkChatRoomBanStatus_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.ChatRoomIdRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$8.ChatRoomBanWhitelistUsersRequest, $1.Response>(
            'AddUserBanWhitelist',
            addUserBanWhitelist_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $8.ChatRoomBanWhitelistUsersRequest.fromBuffer(value),
            ($1.Response value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$8.ChatRoomBanWhitelistUsersRequest, $1.Response>(
            'RemoveUserBanWhitelist',
            removeUserBanWhitelist_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $8.ChatRoomBanWhitelistUsersRequest.fromBuffer(value),
            ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.ChatRoomIdRequest, $7.StringListResponse>(
        'GetUserBanWhitelist',
        getUserBanWhitelist_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.ChatRoomIdRequest.fromBuffer(value),
        ($7.StringListResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.Response> listChatRooms_Pre(
      $grpc.ServiceCall $call, $async.Future<$2.Empty> $request) async {
    return listChatRooms($call, await $request);
  }

  $async.Future<$1.Response> listChatRooms(
      $grpc.ServiceCall call, $2.Empty request);

  $async.Future<$1.Response> createChatRoom_Pre($grpc.ServiceCall $call,
      $async.Future<$7.ChatRoomCreateRequest> $request) async {
    return createChatRoom($call, await $request);
  }

  $async.Future<$1.Response> createChatRoom(
      $grpc.ServiceCall call, $7.ChatRoomCreateRequest request);

  $async.Future<$1.Response> destroyChatRoom_Pre($grpc.ServiceCall $call,
      $async.Future<$8.ChatRoomIdRequest> $request) async {
    return destroyChatRoom($call, await $request);
  }

  $async.Future<$1.Response> destroyChatRoom(
      $grpc.ServiceCall call, $8.ChatRoomIdRequest request);

  $async.Future<$1.Response> getChatRoomInfo_Pre($grpc.ServiceCall $call,
      $async.Future<$8.ChatRoomIdRequest> $request) async {
    return getChatRoomInfo($call, await $request);
  }

  $async.Future<$1.Response> getChatRoomInfo(
      $grpc.ServiceCall call, $8.ChatRoomIdRequest request);

  $async.Future<$7.ChatRoomListResponse> queryChatRooms_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$7.QueryChatRoomsRequest> $request) async {
    return queryChatRooms($call, await $request);
  }

  $async.Future<$7.ChatRoomListResponse> queryChatRooms(
      $grpc.ServiceCall call, $7.QueryChatRoomsRequest request);

  $async.Future<$1.Response> manageMic_Pre($grpc.ServiceCall $call,
      $async.Future<$8.ChatRoomMicRequest> $request) async {
    return manageMic($call, await $request);
  }

  $async.Future<$1.Response> manageMic(
      $grpc.ServiceCall call, $8.ChatRoomMicRequest request);

  $async.Future<$7.UserListResponse> getChatRoomUsers_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$8.ChatRoomIdRequest> $request) async {
    return getChatRoomUsers($call, await $request);
  }

  $async.Future<$7.UserListResponse> getChatRoomUsers(
      $grpc.ServiceCall call, $8.ChatRoomIdRequest request);

  $async.Future<$1.Response> checkUserInChatRoom_Pre($grpc.ServiceCall $call,
      $async.Future<$8.ChatRoomUserRequest> $request) async {
    return checkUserInChatRoom($call, await $request);
  }

  $async.Future<$1.Response> checkUserInChatRoom(
      $grpc.ServiceCall call, $8.ChatRoomUserRequest request);

  $async.Future<$1.Response> checkUsersInChatRoom_Pre($grpc.ServiceCall $call,
      $async.Future<$8.ChatRoomUsersRequest> $request) async {
    return checkUsersInChatRoom($call, await $request);
  }

  $async.Future<$1.Response> checkUsersInChatRoom(
      $grpc.ServiceCall call, $8.ChatRoomUsersRequest request);

  $async.Future<$1.Response> blockUsers_Pre($grpc.ServiceCall $call,
      $async.Future<$8.ChatRoomBatchUsersRequest> $request) async {
    return blockUsers($call, await $request);
  }

  $async.Future<$1.Response> blockUsers(
      $grpc.ServiceCall call, $8.ChatRoomBatchUsersRequest request);

  $async.Future<$1.Response> unblockUsers_Pre($grpc.ServiceCall $call,
      $async.Future<$8.ChatRoomBatchUsersRequest> $request) async {
    return unblockUsers($call, await $request);
  }

  $async.Future<$1.Response> unblockUsers(
      $grpc.ServiceCall call, $8.ChatRoomBatchUsersRequest request);

  $async.Future<$7.StringListResponse> getBlockedUsers_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$8.ChatRoomIdRequest> $request) async {
    return getBlockedUsers($call, await $request);
  }

  $async.Future<$7.StringListResponse> getBlockedUsers(
      $grpc.ServiceCall call, $8.ChatRoomIdRequest request);

  $async.Future<$1.Response> gagUsers_Pre($grpc.ServiceCall $call,
      $async.Future<$8.ChatRoomBatchUsersRequest> $request) async {
    return gagUsers($call, await $request);
  }

  $async.Future<$1.Response> gagUsers(
      $grpc.ServiceCall call, $8.ChatRoomBatchUsersRequest request);

  $async.Future<$1.Response> ungagUsers_Pre($grpc.ServiceCall $call,
      $async.Future<$8.ChatRoomBatchUsersRequest> $request) async {
    return ungagUsers($call, await $request);
  }

  $async.Future<$1.Response> ungagUsers(
      $grpc.ServiceCall call, $8.ChatRoomBatchUsersRequest request);

  $async.Future<$7.StringListResponse> getGaggedUsers_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$8.ChatRoomIdRequest> $request) async {
    return getGaggedUsers($call, await $request);
  }

  $async.Future<$7.StringListResponse> getGaggedUsers(
      $grpc.ServiceCall call, $8.ChatRoomIdRequest request);

  $async.Future<$1.Response> addMessageDemotion_Pre($grpc.ServiceCall $call,
      $async.Future<$7.MessageDemotionRequest> $request) async {
    return addMessageDemotion($call, await $request);
  }

  $async.Future<$1.Response> addMessageDemotion(
      $grpc.ServiceCall call, $7.MessageDemotionRequest request);

  $async.Future<$1.Response> removeMessageDemotion_Pre($grpc.ServiceCall $call,
      $async.Future<$7.MessageDemotionRequest> $request) async {
    return removeMessageDemotion($call, await $request);
  }

  $async.Future<$1.Response> removeMessageDemotion(
      $grpc.ServiceCall call, $7.MessageDemotionRequest request);

  $async.Future<$7.StringListResponse> getMessageDemotionList_Pre(
      $grpc.ServiceCall $call, $async.Future<$2.Empty> $request) async {
    return getMessageDemotionList($call, await $request);
  }

  $async.Future<$7.StringListResponse> getMessageDemotionList(
      $grpc.ServiceCall call, $2.Empty request);

  $async.Future<$1.Response> addWhitelistMessageType_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$7.WhitelistMessageTypeRequest> $request) async {
    return addWhitelistMessageType($call, await $request);
  }

  $async.Future<$1.Response> addWhitelistMessageType(
      $grpc.ServiceCall call, $7.WhitelistMessageTypeRequest request);

  $async.Future<$1.Response> removeWhitelistMessageType_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$7.WhitelistMessageTypeRequest> $request) async {
    return removeWhitelistMessageType($call, await $request);
  }

  $async.Future<$1.Response> removeWhitelistMessageType(
      $grpc.ServiceCall call, $7.WhitelistMessageTypeRequest request);

  $async.Future<$7.StringListResponse> getWhitelistMessageTypes_Pre(
      $grpc.ServiceCall $call, $async.Future<$2.Empty> $request) async {
    return getWhitelistMessageTypes($call, await $request);
  }

  $async.Future<$7.StringListResponse> getWhitelistMessageTypes(
      $grpc.ServiceCall call, $2.Empty request);

  $async.Future<$1.Response> stopMessageDistribution_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$8.ChatRoomIdRequest> $request) async {
    return stopMessageDistribution($call, await $request);
  }

  $async.Future<$1.Response> stopMessageDistribution(
      $grpc.ServiceCall call, $8.ChatRoomIdRequest request);

  $async.Future<$1.Response> resumeMessageDistribution_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$8.ChatRoomIdRequest> $request) async {
    return resumeMessageDistribution($call, await $request);
  }

  $async.Future<$1.Response> resumeMessageDistribution(
      $grpc.ServiceCall call, $8.ChatRoomIdRequest request);

  $async.Future<$1.Response> addKeepAliveChatRoom_Pre($grpc.ServiceCall $call,
      $async.Future<$8.ChatRoomIdRequest> $request) async {
    return addKeepAliveChatRoom($call, await $request);
  }

  $async.Future<$1.Response> addKeepAliveChatRoom(
      $grpc.ServiceCall call, $8.ChatRoomIdRequest request);

  $async.Future<$1.Response> removeKeepAliveChatRoom_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$8.ChatRoomIdRequest> $request) async {
    return removeKeepAliveChatRoom($call, await $request);
  }

  $async.Future<$1.Response> removeKeepAliveChatRoom(
      $grpc.ServiceCall call, $8.ChatRoomIdRequest request);

  $async.Future<$7.StringListResponse> getKeepAliveChatRooms_Pre(
      $grpc.ServiceCall $call, $async.Future<$2.Empty> $request) async {
    return getKeepAliveChatRooms($call, await $request);
  }

  $async.Future<$7.StringListResponse> getKeepAliveChatRooms(
      $grpc.ServiceCall call, $2.Empty request);

  $async.Future<$1.Response> addWhitelistUsers_Pre($grpc.ServiceCall $call,
      $async.Future<$8.ChatRoomWhitelistUsersRequest> $request) async {
    return addWhitelistUsers($call, await $request);
  }

  $async.Future<$1.Response> addWhitelistUsers(
      $grpc.ServiceCall call, $8.ChatRoomWhitelistUsersRequest request);

  $async.Future<$1.Response> removeWhitelistUsers_Pre($grpc.ServiceCall $call,
      $async.Future<$8.ChatRoomWhitelistUsersRequest> $request) async {
    return removeWhitelistUsers($call, await $request);
  }

  $async.Future<$1.Response> removeWhitelistUsers(
      $grpc.ServiceCall call, $8.ChatRoomWhitelistUsersRequest request);

  $async.Future<$7.StringListResponse> getWhitelistUsers_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$8.ChatRoomIdRequest> $request) async {
    return getWhitelistUsers($call, await $request);
  }

  $async.Future<$7.StringListResponse> getWhitelistUsers(
      $grpc.ServiceCall call, $8.ChatRoomIdRequest request);

  $async.Future<$1.Response> setChatRoomAttributes_Pre($grpc.ServiceCall $call,
      $async.Future<$8.ChatRoomAttributeRequest> $request) async {
    return setChatRoomAttributes($call, await $request);
  }

  $async.Future<$1.Response> setChatRoomAttributes(
      $grpc.ServiceCall call, $8.ChatRoomAttributeRequest request);

  $async.Future<$1.Response> removeChatRoomAttributes_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$8.ChatRoomAttributeRequest> $request) async {
    return removeChatRoomAttributes($call, await $request);
  }

  $async.Future<$1.Response> removeChatRoomAttributes(
      $grpc.ServiceCall call, $8.ChatRoomAttributeRequest request);

  $async.Future<$1.Response> getChatRoomAttributes_Pre($grpc.ServiceCall $call,
      $async.Future<$8.ChatRoomIdRequest> $request) async {
    return getChatRoomAttributes($call, await $request);
  }

  $async.Future<$1.Response> getChatRoomAttributes(
      $grpc.ServiceCall call, $8.ChatRoomIdRequest request);

  $async.Future<$1.Response> banAllUsers_Pre($grpc.ServiceCall $call,
      $async.Future<$8.ChatRoomBanAllRequest> $request) async {
    return banAllUsers($call, await $request);
  }

  $async.Future<$1.Response> banAllUsers(
      $grpc.ServiceCall call, $8.ChatRoomBanAllRequest request);

  $async.Future<$1.Response> unbanAllUsers_Pre($grpc.ServiceCall $call,
      $async.Future<$8.ChatRoomIdRequest> $request) async {
    return unbanAllUsers($call, await $request);
  }

  $async.Future<$1.Response> unbanAllUsers(
      $grpc.ServiceCall call, $8.ChatRoomIdRequest request);

  $async.Future<$7.StringListResponse> getBannedChatRooms_Pre(
      $grpc.ServiceCall $call, $async.Future<$2.Empty> $request) async {
    return getBannedChatRooms($call, await $request);
  }

  $async.Future<$7.StringListResponse> getBannedChatRooms(
      $grpc.ServiceCall call, $2.Empty request);

  $async.Future<$1.Response> checkChatRoomBanStatus_Pre($grpc.ServiceCall $call,
      $async.Future<$8.ChatRoomIdRequest> $request) async {
    return checkChatRoomBanStatus($call, await $request);
  }

  $async.Future<$1.Response> checkChatRoomBanStatus(
      $grpc.ServiceCall call, $8.ChatRoomIdRequest request);

  $async.Future<$1.Response> addUserBanWhitelist_Pre($grpc.ServiceCall $call,
      $async.Future<$8.ChatRoomBanWhitelistUsersRequest> $request) async {
    return addUserBanWhitelist($call, await $request);
  }

  $async.Future<$1.Response> addUserBanWhitelist(
      $grpc.ServiceCall call, $8.ChatRoomBanWhitelistUsersRequest request);

  $async.Future<$1.Response> removeUserBanWhitelist_Pre($grpc.ServiceCall $call,
      $async.Future<$8.ChatRoomBanWhitelistUsersRequest> $request) async {
    return removeUserBanWhitelist($call, await $request);
  }

  $async.Future<$1.Response> removeUserBanWhitelist(
      $grpc.ServiceCall call, $8.ChatRoomBanWhitelistUsersRequest request);

  $async.Future<$7.StringListResponse> getUserBanWhitelist_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$8.ChatRoomIdRequest> $request) async {
    return getUserBanWhitelist($call, await $request);
  }

  $async.Future<$7.StringListResponse> getUserBanWhitelist(
      $grpc.ServiceCall call, $8.ChatRoomIdRequest request);
}

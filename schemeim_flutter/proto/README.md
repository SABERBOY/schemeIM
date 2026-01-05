# Protobuf 定义

此目录包含 Middle East IM Server 的所有 Protobuf 定义文件，用于前后端数据格式统一。

## 目录结构

```
pkg/proto/
├── models/          # 数据模型定义
│   ├── common.proto # 通用响应结构
│   ├── user.proto   # 用户模型
│   ├── room.proto   # 聊天室模型
│   ├── wallet.proto # 钱包、礼物、交易模型
│   ├── social.proto # 社交关系模型
│   └── game.proto   # 游戏相关模型
├── messages/        # 请求/响应消息定义
│   ├── auth.proto     # 认证相关消息
│   ├── user.proto     # 用户相关消息
│   ├── wallet.proto   # 钱包相关消息
│   ├── social.proto   # 社交相关消息
│   ├── game.proto     # 游戏相关消息
│   └── chatroom.proto # 聊天室相关消息
├── services/        # gRPC 服务定义
│   └── api.proto    # 所有 gRPC 服务接口
└── README.md       # 此说明文件
```

## 生成 Go 代码

### 使用 Makefile

```bash
# 安装 Protobuf 工具
make proto-tools

# 生成所有 Protobuf 代码
make proto-gen

# 或者一步到位
make proto-all
```

### 使用脚本

```bash
# 运行生成脚本
./scripts/generate_proto.sh
```

生成的 Go 代码将位于 `pkg/pb/` 目录下。

## 前端集成

前端项目可以使用这些 `.proto` 文件生成对应语言的代码：

### Dart/Flutter

```bash
# 安装 protoc 插件
pub global activate protoc_plugin

# 生成 Dart 代码
protoc --dart_out=lib/pb \
    --plugin=protoc-gen-dart=pub global run protoc_plugin \
    pkg/proto/models/*.proto \
    pkg/proto/messages/*.proto \
    pkg/proto/services/*.proto
```

### TypeScript

```bash
# 安装 protoc 插件
npm install -g grpc-tools

# 生成 TypeScript 代码
grpc_tools_node_protoc \
    --plugin=protoc-gen-ts=node_modules/.bin/protoc-gen-ts \
    --ts_out=src/pb \
    pkg/proto/models/*.proto \
    pkg/proto/messages/*.proto \
    pkg/proto/services/*.proto
```

## 注意事项

1. **导入顺序**: 编译时需要按照依赖顺序进行，models -> messages -> services
2. **包名**: 所有 `.proto` 文件都定义了对应的包名，请勿随意修改
3. **版本兼容**: 修改现有消息时需要考虑向后兼容性
4. **枚举值**: 枚举值从 0 开始，0 通常表示默认值

## 依赖

- [Protocol Buffers](https://github.com/protocolbuffers/protobuf)
- [protoc-gen-go](https://google.golang.org/protobuf/cmd/protoc-gen-go)
- [protoc-gen-go-grpc](https://google.golang.org/grpc/cmd/protoc-gen-go-grpc)

## 相关文档

- [API 接口文档](../../docs/api.md) - REST API 与 Protobuf 的映射关系
- [Protocol Buffers 官方文档](https://developers.google.com/protocol-buffers)
- [gRPC 官方文档](https://grpc.io/docs/)

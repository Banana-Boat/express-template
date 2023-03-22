# express-template

基于 Express 的后端模版。预置 Mysql 作为数据存储。

## CLI 工具

- [**Docker**](https://hub.docker.com/)
- [**prisma**](https://www.prisma.io/docs/concepts/components/prisma-migrate)（数据库 Migrate）

## 主要依赖

- [**Express**](https://github.com/expressjs/express)（后端框架）
- [**@prisma/client**](https://www.prisma.io/docs/concepts/components/prisma-client)（数据库 ORM）

## 项目信息修改

- 修改 package.json
- 向 .gitignore 文件中添加 .env 与 compose.yaml

## 开发场景

#### 基本环境

- 安装依赖 `npm install`

#### 数据库

- Mysql

  - 修改 prisma/schema.prisma 中库表定义
  - 修改 .env 中数据库连接相关定义
  - 执行`make mysql DB_PASSWORD=? DB_NAME=?`，启动 mysql 容器
  - 执行`npm run migrate-dev-init`数据库表创建
  - 执行`npm run prisma-gen`更新 prismaClient 定义

#### 编译运行

- 执行`npm run start-dev`，启动服务（热更新）

## 部署场景

- 修改根目录下 compose.yaml 与 makefile 相关信息
- 应用容器化
  - 方法一：在服务器端拉取代码，执行`make build_images`，打包镜像
  - 方法二：本地执行`make build_push_multi`，打包多平台镜像并推至 hub

#### Compose 方式部署

> 参考 [**docker compose**](https://docs.docker.com/engine/reference/commandline/compose/)

- `docker compose up -d` 后台运行
- `docker compose logs` 查看日志
- `docker compose down` 结束运行并删除容器

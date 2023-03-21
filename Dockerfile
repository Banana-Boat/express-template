# 使用 multi-stage 进行构建，进一步减小镜像大小

# Build stage
FROM node:16-alpine AS builder
WORKDIR /app
COPY . .
RUN npm install
# 生成 prisma client，对 TS 进行编译
RUN npm run prisma-gen && npm run build

# Run stage
FROM node:16-alpine
WORKDIR /app
# <src> 是一个目录，则将目录下的所有文件写入<dest>中
COPY --from=builder /app/build ./build
COPY ./prisma ./prisma
COPY ./.env .
COPY ./wait-for.sh .
COPY package*.json .
RUN npm install --production
RUN npm run prisma-gen

EXPOSE 8080
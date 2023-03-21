# 创建 mysql 容器
mysql:
ifeq (${DB_PASSWORD}${DB_NAME},)
	@echo "missing parameter DB_PASSWORD and DB_NAME"
else
	docker run --name mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=${DB_PASSWORD} -e MYSQL_DATABASE=${DB_NAME} -d mysql:8.0
endif

# 销毁 mysql 容器
rm_mysql:
	docker stop mysql && docker rm mysql


DOCKER_USERNAME = tiangexiang
SERVICE_VERSION = 0.1.0

build_image:
	@echo "Building the image..."
	docker build -t ${DOCKER_USERNAME}/express-service:${SERVICE_VERSION} .

rm_image:
	@echo "Removing the images..."
	docker rmi ${DOCKER_USERNAME}/express-service:${SERVICE_VERSION}

# 构建支持多架构的镜像，并推到hub（镜像不保存到本地）
build_push_multi:
	@echo "Building and pushing the image of multi-arch..."
	docker buildx build -t ${DOCKER_USERNAME}/express-service:${SERVICE_VERSION} --platform=linux/arm,linux/arm64,linux/amd64 . --push

.PHONY: mysql rm_mysql build_image rm_image build_push_multi

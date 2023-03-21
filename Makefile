# 创建 mysql 容器
mysql:
ifeq (${DB_PASSWORD}${DB_NAME},)
	@echo "missing parameter DB_PASSWORD and DB_NAME"
else
	docker run --name mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=${DB_PASSWORD} -e MYSQL_DATABASE=${DB_NAME} -d mysql:8.0
endif

# 销毁 mysql 容器
rm_mysql:
	docker stop mysql && docker rm mysql && rm -rf db/migrations


.PHONY: mysql rm_mysql

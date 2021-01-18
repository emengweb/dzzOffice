# dzzOffice

官网地址(http://www.dzzoffice.com)
当前镜像基于最新社区版代码构建。
Dockerfile(https://github.com/emengweb/dzzoffice)

## 快速部署
### 部署安装Mysql 5.7数据库
docker run -d --name mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root_password mysql:5.7.27
如需做数据持久化存储，可加参数-v $PWD:/var/lib/mysql挂载数据卷到宿主机上，避免容器删除数据丢失。

### 部署安装DzzOffice
docker run -d --name dzzoffice -p 80:80 imdevops/dzzoffice:latest
如需做数据持久化存储，可加参数-v $PWD:/var/www/html/data挂载数据卷到宿主机上，避免容器删除数据丢失。

注意：挂载数据卷后，需要使用命令docker exec -it dzzoffice bash 进入容器内，执行命令 chown -R www-data:www-data /var/www/html/data 给data目录读写权限

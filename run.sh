#清理临时镜像
docker rmi $(docker images -q -f dangling=true)
#清理所有容器
docker rm $(docker ps -a -q)
rm -rf  db/mysql/*
docker-compose build
docker-compose up 

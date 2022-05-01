CREATE user 'instituto' identified by 'instituto';
GRANT all PRIVILEGES on instituto.* to instituto;

docker system prune

docker rm -vf $(docker ps -a -q)


docker rmi -f $(docker images -a -q)



https://github.com/dmulligan/docker-example-tomcat-mysql/blob/master/docker-compose.yml

https://stackoverflow.com/questions/38060279/deleting-all-docker-images-and-containers

https://developpaper.com/deploying-mysql-tomcat-with-docker-compose/

https://github.com/devops4solutions/CI-CD-using-Docker/blob/master/docker-compose.yml

https://www.youtube.com/watch?v=siPdgVzLZNY


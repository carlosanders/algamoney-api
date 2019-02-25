# executando sem deletar
docker run -it --name=tomcat -d --publish=8080:8080 anders/tomcat8 /opt/tomcat/bin/catalina.sh run
# exec removendo imagem ao criar
docker run -it --rm --name=tomcat -d --publish=8080:8080 anders/tomcat8 /opt/tomcat/bin/catalina.sh run

# entrando no container
docker exec -it tomcat /bin/sh
# rodando o catalina no container
/opt/tomcat/bin/catalina.sh run

docker container rm tomcat8
docker container stop tomcat

#Deploy!!
docker cp algamoney-api-1.0.0.war bbbb68b715bf:/opt/tomcat/webapps/
docker cp exmaple.war tomcat8:/opt/tomcat/webapps/
# vrf logs
docker logs 43bb8e7105d9 -f
docker logs tomcat8 -f

# links:
# https://medium.com/@adilsonbna/otimizando-espa%C3%A7os-de-docker-images-utilizando-alpine-3-5-tomcat-8-java-1-8-com-dockerfile-b8d39fe46e3d

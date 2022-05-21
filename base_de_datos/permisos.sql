CREATE user 'instituto' identified by 'instituto';
GRANT all PRIVILEGES on instituto.* to instituto;

docker system prune

docker container prune

docker network prune

docker volume prune


7.  git gc --prune=now --aggressive
8.  git push --all --force



docker rm -vf $(docker ps -a -q)


docker rmi -f $(docker images -a -q)

docker network rm `docker network ls -q`

docker inspect -f '{{ .NetworkSettings.IPAddress }}' f9eea6ffd5c2

dig mysql

127.0.0.53
----------------------------------
el docker compose que funciona junto con su dockerfile java phpmyadmin mysql
https://www.youtube.com/watch?v=siPdgVzLZNY
  <property name="javax.persistence.jdbc.url" value="jdbc:mysql://db:3306/instituto?serverTimezone=UTC&amp;usessl=false&amp;allowPublicKeyRetrieval=true&amp;tlsVersion=TLSv1.2"/>
      <property name="javax.persistence.jdbc.user" value="instituto"/>
      <property name="javax.persistence.jdbc.driver" value="com.mysql.cj.jdbc.Driver"/>
      <property name="javax.persistence.jdbc.password" value="instituto"/>
      <property name="javax.persistence.schema-generation.database.action" value="create"/>
---------------------------------------------------------------------------






docker rm $(docker ps -aq)

docker rm -f $(docker ps -aq)

docker network create mysql

docker network list


docker run -d --name mysql --network mysql -e MYSQL_ROOT_PASSWORD="instituto" mysql

docker-compose-javaInstituto

docker-compose-db

docker-compose up --build

docker network create mysql-net


docker build -t appwith .

docker run -p 9089:8080 --name mibiblio --link mysqldb-container -d appwith 

docker run --name mysqldb-container -p 4306:3306 -e MYSQL_ROOT_PASSWORD=ROOT -d mysql





sudo docker-compose pull
sudo docker-compose build --no-cache
sudo docker-compose up -d --force-recreate


sudo docker logs contenedor
sudo mkdir /var/www/marketexpert.com
sudo mkdir /etc/ssl/certs/market_expert_certificate.crt




CTINSTITUTO_DB_HOST: db
CTINSTITUTO_DB_USER: instituto
CTINSTITUTO_DB_PASSWORD: instituto
CTINSTITUTO_DB_NAME: instituto



https://github.com/dmulligan/docker-example-tomcat-mysql/blob/master/docker-compose.yml

https://stackoverflow.com/questions/38060279/deleting-all-docker-images-and-containers

https://developpaper.com/deploying-mysql-tomcat-with-docker-compose/

https://github.com/devops4solutions/CI-CD-using-Docker/blob/master/docker-compose.yml

https://www.youtube.com/watch?v=siPdgVzLZNY

https://www.youtube.com/watch?v=NdwB5TPXCnQ


 String usu = request.getParameter("usu");
                                    String pas = request.getParameter("pas");

                                    String[] usuu = null;
                                    String[] pass = null;

                                    try {
                                        usuu = usu.split("-");
                                        pass = pas.split("-");
                                        usu = usuu[1];
                                        pas = pass[0];
                                    } catch (Exception e) {
                                    }

                                    EntityManagerFactory emf = Persistence.createEntityManagerFactory("GestionInstitutoJavaFinalPU");
                                    // Registrar_usuarios ru = null;
                                    Registrar_usuariosJpaController rujc = new Registrar_usuariosJpaController(emf);
                                    EntityManager em = emf.createEntityManager();
                                    String dni_usu = null;
                                    String clave_usu = null;
                                    Query consultaM = em.createQuery("Select re_us From Registrar_usuarios re_us where re_us.usuario = :usuario", Registrar_usuarios.class);
                                    consultaM.setParameter("usuario", usu);
                                    Registrar_usuarios usus = null;
                                    try {
                                        usus = (Registrar_usuarios) consultaM.getSingleResult();
                                        dni_usu = usus.getDni();
                                        clave_usu = usus.getClave();
                                    } catch (NoResultException e) {
                                        usus = null;
                                    }


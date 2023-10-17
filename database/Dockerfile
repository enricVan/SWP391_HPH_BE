FROM mysql:latest

ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_USER=admin    
ENV MYSQL_PASSWORD=admin

COPY ./init.sql /docker-entrypoint-initdb.d/

EXPOSE 3306

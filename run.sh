#!/bin/bash
mvn spring-boot:stop
mvn clean package
java -jar target/dorm_mnm-0.0.1-SNAPSHOT.jar

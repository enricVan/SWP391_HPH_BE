FROM maven:3.6.3-openjdk-11 AS builder

WORKDIR /app    

COPY pom.xml .
COPY src ./src

RUN mvn clean package

FROM openjdk:11-jdk

WORKDIR /app

COPY --from=builder /app/target/dorm_mnm-0.0.1-SNAPSHOT.jar .

EXPOSE 8888

CMD ["java", "-jar", "dorm_mnm-0.0.1-SNAPSHOT.jar"]
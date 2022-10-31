FROM maven:3.5-jdk-8-alpine as build

MAINTAINER Sandeep Kumar Patel

LABEL "Team"="Indian_DevOps" "Env"="Dev" "Woner"="Sandeep"

COPY src /home/app/src

COPY pom.xml /home/app

RUN mvn -f /home/app/pom.xml clean package

FROM openjdk:8

COPY --from=build /home/app/target/s2-movie-info-service-0.0.1-SNAPSHOT.jar s2-movie-info-service-0.0.1-SNAPSHOT.jar

EXPOSE 8082

ENTRYPOINT ["java", "-jar", "s2-movie-info-service-0.0.1-SNAPSHOT.jar"]

FROM adoptopenjdk:11-hotspot-bionic AS build
COPY ./ /opt/eureka/
WORKDIR /opt/eureka
RUN ./mvnw -f /opt/eureka/pom.xml clean package

FROM adoptopenjdk:11-hotspot-bionic
COPY --from=build /opt/eureka/target/eureka-0.0.1-SNAPSHOT.jar /opt/eureka.jar 
EXPOSE 8080
ENTRYPOINT ["java","-jar","/opt/eureka.jar"]

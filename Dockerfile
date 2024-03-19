FROM openjdk:17
EXPOSE 8080
ADD target/springboot-camel-k8s-1.0.0.jar springboot-camel-k8s-1.0.0.jar
ENTRYPOINT ["java", "-jar", "springboot-camel-k8s-1.0.0.jar"]

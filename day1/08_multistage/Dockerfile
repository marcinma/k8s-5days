FROM gradle:4.10.2-jdk8 AS builder
USER root
RUN mkdir -p /app
WORKDIR /app
COPY build.gradle ./
ADD src ./src
RUN gradle build

FROM openjdk:11-jre-slim
# COPY --from=nginx:latest /etc/nginx/nginx.conf /nginx.conf
COPY --from=builder /app/build/libs/gs-spring-boot-docker-0.1.0.jar .
EXPOSE 8080/tcp
ENV MULTISTAGE="yes!"
ARG GITHASH
ENV GITHASH=${GITHASH}
ENTRYPOINT [ "java", "-jar", "./gs-spring-boot-docker-0.1.0.jar"]
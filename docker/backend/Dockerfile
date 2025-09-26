FROM maven:3.9-eclipse-temurin-21 AS builder
ARG APP_DIR
WORKDIR /build

COPY ${APP_DIR} ./app
COPY docker/backend/settings.xml /root/.m2/settings.xml

WORKDIR /build/app
RUN mvn -s /root/.m2/settings.xml -B clean package -DskipTests

FROM eclipse-temurin:21-jre-alpine
WORKDIR /app
COPY --from=builder /build/app/target/*.jar /app/app.jar
ENTRYPOINT ["sh", "-c", "java -jar /app/app.jar"]

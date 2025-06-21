# Usa la imagen oficial de OpenJDK con Java 17
FROM eclipse-temurin:17-jdk as builder

# Directorio de trabajo
WORKDIR /app

# Copia los archivos de construcción
COPY gradlew .
COPY gradle gradle
COPY build.gradle .
COPY settings.gradle .
COPY src src

# Construye la aplicación
RUN ./gradlew bootJar

# Imagen final más pequeña
FROM eclipse-temurin:17-jre

WORKDIR /app

# Copia el JAR construido
COPY --from=builder /app/build/libs/*.jar app.jar

# Puerto expuesto
EXPOSE 9000

# Comando de ejecución
ENTRYPOINT ["java", "-jar", "app.jar"]

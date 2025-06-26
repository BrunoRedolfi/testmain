# Imagen base ligera con Java 17
FROM eclipse-temurin:17-jre

# Directorio de trabajo en el contenedor
WORKDIR /app

# Copiar el JAR construido
COPY build/libs/*.jar app.jar

# Exponer el puerto de la aplicación
EXPOSE 9000

RUN mkdir -p /app/tmp && chmod 777 /app/tmp
ENV JAVA_TOOL_OPTIONS="-Djava.io.tmpdir=/app/tmp -Dserver.tomcat.basedir=/app/tmp -Dserver.tomcat.accesslog.directory=/app/tmp"

# Comando para ejecutar la aplicación
ENTRYPOINT ["java", "-jar", "app.jar"]

FROM openjdk:8-jre-alpine3.9

VOLUME /tmp

ARG DEPENDENCY=target/dependency
COPY ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY ${DEPENDENCY}/META-INF /app/META-INF
COPY ${DEPENDENCY}/BOOT-INF/classes /app

ENTRYPOINT ["sh", "-c", "java $JVM_OPTS -cp app:app/lib/* lejeunen.hello.HelloApplication"]

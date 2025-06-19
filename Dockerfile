FROM ghcr.io/graalvm/native-image-community:21 AS native-builder

WORKDIR /app

COPY target/ni-demo-*.jar app.jar

RUN jar -xvf app.jar

RUN native-image -H:Name=ni-demo -H:Path=/app \
    -H:ConfigurationFileDirectories=META-INF/native-image/com.ol/ni-demo \
    -cp .:BOOT-INF/classes:BOOT-INF/lib/*

FROM debian:bookworm-slim

COPY --from=native-builder /app/ni-demo /app/ni-demo

ENTRYPOINT ["/app/ni-demo"]

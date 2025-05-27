FROM ghcr.io/graalvm/native-image-community:21 AS native-builder

WORKDIR /app

COPY . .

RUN ./mvnw -Pnative package -DskipTests

# OR if you already have a JAR built:
# RUN native-image -jar target/your-app.jar

FROM debian:bookworm-slim

COPY --from=native-builder /app/target/ni-demo /ni-demo

ENTRYPOINT ["./ni-demo"]

# docker-buildx build --platform=linux/amd64 --load -t ni-demo .    - when building on M1 for x86
# docker-buildx build -t ni-demo .    - usual build command

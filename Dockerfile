FROM ghcr.io/graalvm/native-image-community:21 AS native-builder

WORKDIR /app

COPY . .

RUN ./mvnw -Pnative package -DskipTests

FROM debian:bookworm-slim

COPY --from=native-builder /app/target/ni-demo /ni-demo

ENTRYPOINT ["./ni-demo"]


FROM vegardit/graalvm-maven:21.0.2 AS native-builder

WORKDIR /app

COPY . .

RUN mvn -o package -Pnative

FROM debian:bookworm-slim

COPY --from=native-builder /app/target/ni-demo /app/ni-demo

ENTRYPOINT ["/app/ni-demo"]

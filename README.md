# Native Image Demo

This project is a simple demo to test native image generation using Spring Boot and GraalVM. It provides three ways to build and test the application:

## Prerequisites

- GraalVM 21 installed
- Maven installed
- Docker installed

## Ways to Build and Test

### 1. Build Java Application with Native Profile

Use the Maven `native` profile to compile the application into a native image.

```bash
mvn package -Pnative
```

The native executable will be generated in the `target` directory.

### 2. Build Docker Image from Existing Dockerfile

Use the provided `Dockerfile` to build a Docker image. Depending on your system architecture, choose the appropriate command:

- **For M1 Mac or ARM-based systems targeting x86 architecture:**
  Use this command to ensure compatibility with x86 architecture:
  ```bash
  docker-buildx build --platform=linux/amd64 --load -t ni-demo .
  ```

- **For standard builds on compatible systems:**
  Use this command for a regular build:
  ```bash
  docker-buildx build -t ni-demo .
  ```

- **Fallback option (if `buildx` is not available):**
  Use the standard Docker build command:
  ```bash
  docker build -t ni-demo:latest .
  ```

Run the Docker container:

```bash
docker run --rm -p 8080:8080 ni-demo:latest
```

### 3. Build Docker Image Using Spring Command

Use the Maven `native` profile with the Spring Boot plugin to build a Docker image directly.

```bash
mvn -Pnative spring-boot:build-image
```

Run the Docker container:

```bash
docker run --rm -p 8080:8080 ni-demo:0.0.1-SNAPSHOT
```

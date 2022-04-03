# docker-musl-arm
Musl based compiler setup for cross compiling ARM binaries

## Build

Build the docker image with the following command:

```shell
docker build -t lehmrob/docker-musl-arm .
```

## Run

Start the container with the following command:

```shell
docker run -d --cap-add sys_ptrace -p 127.0.0.1:2222:22 lehmrob/docker-musl-arm
```

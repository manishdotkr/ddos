FROM ubuntu:latest

WORKDIR /app

RUN apt update && apt install -y golang git \
    && GOPROXY=direct go install github.com/six-ddc/plow@latest \
    && mv $(go env GOPATH)/bin/plow /usr/local/bin/plow \
    && chmod +x /usr/local/bin/plow

ENTRYPOINT ["plow"]

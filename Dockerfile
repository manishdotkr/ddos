FROM ubuntu:latest

# Install required packages
RUN apt update && \
    apt install -y golang git && \
    GOPROXY=direct go install github.com/six-ddc/plow@latest && \
    echo 'export PATH=$PATH:$(go env GOPATH)/bin' >> /root/.bashrc

CMD ["bash"]

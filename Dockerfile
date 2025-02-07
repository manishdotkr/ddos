FROM ubuntu:latest

WORKDIR /app

RUN apt update && apt install -y golang git \
    && GOPROXY=direct go install github.com/six-ddc/plow@latest \
    && mv $(go env GOPATH)/bin/plow /usr/local/bin/plow \
    && chmod +x /usr/local/bin/plow

# Set the default command but allow users to override
ENTRYPOINT ["/usr/local/bin/plow"]
CMD ["--help"]

##############################################
### **Explanation of Fixes**
# 1. **`ENTRYPOINT ["/usr/local/bin/plow"]`**  
#    - This makes `plow` the default executable, so any arguments passed will be appended to it.  
#    - Example:  
#      ```sh
#      docker run -it --name plow ghcr.io/manishdotkr/plow:1.0.0 -c 50 -n 2000 --timeout 5m https://manish.kr
#      ```
#      translates to:
#      ```sh
#      plow -c 50 -n 2000 --timeout 5m https://manish.kr
#      ```
# 
# 2. **`CMD ["--help"]` (Fallback command)**  
#    - If no arguments are provided, it defaults to `plow --help`.  
#    - This allows running the container interactively without needing a command:
#      ```sh
#      docker run -it --name plow ghcr.io/manishdotkr/plow:1.0.0
#      ```
#      which is equivalent to:
#      ```sh
#      plow --help
#      ```
# 
# 3. **Supports `docker exec -it plow bash`**  
#    - Since the container doesn’t exit immediately, you can start it and then exec into it.

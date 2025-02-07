# Running Plow Docker Image

This guide explains how to pull and run the `plow` image from **GitHub Container Registry (GHCR)**.

## Pulling the Docker Image
To pull the latest version of the Plow image, use the following command:

```sh
docker pull ghcr.io/manishdotkr/plow:latest
```

## Running the Plow Container
To run `plow` using the Docker image, use the command below:

```sh
docker run -it --name plow ghcr.io/manishdotkr/plow:latest plow -c <concurrent_connections> -n <number_of_requests> --timeout <timeout_for_each_request> <domain_name>
```

### Explanation of Flags
- `-c, --concurrency=1` → Number of connections to run concurrently.
- `--rate=infinity` → Number of requests per time unit (e.g., `--rate 50`, `--rate 10/ms`).
- `-n, --requests=-1` → Total number of requests to send.
- `--timeout=DURATION` → Timeout for each HTTP request.

## Example Usage
To send **2000 requests** concurrently with **50 connections** and a **5-minute timeout**, run:

```sh
docker run -it --name plow ghcr.io/manishdotkr/plow:latest plow -c 50 -n 2000 --timeout 5m https://manish.kr
```

This will stress-test the given domain (`https://manish.kr`) using Plow inside a Docker container.

---
Now you're all set to use **Plow** for load testing and performance benchmarking! 🚀

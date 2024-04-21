NAME=ghcr.io/uenob/openssl-ocsp:latest

openssl-ocsp.tar: Dockerfile
	docker buildx build --platform=linux/amd64 -t $(NAME) .
	docker save -o $@ $(NAME)

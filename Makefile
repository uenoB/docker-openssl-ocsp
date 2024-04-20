NAME=ghcr.io/uenob/openssl-ocsp:latest

openssl-ocsp.tar: Dockerfile
	docker buildx build -t $(NAME) .
	docker save -o $@ $(NAME)

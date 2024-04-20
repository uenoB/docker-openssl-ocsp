FROM --platform=linux/amd64 debian:12-slim AS build
RUN apt-get update
RUN apt-get install -y openssl

FROM --platform=linux/amd64 gcr.io/distroless/base-debian12
COPY --from=build /usr/lib/ssl/openssl.cnf /usr/lib
COPY --from=build /usr/bin/openssl /usr/bin
WORKDIR /root
CMD ["openssl", "ocsp", \
     "-index", "/certs/index.txt", \
     "-CA", "/certs/cacert.pem", \
     "-rsigner", "/certs/signer.pem", \
     "-ignore_err", \
     "-ndays", "1", \
     "-port", "8888"]

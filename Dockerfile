FROM debian:12-slim AS build
RUN apt-get update
RUN apt-get install -y openssl

FROM gcr.io/distroless/base-debian12:nonroot
COPY --from=build /usr/lib/ssl/openssl.cnf /usr/lib
COPY --from=build /usr/bin/openssl /usr/bin
WORKDIR /
CMD ["openssl", "ocsp", \
     "-index", "/certs/index.txt", \
     "-CA", "/certs/cacert.pem", \
     "-rsigner", "/certs/signer.pem", \
     "-ignore_err", \
     "-ndays", "1", \
     "-port", "8888"]

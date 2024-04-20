# docker-openssl-ocsp

This is a Docker container image of [OpenSSL OCSP responder] constructed atop
[distroless].

[OpenSSL OCSP responder]: https://www.openssl.org/docs/manmaster/man1/openssl-ocsp.html
[distroless]: https://github.com/GoogleContainerTools/distroless?

## Setup

```sh
docker pull ghcr.io/uenob/openssl-ocsp
```

## Usage

Mount a volume containing the following to `/certs`.
- `index.txt`: index of certificates
- `cacert.pem`: CA certificates corresponding to `index.txt`
- `signer.pem`: OCSP responder's certificate and private key

For example:
```sh
docker run -v certs:/certs:ro ghcr.io/uenob/openssl-ocsp
```

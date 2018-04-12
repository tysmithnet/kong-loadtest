#! /bin/bash

docker run -d           \
    -p 80:80            \
    -p 443:443          \
    -p 8000:8000        \
    -p 8443:8443        \
    -p 8001:8001        \
    -p 8444:8444        \
    tysmithnet/kong-loadtest:latest

FROM debian:13

# COPY data.txt /

RUN apt update

RUN apt install -y redis-server

EXPOSE 6379/tcp

RUN useradd -m -s /bin/bash camille

WORKDIR /home/camille
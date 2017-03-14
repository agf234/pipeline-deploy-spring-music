FROM viniciusffj/docker-cf-cli
COPY pcfdev-v0.22.0+PCF1.8.2-linux /usr/local/bin/pcfdev
RUN ls -ltr && bash -c /usr/local/bin/pcfdev

RUN apt-get update
RUN apt-get install ftp


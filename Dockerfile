FROM golang:1.6.2-alpine
MAINTAINER george.macrorie@honeycomb.tv 

ENV GLIDE_RELEASE=0.10.2

RUN apk update 

RUN apk add openssl samba-client

WORKDIR /home

RUN wget "https://github.com/Masterminds/glide/releases/download/${GLIDE_RELEASE}/glide-${GLIDE_RELEASE}-linux-amd64.tar.gz"

RUN gunzip "glide-${GLIDE_RELEASE}-linux-amd64.tar.gz" && tar -xvf "glide-${GLIDE_RELEASE}-linux-amd64.tar"

RUN chmod +x /home/linux-amd64/glide

RUN ln -s /home/linux-amd64/glide /usr/local/bin/glide

WORKDIR /go

ENTRYPOINT ["/bin/sh"]

FROM alpine:3.6

WORKDIR /opt/koko
ARG VERSION=master \
    NAME=koko-master-accd0e6 \
	ARCH=linux-amd64

RUN set -xe \
   && sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/' /etc/apk/repositories \
   && apk update \
   && apk add -U tzdata \
   && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
   && echo "Asia/Shanghai" > /etc/timezone \
   && curl -sSL -o - https://github.com/jumpserver/koko/releases/download/${VERSION}/${NAME}-${ARCH}.tar.gz \
   && tar -xf ${NAME}-${ARCH}.tar.gz --strip-components=1 \
   && rm -rf ${NAME}-${ARCH}.tar.gz \
   && apk del tzdata \
   && rm -rf /var/cache/apk/*

ADD config.yml .

VOLUME /app/coco/logs
VOLUME /app/coco/keys

EXPOSE 2222

CMD [ "./koko" ]

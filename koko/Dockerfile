FROM alpine:3.11
WORKDIR /opt
ARG Version=1.5.6

RUN set -ex \
   && sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/' /etc/apk/repositories \
   && apk update \
   && apk add -U tzdata \
   && apk add curl mariadb-client \
   && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
   && echo "Asia/Shanghai" > /etc/timezone \
   && wget https://github.com/jumpserver/koko/releases/download/${Version}/koko-master-linux-amd64.tar.gz \
   && tar -xf koko-master-linux-amd64.tar.gz \
   && mv kokodir koko \
   && chown -R root:root koko \
   && rm -rf koko-master-linux-amd64.tar.gz \
   && apk del tzdata \
   && rm -rf /var/cache/apk/*

COPY koko/entrypoint.sh .
RUN chmod 755 ./entrypoint.sh

CMD [ "./entrypoint.sh" ]

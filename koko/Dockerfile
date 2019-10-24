FROM alpine:3.9
WORKDIR /opt/koko
ARG Version=1.5.4

RUN set -ex \
   && sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/' /etc/apk/repositories \
   && apk update \
   && apk add -U tzdata \
   && apk add curl \
   && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
   && echo "Asia/Shanghai" > /etc/timezone \
   && wget https://github.com/jumpserver/koko/releases/download/${Version}/koko-master-linux-amd64.tar.gz \
   && tar -xf koko-master-linux-amd64.tar.gz --strip-components=1 \
   && chown -R root:root * \
   && rm -rf koko-master-linux-amd64.tar.gz \
   && apk del tzdata \
   && rm -rf /var/cache/apk/*

COPY koko/entrypoint.sh .
RUN chmod 755 ./entrypoint.sh

CMD [ "./entrypoint.sh" ]

FROM alpine:3.9
WORKDIR /opt/coco
ARG Version=1.5.2
ENV KokoAssets=koko-master-accd0e6-linux-amd64

RUN set -ex \
   && sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/' /etc/apk/repositories \
   && apk update \
   && apk add -U tzdata \
   && apk add nmap \
   && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
   && echo "Asia/Shanghai" > /etc/timezone \
   && wget https://github.com/jumpserver/koko/releases/download/${Version}/${KokoAssets}.tar.gz \
   && tar -xf ${KokoAssets}.tar.gz --strip-components=1 \
   && chown -R root:root * \
   && rm -rf ${KokoAssets}.tar.gz \
   && apk del tzdata \
   && rm -rf /var/cache/apk/*

COPY koko/entrypoint.sh .
RUN chmod 755 ./entrypoint.sh

CMD [ "./entrypoint.sh" ]

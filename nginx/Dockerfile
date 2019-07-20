FROM nginx:1.16-alpine

WORKDIR /opt
ENV Version=1.5.2

RUN set -ex \
    && sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/' /etc/apk/repositories \
    && apk update \
    && apk add -U tzdata \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && wget https://github.com/jumpserver/luna/releases/download/${Version}/luna.tar.gz \
    && tar -xf luna.tar.gz \
    && chown -R root:root luna \
    && rm -rf luna.tar.gz \
    && apk del tzdata \
    && rm -rf /var/cache/apk/*

COPY ./nginx/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]

FROM centos:7
WORKDIR /opt
ARG Version=1.5.6
ENV Version=${Version} \
    LC_ALL=en_US.UTF-8

RUN set -ex \
   && yum install -y wget \
   && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
   && yum -y localinstall --nogpgcheck https://dev.mysql.com/get/Downloads/MySQL-8.0/mysql-community-client-8.0.18-1.el7.x86_64.rpm https://dev.mysql.com/get/Downloads/MySQL-8.0/mysql-community-libs-8.0.18-1.el7.x86_64.rpm https://dev.mysql.com/get/Downloads/MySQL-8.0/mysql-community-common-8.0.18-1.el7.x86_64.rpm \
   && wget https://github.com/jumpserver/koko/releases/download/${Version}/koko-master-linux-amd64.tar.gz \
   && tar -xf koko-master-linux-amd64.tar.gz \
   && mv kokodir koko \
   && chown -R root:root koko \
   && rm -rf koko-master-linux-amd64.tar.gz \
   && yum remove -y wget \
   && yum clean all \
   && rm -rf /var/cache/yum*

COPY koko/entrypoint.sh .
RUN chmod 755 ./entrypoint.sh

CMD [ "./entrypoint.sh" ]

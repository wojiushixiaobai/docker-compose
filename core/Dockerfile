FROM centos:7
WORKDIR /opt
ARG Version=1.5.6
ENV LC_ALL=en_US.UTF-8

RUN set -ex \
    && yum install -y epel-release wget \
    && wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo \
    && wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo \
    && sed -i -e '/mirrors.cloud.aliyuncs.com/d' -e '/mirrors.aliyuncs.com/d' /etc/yum.repos.d/CentOS-Base.repo \
    && yum makecache \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && yum -y install gcc nc \
    && yum -y install python36 python36-devel unzip \
    && wget https://github.com/jumpserver/jumpserver/archive/${Version}.zip \
    && unzip ${Version}.zip \
    && mv jumpserver-${Version} jumpserver \
    && chown -R root:root jumpserver \
    && yum -y install $(cat /opt/jumpserver/requirements/rpm_requirements.txt) \
    && python3.6 -m venv /opt/py3 \
    && echo -e "[easy_install]\nindex_url = https://mirrors.aliyun.com/pypi/simple/">> ~/.pydistutils.cfg \
    && source /opt/py3/bin/activate \
    && pip install wheel \
    && pip install --upgrade pip setuptools -i https://mirrors.aliyun.com/pypi/simple/ \
    && pip install -r /opt/jumpserver/requirements/requirements.txt -i https://mirrors.aliyun.com/pypi/simple/ \
    && yum clean all \
    && rm -rf /var/cache/yum/* \
    && rm -rf /opt/${Version}.zip \
    && rm -rf /var/cache/yum* \
    && rm -rf ~/.cache/pip

COPY core/entrypoint.sh .
RUN chmod 755 ./entrypoint.sh

CMD ["./entrypoint.sh"]

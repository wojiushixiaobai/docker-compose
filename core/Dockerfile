FROM centos:latest
WORKDIR /opt
ARG Version=1.5.3

RUN set -ex \
    && curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo \
    && curl -o /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo \
    && yum makecache \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && yum -y install kde-l10n-Chinese gcc nc \
    && yum -y reinstall glibc-common \
    && localedef -c -f UTF-8 -i zh_CN zh_CN.UTF-8 \
    && export LC_ALL=zh_CN.UTF-8 \
    && echo 'LANG="zh_CN.UTF-8"' > /etc/locale.conf \
    && yum -y install python36 python36-devel unzip wget \
    && wget https://github.com/jumpserver/jumpserver/archive/${Version}.zip \
    && unzip ${Version}.zip \
    && mv jumpserver-${Version} jumpserver \
    && chown -R root:root jumpserver \
    && yum -y install $(cat /opt/jumpserver/requirements/rpm_requirements.txt) \
    && python3.6 -m venv /opt/py3 \
    && echo -e "[easy_install]\nindex_url = https://mirrors.aliyun.com/pypi/simple/">> ~/.pydistutils.cfg \
    && source /opt/py3/bin/activate \
    && pip install --upgrade pip setuptools -i https://mirrors.aliyun.com/pypi/simple/ \
    && pip install -r /opt/jumpserver/requirements/requirements.txt -i https://mirrors.aliyun.com/pypi/simple/ \
    && yum clean all \
    && rm -rf /var/cache/yum/* \
    && rm -rf /opt/${Version}.zip \
    && rm -rf /var/cache/yum/* \
    && rm -rf ~/.cache/pip

COPY core/entrypoint.sh .
RUN chmod 755 ./entrypoint.sh

ENV LANG=zh_CN.UTF-8 \
    LC_ALL=zh_CN.UTF-8

CMD ["./entrypoint.sh"]

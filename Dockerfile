# --- download ---

FROM alpine:3.9.2 as download

RUN wget http://down.360safe.com/360Jiagu/360jiagubao_linux_64.zip

RUN unzip 360jiagubao_linux_64.zip

# --- prod ---

FROM centos:7.6.1810 as prod

MAINTAINER v7lin <v7lin@qq.com>

RUN yum -y install kde-l10n-Chinese telnet; \
    yum -y reinstall glibc-common; \
    yum clean all; \
    localedef -c -f UTF-8 -i zh_CN zh_CN.utf8

ENV LC_ALL "zh_CN.UTF-8"

COPY --from=download /360jiagubao_linux_64/jiagu /jiagu

ENV JAVA_HOME /jiagu/java
ENV PATH $PATH:$JAVA_HOME/bin

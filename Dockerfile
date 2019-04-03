# --- download ---

FROM alpine:3.9.2 as download

RUN wget http://down.360safe.com/360Jiagu/360jiagubao_linux_64.zip

RUN unzip 360jiagubao_linux_64.zip

# --- prod ---

FROM centos:7.6.1810 as prod

MAINTAINER v7lin <v7lin@qq.com>

COPY --from=download /360jiagubao_linux_64/jiagu /jiagu

ENV JAVA_HOME /jiagu/java
ENV PATH $PATH:$JAVA_HOME/bin

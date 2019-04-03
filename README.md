# qihoo360-jiagu-docker

[![Build Status](https://cloud.drone.io/api/badges/v7lin/qihoo360-jiagu-docker/status.svg)](https://cloud.drone.io/v7lin/qihoo360-jiagu-docker)
[![Docker Pulls](https://img.shields.io/docker/pulls/v7lin/jiagu.svg)](https://hub.docker.com/r/v7lin/jiagu)

### 项目源码

[360加固助手](http://jiagu.360.cn/#/global/download)

### usage

* docker

````
docker run --rm -it -v ${PWD}:/channel v7lin/jiagu sh -c "java -jar /jiagu/jiagu.jar -version"
docker run --rm -it -v ${PWD}:/channel v7lin/jiagu sh -c "java -jar /jiagu/jiagu.jar -login ${QIHOO_360_ACCOUNT} ${QIHOO_360_PASSWORD} && java -jar /jiagu/jiagu.jar -jiagu /channel/app.apk /channel && ls /channel"
````

* drone

````
- name: jiagu-qihoo360
  image: v7lin/jiagu
  environment:
    QIHOO_360_ACCOUNT:
      from_secret: QIHOO_360_ACCOUNT
    QIHOO_360_PASSWORD:
      from_secret: QIHOO_360_PASSWORD
  commands:
  - APK_OUTPUT_DIR=app/build/outputs/apk/release
  - java -jar /jiagu/jiagu.jar -login $QIHOO_360_ACCOUNT $QIHOO_360_PASSWORD
  - java -jar /jiagu/jiagu.jar -jiagu $APK_OUTPUT_DIR/app-release.apk $APK_OUTPUT_DIR
  - ls $APK_OUTPUT_DIR
````

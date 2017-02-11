FROM ruby:2.3.0 

ENV DEBIAN_FRONTEND noninteractive 

RUN apt-get update && \
  apt-get install -y --no-install-recommends mysql-server tcl && \
  apt-get install --no-install-recommends -y -q curl python build-essential git ca-certificates && \
  apt-get install -y libgmp3-dev && \
  apt-get clean

# start by installing dependencies 
RUN apt-get -qq -y install build-essential wget

RUN { \
  echo '[mysqld]'; \
  echo 'character-set-server=utf8'; \
  echo 'collation-server=utf8_general_ci'; \
  echo '[client]'; \
  echo 'default-character-set=utf8'; \
} > /etc/mysql/conf.d/charset.cnf

ENV REDIS_VERSION 3.2.4 

RUN cd /tmp && \
  wget http://download.redis.io/releases/redis-$REDIS_VERSION.tar.gz && \
  tar xfvz redis-$REDIS_VERSION.tar.gz && \
  cd redis-$REDIS_VERSION && \
  make && \
  make install && \
  cd ../ && \
  rm -f redis-$REDIS_VERSION.tar.gz && \
  rm -rf redis-$REDIS_VERSION

RUN mkdir /nodejs && \
    curl http://nodejs.org/dist/v0.10.30/node-v0.10.30-linux-x64.tar.gz | tar xvzf - -C /nodejs --strip-components=1 

ENV PATH $PATH:/nodejs/bin

MAINTAINER Siva Praveen <rsivapraveen001@gmail.com>

FROM ruby:2.3.0 

ENV DEBIAN_FRONTEND noninteractive 

RUN apt-get update && \
  apt-get install -y --no-install-recommends mysql-server tcl && \
  apt-get install --no-install-recommends -y -q curl python build-essential git ca-certificates && \
  apt-get install -y libgmp3-dev && \
  apt-get clean

RUN apt-get -qq -y install build-essential wget

RUN mkdir -p /scripts/setup/ /scripts/exec/

RUN wget "https://github.com/AlexMary/docker_repo/blob/master/scripts/setup/chruby.sh" -O /scripts/setup/chruby.sh && \
	chmod 755 /scripts/setup/chruby.sh && \
	/scripts/setup/chruby.sh && \
	echo "source /usr/local/share/chruby/chruby.sh" >> ~/.bashrc

RUN wget "https://github.com/AlexMary/docker_repo/blob/master/scripts/setup/ruby-install.sh" -O /scripts/setup/ruby-install.sh && \
	chmod 755 /scripts/setup/ruby-install.sh && \
	/scripts/setup/ruby-install.sh

RUN wget "https://github.com/AlexMary/docker_repo/blob/master/scripts/setup/rubies.sh" -O /scripts/setup/rubies.sh && \
	chmod 755 /scripts/setup/rubies.sh &&  \
	/scripts/setup/rubies.sh

RUN wget "https://github.com/AlexMary/docker_repo/blob/master/scripts/exec/run.sh" -O /scripts/exec/run.sh && \
	chmod 755 /scripts/exec/run.sh && \
	/scripts/exec/run.sh

MAINTAINER Siva Praveen <rsivapraveen001@gmail.com>

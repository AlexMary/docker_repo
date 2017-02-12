FROM ruby:2.3.0 

ENV DEBIAN_FRONTEND noninteractive 

RUN apt-get update && \
  apt-get install -y --no-install-recommends mysql-server tcl && \
  apt-get install --no-install-recommends -y -q curl python build-essential git ca-certificates && \
  apt-get install -y libgmp3-dev && \
  apt-get clean

RUN apt-get -qq -y install build-essential wget

COPY /scripts/setup/chruby.sh /scripts/setup/chruby.sh

RUN /scripts/setup/chruby.sh

RUN echo "source /usr/local/share/chruby/chruby.sh" >> ~/.bashrc

COPY /scripts/setup/ruby-install.sh /scripts/setup/ruby-install.sh

RUN /scripts/setup/ruby-install.sh

COPY /scripts/setup/rubies.sh /scripts/setup/rubies.sh

RUN /scripts/setup/rubies.sh

COPY /scripts/exec/run.sh /scripts/exec/run.sh

CMD /scripts/exec/run.sh

MAINTAINER Siva Praveen <rsivapraveen001@gmail.com>

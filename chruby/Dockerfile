FROM ruby:2.3.0 

ENV DEBIAN_FRONTEND noninteractive 

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

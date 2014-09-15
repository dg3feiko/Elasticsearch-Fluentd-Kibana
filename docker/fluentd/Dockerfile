# DOCKER-VERSION 1.1.2
# VERSION        0.1

FROM ubuntu
MAINTAINER Justin Plock <justin@plock.net>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y -q curl libcurl4-openssl-dev make sudo ruby-dev
RUN curl -L http://toolbelt.treasuredata.com/sh/install-ubuntu-trusty-td-agent2.sh | sh

ENV LD_PRELOAD /usr/lib/fluent/jemalloc/lib/libjemalloc.so
RUN ulimit -n 65536

# Install plugins
RUN /usr/lib/fluent/ruby/bin/fluent-gem install fluent-plugin-elasticsearch
RUN /usr/lib/fluent/ruby/bin/fluent-gem install fluent-plugin-record-reformer
RUN /usr/lib/fluent/ruby/bin/fluent-gem install -V fluentd-ui

EXPOSE 24224
EXPOSE 9292

ENTRYPOINT ["/usr/sbin/fluentd-ui"]
CMD ["start"]

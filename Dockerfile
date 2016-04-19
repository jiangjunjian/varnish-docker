FROM        ubuntu:14.04
MAINTAINER  tinnt701

RUN apt-get install -y curl
RUN apt-get install -y apt-transport-https
RUN curl https://repo.varnish-cache.org/GPG-key.txt | apt-key add -
RUN echo "deb https://repo.varnish-cache.org/ubuntu/ trusty varnish-4.1" >> /etc/apt/sources.list.d/varnish-cache.list
RUN apt-get update
RUN apt-get install -y varnish vim

ADD default.vcl /etc/varnish/default.vcl

ENV VARNISH_PORT 80
ENV VARNISH_MEMORY 100m

EXPOSE 80

ADD varnish_start.sh /varnish_start.sh
RUN sudo chmod 777 /varnish_start.sh
CMD ["/varnish_start.sh"]
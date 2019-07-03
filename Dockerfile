FROM ubuntu:18.04
MAINTAINER  Copyright @ airdb.com

ENV WORKDIR /usr/local/openresty/nginx/
WORKDIR ${WORKDIR}

RUN echo "export PS1='[\H \W]\\$ '" >> /root/.profile

RUN apt-get update && apt-get install -y wget gnupg2 && \
	wget -qO - https://openresty.org/package/pubkey.gpg | apt-key add - && \
	apt-get -y install software-properties-common && \
	add-apt-repository -y "deb http://openresty.org/package/ubuntu $(lsb_release -sc) main"

RUN apt-get update && apt-get install -y openresty
# build-essential wget
# RUN cpan Test::Nginx::Socket

ADD conf ${WORKDIR}/conf
ADD lua ${WORKDIR}/lua

EXPOSE 8080
CMD ["openresty"]

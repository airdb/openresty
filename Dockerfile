FROM openresty/openresty
MAINTAINER  Copyright @ airdb.com

RUN echo "export PS1='[\H \W]\\$ '" >> /root/.profile

RUN apt-get update && apt-get install -y build-essential
RUN cpan Test::Nginx::Socket

WORKDIR /usr/local/openresty/nginx
EXPOSE 80
CMD ["openresty"]

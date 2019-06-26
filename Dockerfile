FROM openresty/openresty
MAINTAINER  Copyright @ airdb.com

RUN echo "export PS1='[\H \W]\\$ '" >> /root/.profile

WORKDIR /usr/local/openresty/nginx
EXPOSE 8080
CMD ["openresty"]

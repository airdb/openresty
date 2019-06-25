FROM openresty/openresty
MAINTAINER  Copyright @ airdb.com

RUN echo "export PS1='[\H \W]\\$ '" >> /root/.profile

EXPOSE 8080
CMD ["openresty", "-c", "/etc/nginx/conf/nginx.conf"]

FROM  openresty/openresty
MAINTAINER  Dean <Dean@airdb.com>

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

run:
	docker run -p9000:8080 -v $(shell pwd):/etc/nginx/ openresty/openresty:alpine "openresty" "-c" "/etc/nginx/conf/nginx.conf"
runshell:
	docker run -it -p9000:8080 -v $(shell pwd):/etc/nginx/ openresty/openresty:alpine /bin/sh

service="gateway.airdb.io"
image="airdb/gateway"

run:
	docker run -d --name=${service}  -p9000:8080 -v $(shell pwd):/etc/nginx/  ${image}
	#docker run -p9000:8080 -v $(shell pwd):/etc/nginx/ openresty/openresty "openresty" "-c" "/etc/nginx/conf/nginx.conf"
runshell:
	docker run -d --name=${service}  -p9000:8080 -v $(shell pwd):/etc/nginx/  ${image} /bin/bash

build:
	docker build -t ${image} .

reload restart:
	docker restart ${service}

clean:
	docker stop ${service}
	docker rm ${service}

log logs:
	docker logs -f ${service}

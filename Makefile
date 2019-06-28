service="gateway.airdb.io"
# image="openresty/openresty"
image="airdb/gateway"

run:
	docker run -d --name=${service}  -p9000:8080 \
		-v $(shell pwd)/conf/:/usr/local/openresty/nginx/conf/ \
		-v $(shell pwd)/lua/:/usr/local/openresty/nginx/lua/ \
		-v $(shell pwd)/t/:/usr/local/openresty/nginx/t/ \
		${image} "openresty"

runshell:
	docker run -d --name=${service}  -p9000:8080 -v $(shell pwd):/etc/nginx/  ${image} /bin/bash

exec:
	docker exec -it ${service} /bin/bash

build:
	docker build -t ${image} .

restart:
	docker restart ${service}

reload: restart test

clean:
	docker stop ${service}
	docker rm ${service}

log logs:
	docker logs -f ${service}

test:
	docker exec -it ${service} prove

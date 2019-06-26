service="gateway.airdb.io"
image="openresty/openresty"

run:
	docker run -d --name=${service}  -p9000:8080 -v $(shell pwd)/conf/:/usr/local/openresty/nginx/conf ${image} "openresty"

runshell:
	docker run -d --name=${service}  -p9000:8080 -v $(shell pwd):/etc/nginx/  ${image} /bin/bash

exec:
	docker exec -it ${service} /bin/bash

build:
	docker build -t ${image} .

reload restart:
	docker restart ${service}
	make test

clean:
	docker stop ${service}
	docker rm ${service}

log logs:
	docker logs -f ${service}

test:
	curl http://localhost:9000/

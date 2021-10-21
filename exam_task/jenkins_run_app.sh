#!/bin/bash
echo "==================START=================="
chek=$(docker ps -a | grep app_hello_world | wc -l)
if [ $chek != "0" ]
then
	docker stop $(docker ps -a -q)
	docker rmi app_hello_world
	# docker rmi $(docker images -f dangling=true -q) # for go_app
fi
docker build -t app_hello_world .
docker run -it -p 80:80 -d --rm app_hello_world
echo "===================END==================="

# # ========== Part for test server ==============
# sleep 5
# curl -XPOST -d'{}' http://localhost
# docker stop $(docker ps -a -q)
# docker rmi app_hello_world
# # docker rmi $(docker images -f dangling=true -q) # for go_app
# # ========== Part for test server ==============

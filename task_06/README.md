## Task docker_container
### Status OK
### Deadline - 
## subject [here](./subject.md)
How to use:
docker build -t service .
docker run -it -p 443:443 -p 80:80 service

or:
docker build -t service . && docker run -it -p 443:443 -p 80:80 --rm service && docker rmi service

# SERVICE
### Status KO
### Deadline - September 22, 2021
## subject [here](./subject.md)

# How to use:
* in bash
```
cd service && docker build -t service . && docker run -it --rm service && docker rmi service
```
* in another window
```
curl -XPOST -d'{"animal":"cow", "sound":"moooo", "count": 3}' http://localhost/
```

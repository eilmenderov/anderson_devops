# SERVICE
### Status OK
### Deadline - September 22, 2021
## subject [here](./subject.md)

# How to use:
* create VM (need VirtualBox and Vagrant on your PC):
```
vagrant up
```
* configurate VM:
```
ansible-playbook -i hosts.ini playbook.yml
```
* edit the hosts file (if necessary):
```
sudo echo 192.168.50.5 myvm.localhost >> /etc/hosts
```
* in terminal try:
```
curl -XPOST -d'{"animal":"cow", "sound":"moooo", "count": 3}' http://myvm.localhost/
```

# Final Task
### Status OK
### Deadline - October 21, 2021
## subject [here](./subject.md)

## Public DNS adress:
* [Jenkins](http://ec2-3-142-93-28.us-east-2.compute.amazonaws.com:8080/)
* [Go app](http://ec2-3-144-200-218.us-east-2.compute.amazonaws.com/)
* [Python app](http://ec2-3-15-230-0.us-east-2.compute.amazonaws.com/)

## Apps repository
[python_app_repo](https://github.com/Avchar/python_app_hw) and [go_app_repo](https://github.com/Avchar/go_app_hw) 

## Description
I completed this task in a few steps:
* Created 4 **AWS-instance**(Ubuntu for Jenkins and 3 Debian 10 for Go and Python apps and one for tests) with **Terraform**
* Configured servers(Debian 10) for the Applications with **Ansible**
* Created and push to github-repo my apps
* Configured jenkins_serv with Ansible and manually configured **Jenkins** (plugins, nodes, jobs).
* Configured web-hooks from **Github** to jenkins_serv


## Check:
* go: ```curl -XPOST -d'{}' http://ec2-3-144-200-218.us-east-2.compute.amazonaws.com```
* python: ```curl -XPOST -d'{}' http://ec2-3-15-230-0.us-east-2.compute.amazonaws.com```

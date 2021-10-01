## Telegramm bot
### Status OK
### Deadline - October 1, 2021
## subject [here](./subject.md)

## How to use:
Try Find in tg ```@avchar_anderson_task_status_bot```. Start with ```help```. If bot not responsing then :
1. In terminal run:
```
docker run --rm 362467713659.dkr.ecr.us-east-2.amazonaws.com/tg-bot-repo ; docker rmi 362467713659.dkr.ecr.us-east-2.amazonaws.com/tg-bot-repo
```
2. Try to use bot again.

## How to build tg_bot
```Fill in the line TG_TOKEN in main.go, also you can change GIT_REPO and GIT_TREE```
build Docker-container:
```
docker build -t tg_bot .
```
run container:
```
docker run -it -p 443:443 -p 80:80 --rm tg_bot
```
delete docker image:
```
docker rmi tg_bot
```

### Docker container size:
![size](./goApp/size.png)

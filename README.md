## Prerequisites
You need create .env file from .env.dist:

It would be have to install docker (version>=19.\*.\*) & docker-compose (version>=1.17.\*) before installing this project.

## Installing
Execute follow command in application root directory
```
./rapidoc install
```
Command above - build the docker images and starting containers. If images already exist - just starting containers. 

## Other featues of instalation script
Usage: rapidoc [OPTIONS]

| Command | Description |
| :---: | :---: |
| `rapidoc start` | Build the docker images and starting containers.if images already exist - just starting containers. |
| `rapidoc stop` | Stop docker containers and services. |
| `rapidoc help` |  Info about the script |

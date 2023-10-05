# Docker

## Resume

- Docker (comes from Dock worker)
- Docker Inc. (before 2013 called dotCloud)
- Docker project was writen in golang
  - Open source
  - Tools
    - Docker engine
    - Docker machine
    - Docker compose
    - Docker swarm
    - Docker hub (image repository)
    - Docker Trusted Registry (DTR)
    - Docker Tutum
    - Docker Universal Control Panel
- Open Container Initiative
  - Docker
  - Core OS: rkt (appc specification)
- Containers Registry
  - docker hub
  - docker store

## Ports

- engine port `2375`
- secure engine port `2375`
- swarm port `2375`

## Clustering and orchestration

- swarm
- stacks
- bundles

## Install Docker

### Ubuntu Linux

### Windows Server 2016

Run the following commands:

- `Install-WindowsFeature containers`
- `Restart-Computer -Force`
- `Install-Module -Name DockerMsftProvider -Force`
- `Install-Package -Name docker -ProviderName DockerMsftProvider -Force`
- `Restart-Computer -Force`

## Commands

- `docker --help` returns the command list

- `docker <command> --help` returns the help for a specified command
  - `docker start --help` returns the help for the _start_ command

- `docker build` (**PENDING**)

- `docker exec <container_id>` execute a command into the container
  - `docker exec elegant_noether du -mh`
  - `docker exec -it elegant_noether /bin/bash` (`-it` is for interactive mode)

- `docker info` get docker information

- `docker inspect <container_id>` get the docker information
  - `docker inspect c266cf74976c` (this will show all of the container properties)

- `docker images` list the images
  - `docker image -l`

- `docker kill <container_id>` stops a container (Forced way)
  - `docker kill a0900d2e60bb`

- `docker history`
  - `docker history <image> --no-trunc`

- `docker logs <container_id>`

- `docker network`
  - `docker network create <network_name>`
  - `docker network ls`

- `docker rm` remove container
  - `docker rm a0900d2e60bb`
  - `docker rm --force a0900d2e60bb` (This will remove the container even fi is running)

- `docker rmi` remove image
  - `docker rmi $(docker images -a -q)` to remove all the images
  - `docker rmi -f IMAGE_ID IMAGE_ID IMAGE_ID` to force remove the specified images

- `docker run <image>` run a docker image

  - `docker run -d --name web -p 80:8080 niguelpoulton/pluralsight-docker-ci`
    - `-d` is to run in the background (detached)
    - `-p CONTAINER_PORT:HOST_PORT` bind the local machine port `80` to the container `8080` port

  - `docker run -d --name "my-mongo-test" -p 27017:27017 mongo:3.4.1-windowsservercore` (`-d` is to run in the background)
    - `-d` is to run in the background (detached)
    - `-p CONTAINER_PORT:HOST_PORT` bind the local machine port `27017` to the container `27017` port

- `docker search <keyword>` search for images

- `docker start <container_id>` starts a container
  - `docker start web`

- `docker stop <container_id>` stops a container
  - `docker stop web`

- `docker ps` shows the running containers
  - `docker ps -a -f name=Identity` list all the containers with a "name" starting with Identity
    > This filter is case-sensitive

  - `docker ps -a | findstr subscription` list all the containers with "subscription" in it

- `docker pull <image>` pulls an image
  - `docker pull mongo`

- `docker push <image>` push an image

- `docker version` shows the docker version details

## Dockerfile

```Dockerfile
FROM httpd:2.4
EXPOSE 80
COPY page.html /usr/local/apache2/htdocs/
RUN apt-get update && apt-get install -y fortunes
LABEL maintainer="moby-dock@example.com"
```

- `docker image build --tag web-server:1.0 .`
- `docker run -p 80:80 web-server:1.0`

### Copying data

- `docker cp page.html elegant_noether:/usr/local/apache2/htdocs/`
- `docker run -d -p 80:80 --name my-web -v /my-files:/usr/local/apache2/htdocs web-server:1.1`

## Useful commands

Remove all images

```sh
docker rmi -f $(docker images -q)
```

Remove all containers

```sh
docker rm -f $(docker ps -q)
```

## Popular images

| Image                         | Description                               |
|-------------------------------|-------------------------------------------|
| microsoft/dotnet              | .NET Core for Linux and Windows           |
| microsoft/aspnet              | ASP.NET for .NET Core or .NET Framework   |
| microsoft/mssql-server-linux  | Microsoft SQL Server on Linux             |

## Troubleshooting

- `Error response from daemon: pull access denied for ******, repository does not exist or may require 'docker login'`
  - Check the repository name, e.g. use `microsoft/dotnet` instead `dotnet`

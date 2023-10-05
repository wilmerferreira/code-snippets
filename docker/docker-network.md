# Docker: Network

## Commands

### ls

Lists all the networks

```sh
docker network ls
```

### inspect

Inspects or describe a network

```sh
docker network inspect bridge
```

### create

Creates a new network

```sh
docker network create --driver bridge new_network
```

Creates a new network with a subnet and gateway

```sh
docker network create --driver=bridge --subnet=192.168.2.0/24 --gateway=192.168.2.10 new_subnet
```

## Run within a network

Run a new container in a new network

```sh
docker run --network=isolated -itd --name=docker-nginx nginx
```

## References

https://www.techrepublic.com/article/how-to-create-and-manage-docker-networks/

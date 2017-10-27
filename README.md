# Hellokite CI Example

## Generate or update service with kite

```
kite generate service . --image-version=0.2.0 --chart-version=0.1.1 --image gcr.io/helios-devel/hellokite --git https://github.com/helios-technologies/hellokite --provider gcp
```

## Build the container image

```shell
make build
```

## Run the container locally

```
make run
```

Now check your [CONTAINER_IP:8080](http://CONTAINER_IP:8080) in browser or curl it. You should see `Hello, Hellokite!`

Inspect container to retrive the IP:
```
docker ps
docker inspect CONTAINER_ID
```

## Push image to registry
```
make push
```

## Deploy container to kubernetes with Helm

```
make deploy
```


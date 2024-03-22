## About

Run a Eigenlayer Node on testnet Spheron

If you don't already have one, (Create a Spheron account )[https://app.spheron.network/#/signup]

## Setup

```bash
docker build --platform linux/amd64 -t spheron-eigenlayer-test .
```

Push to DockerHub
```
docker tag spheron-eigenlayer-test chrisaspheron/spheron-eigenlayer-test:latest
docker push chrisaspheron/spheron-eigenlayer-test:latest
```


```
docker build --platform linux/amd64 -t spheron-eigenlayer-test .
```
# Base Docker Image

This docker image includes all dependencies used in all services. 

In a new `Dockerfile` of a service include the following base

```docker
FROM ghcr.io/licenseware/docker-images/licenseware-docker:latest
```

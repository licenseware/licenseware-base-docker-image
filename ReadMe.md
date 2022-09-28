# Base Docker Image

This docker image includes all dependencies used in all services. 

Either in the Dockerfile or docker-compose.yml file add the following base:

```docker
FROM ghcr.io/licenseware/docker-images/licenseware-docker:latest
```

Recomended pin to a specific tag:

```docker
docker pull ghcr.io/licenseware/docker-images/licenseware-docker:1.0.4
```


# How to create custom docker images

How to create custom docker images files with dependencies already available.

# Create a public github repo

By creating a public repo we strip away the hassle of dealing with auth/secrets tokens etc.

See `.github/workflows` folder for an example of a Dockerfile action build. 


# Create Dockerfile

Inside a new folder do the following:


Add your custom dependencies in `requirements.txt` file.

```bash
Flask==1.1.4
redis==3.5.3
marshmallow==3.12.1
pymongo==3.12.0
etc
```

These dependencies will be available on your custom dockerfile.


Inside a new file `Dockerfile` specify to install all dependencies to python. 

```docker

FROM python:3.8.12-bullseye

WORKDIR /usr/local/src/

COPY . .

RUN python -m pip install --upgrade pip \
    && pip install git+https://git@github.com/licenseware/licenseware-sdk-v2.git \
    && pip install -r requirements.txt 


CMD ["python3"]

```


# Pull custom docker image

Inside a new `Dockerfile` of your service add the following `FROM` command:

```docker

FROM ghcr.io/licenseware/docker-images/licenseware:1.0.0

```

This way the dependencies from requirements.txt file will be available in docker.

FROM python:3.8.12-bullseye

WORKDIR /usr/local/src/

COPY . .

RUN python -m pip install --upgrade pip \
    && pip install git+https://git@github.com/licenseware/licenseware-sdk-v2.git \
    && pip install -r requirements.txt 


CMD ["python3"]
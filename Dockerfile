FROM python:3.8

WORKDIR /usr/local/src/

COPY . .

RUN python -m pip install --upgrade pip
RUN pip install git+https://git@github.com/licenseware/licenseware-sdk-v2.git


CMD ["python3"]
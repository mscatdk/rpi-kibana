# rpi-kibana

Kibana (<https://www.elastic.co/products/kibana>) build for Raspberry PI and potentially other ARM devices.

## How to use

The docker container can be executed as follows:

```bash
docker run -d -p 5601:5601 \
           -e ELASTICSEARCH_URL="http://elasticsearch:9200" \
           mscatdk/rpi-kibana:latest
```

where

* ELASTICSEARCH_URL: The Elasticsearch Endpoint URL with default value <http://elasticsearch:9200>

## Build process

```bash
git clone git@github.com:mscatdk/rpi-kibana.git
cd rpi-kibana

docker build . -t mscatdk/rpi-kibana:latest
```

## Test

The docker image has been tested on the following devices:

* Raspberry Pi 1 Model B
* Raspberry PI 3 Model B
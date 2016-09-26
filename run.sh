#!/bin/bash

docker pull diabol/elasticsearch
docker pull diabol/kibana
docker pull diabol/logstash

docker-compose up

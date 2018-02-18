#!/bin/bash

sed -i "s,ELASTICSEARCH_URL,${ELASTICSEARCH_URL},g" /usr/share/kibana/config/kibana.yml

/usr/share/kibana/bin/kibana

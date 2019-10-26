#!/bin/bash

python3 render.py

mv /templates/metricbeat.yml /etc/metricbeat/metricbeat.yml
mv /templates/mongodb.yml /etc/metricbeat/modules.d/mongodb.yml

metricbeat setup
metricbeat run
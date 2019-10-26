# metricbeat

```sh
docker build -t metricbeat-mongodb .

docker run --rm -it  \
-e "MONGODB_URL=mongodb//mongodb:27017" \
-e "ELASTICSEARCH_URL=http://elasticsearch:9200" \
-e "KIBANA_URL=http://kibana:5601" \
metricbeat-mongodb
```

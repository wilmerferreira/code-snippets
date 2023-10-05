# Elastic

Initially this was called the ELK stack (Elasticsearch, Logstash, Kibana).

Nowadays is called Elastic Stack:

- Elasticsearch: Engine that search, analyze, and store data.
- Logstash: Centralize, transform & stash Data.
- [Kibana](kibana/kibana.md): Web interface that allows visualize data.
- Beats: lightweight platform that send data from edge machines to Logstash and Elasticsearch.
- Alerting

## Ports

| Application   | Type  | Port      |
|---------------|-------|-----------|
| Elasticsearch | TCP   | `9300`    |
| Elasticsearch | HTTP  | `9200`    |
| Logstash      | TCP   | `5000`    |
| Kibana        | HTTP  | `5601`    |

## Reference

- [Docker ELK](https://github.com/deviantony/docker-elk)

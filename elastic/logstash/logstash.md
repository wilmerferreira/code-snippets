# Elastic: Logstash

Collection Engine:

1. Ingest
2. Enhance or modify
3. Forward

Configuration:

- `input`: Where is data coming from (logs, beats, etc.)
- `filter`: Where the data is parsed, ignored or modified
- `output`: Where to store the logs (Backend, Elasticsearch, etc.)

## Filter Plugins

[Filter Plugins](https://www.elastic.co/guide/en/logstash/current/filter-plugins.html)

- [grok](https://www.elastic.co/guide/en/logstash/current/plugins-filters-grok.html)

# Elastic: Kibana

- Discover
- Visualize
- Dashboard
- Timelion
- Dev Tools
- Management

## Docker

1. Create a elastic search container

   ```ps
   docker run -d --name elasticsearch -p 9200:9200 docker.elastic.co/elasticsearch/elasticsearch:6.6.1
   ```

2. Open [Elastic Search](http://localhost:9200)

3. Create a kibana container

   ```ps
   docker run -d --name kibana -p 5601:5601 docker.elastic.co/kibana/kibana:6.6.1
   ```

4. Open [Kibana](http://localhost:9200)

## Scripted fields

[Scripted fields](https://www.elastic.co/guide/en/kibana/current/scripted-fields.html)

> This should be avoided (as a good practice) since introduce a search overhead an more CPU consumption, ideally we need to [change the _ingest_](https://stackoverflow.com/questions/39742322/parse-nginx-ingress-logs-in-fluentd) with the expected data.

### Expression

- [Lucene Expressions scripting](https://www.elastic.co/guide/en/elasticsearch/reference/7.2/modules-scripting-expression.html)

### Painless

- [Using Painless in Kibana](https://www.elastic.co/blog/using-painless-kibana-scripted-fields)
- [Painless scripting](https://www.elastic.co/guide/en/elasticsearch/reference/7.2/modules-scripting-painless.html)

## Alerting with Watcher

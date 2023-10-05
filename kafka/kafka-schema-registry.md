# Kafka: Schema Registry

## Schema Registry

### Schemas

- GET `/schemas/ids/{int: id}`

### Subjects

- **GET**: `/subjects`

  http://localhost:8081/subjects

- **DELETE**: `/subjects/(string: subject)`
- **GET**: `/subjects/(string: subject)/versions`
- **POST**: `/subjects/(string: subject)/versions`
- **GET**: `/subjects/(string: subject)/versions/(versionId: version)`
- **GET**: `/subjects/(string: subject)/versions/(versionId: version)/schema`
- **POST**: `/subjects/(string: subject)`
- **DELETE**: `/subjects/(string: subject)/versions/(versionId: version)`

### Compatibility

- **POST** `/compatibility/subjects/(string: subject)/versions/(versionId: version)`

### Config

- PUT `/config`
- GET `/config`

  ```http
  http://localhost:8081/config
  ```

- PUT `/config/(string: subject)`
- GET `/config/(string: subject)`

[Reference](https://docs.confluent.io/current/schema-registry/docs/api.html)
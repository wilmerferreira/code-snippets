# PostgreSQL: Extensions

## pg_trgm

[pg_trgm — support for similarity of text using trigram matching](https://www.postgresql.org/docs/current/pgtrgm.html)

Functions:

- `similarity()`
- `show_trgm()`
- `word_similarity()`
- `strict_word_similarity()`
- `show_limit()`
- `set_limit()`

```sql
-- Enable extension
create extension pg_trgm;

-- Usage
select similarity('kitten', 'sitting'); -- Returns: 0.428571

-- Filter by threshold
select *
from users
where name % 'Jon Doe'; -- Finds names similar to 'Jon Doe'
```

## postgis

[Spatial Data](./spatial.postgresql.md)

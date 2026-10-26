# Fakes

## Generate rows based on range of numbers

```sql
with documents as
(
    select concat('J', lpad(cast(seq as text), 8, '0')) document_prefix
    from generate_series(1, 10) as seq
)
select *
from documents;
```

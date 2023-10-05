# Mongo Shell

> aka `mongosh`

## Commands

- `cls`
- `db`
  - `db.dropDatabase()`
  - `db.COLLECTION`
- `exit`
- `help`
- `use DATABASE`: switch (or create) a database
- `show`
  - `show collections`: lists collections of the current database
  - `show dbs`: lists the database
  - `show logs`
  - `show profile`
  - `show roles`
  - `show tables`
  - `show users`

### Create

```js
// Insert one
db.users.insertOne({ name: "John" });

// Insert many
db.users.insertMany({ name: "First" }, { name: "Second" }, { name: "Many more ..." });
```

### Read

- `.find()`
- `.sort()`
- `.limit()`: takes up to X number of documents
- `.skip()`: skips X number of documents
- `.pretty()`: prettify the json output

```js
// Find one
db.users.findOne({ name: "John" });

// Find many
db.users.find({ name: "John" });

// Count
db.users.count({ name: "John" });

// Sorting
db.users.find().sort({ name: 1, age: -1 }); // Positives numbers indicates ascending order, negatives descending

// Selecting fields
db.users.find({}, { name: 1, age: 1 }); // Positive numbers will be returned (_id will be always returned unless is specified otherwise)
db.users.find({}, { age: 0 }); // In this case it will return all the other fields except "age"

// Complex queries
db.users.find({ name: { $eq: "Sally" } });
```

#### Read Operators

- `$eq`
- `$neq`
- `$gt`
- `$gte`
- `$lt`
- `$lte`
- `$in`
- `$nin`
- `$exists`
- `$and`
- `$or`
- `$not`
- `$expr`

### Update

```js
db.users.updateOne({ age: 26 }, { $set: { age: 27 } }); // Finds one document where the age is 26 and replaces it with 27

db.users.updateMany({ enabled: false }, { $set: { enabled: true } }); // Finds one document where the age is 26 and replaces it with 27

db.users.replaceOne();

db.users.findAndModify();
```

#### Update Operators

- `$set`
- `$inc`
- `$rename`
- `$unset`
- `$push`
- `$pull`

### Delete

```js
db.users.deleteOne()
db.users.deleteMany()
```

## Investigate

- `$expr`
- Projections
- Aggregations
- Joins

## More Information

- [MongoDB Shell Docs](https://www.mongodb.com/docs/mongodb-shell/)

# MongoDB

## Docker

This uses the [official image from docker hub](https://hub.docker.com/_/mongo/)

```sh
docker run --name mongo -e MONGO_INITDB_ROOT_USERNAME=root -e MONGO_INITDB_ROOT_PASSWORD=YourStrongPassword -p 27017:27017 --restart always -d mongo
```

> We can then connect through `mongodb://localhost:27017`

## IDEs

- [Compass](https://www.mongodb.com/products/compass) (official IDE)

  ```sh
  winget install MongoDB.Compass.Community
  ```

- [DataGrip](https://www.jetbrains.com/datagrip/)
- [Studio 3T](https://studio3t.com/) or [Studio 3T Free](https://robomongo.org/) (Previously known as Robo 3T)

  ```sh
  winget install 3T.Robo3T
  ```

- [NoSQLBooster](https://nosqlbooster.com/)

## .NET Example

1. Install the Nuget Package [MongoDB.Driver](https://www.nuget.org/packages/MongoDB.Driver) in your project

   ```sh
   dotnet add package MongoDB.Driver 
   ```

2. Add the following _usings_

   ```cs
   using MongoDB.Driver;
   using MongoDB.Bson;
   ```

3. Example

   ```cs
   string connectionString = "mongodb://root:YourStrongPassword@localhost:27017/admin";

   var client = new MongoClient(connectionString);
   var database = client.GetDatabase("admin");

   // Get MongoDB version
   var versionCommand = new BsonDocument { { "buildInfo", 1 } };
   var versionResult = database.RunCommand<BsonDocument>(versionCommand);
   Console.WriteLine($"MongoDB Version: {versionResult["version"]}");

   // Get current database date-time
   var dateCommand = new BsonDocument { { "serverStatus", 1 } };
   var dateResult = database.RunCommand<BsonDocument>(dateCommand);
   Console.WriteLine($"Database Date-Time: {dateResult["localTime"]}");
   ```

## Object hierarchy

1. Server
2. Database
3. Collections
4. Documents

## Data Types

- `JSON`
  - `String`
  - `Boolean`
  - `Number`
  - `Array`
  - `Object`
  - `null`

- `BSON`
  - `Double`
  - `String`
  - `Object`
  - `Array`
  - `BinData`
    - `UUID`
    - `MD5`
  - `Undefined`
  - `ObjectID`
  - `Boolean`
  - `Date`
  - `null`
  - `RegExpr`
  - `Int32`
  - `Timestamp`
  - `Long` (64-bit)
  - `Decimal128`

### Methods

- `Date`
  - `Date()`: method which returns the current date as a string.
  - `new Date()`: constructor which returns a Date object using the ISODate() wrapper.
  - `ISODate()`: constructor which returns a Date object using the ISODate() wrapper.

## Operations

### Create

- `insertOne()`

  ```js
  db.
  ```

- `insertMany()`

### Read

```js
db.getCollection("worldPopulation").find() // Way to reference a collection
db.worldPopulation.findOne() // returns a single document
db.worldPopulation.find() // returns a cursor
db.worldPopulation.find().pretty() // Formats the json output

// db.collection.find({}).sort({ fieldName: sortOrder })
db.worldPopulation.find().sort({ population: 1 }) // Positive for ascending order, negative for descending

db.worldPopulation.estimatedDocumentCount()  // estimation based on collection metadata
db.worldPopulation.countDocuments({ population: { $lt: 1000000 } }) // alias for an aggregation pipeline - accurate count
```

## Investigate

- Projections and aliases
- Foreign Keys and joins
- Group & having
- merge, select into and update from
- Indexes and constraints (e.g. unique indexes)
- CTEs?
- Stored procedures
- Views
- Transactions
- [Text search](https://www.mongodb.com/docs/manual/core/index-text/)
- Spatial data

## More Information

- [Docs](https://www.mongodb.com/docs/)
  - [Data Types](https://www.mongodb.com/docs/mongodb-shell/reference/data-types/)
    - [BSON Types](https://www.mongodb.com/docs/manual/reference/bson-types/)
  - [Load Sample Data](https://www.mongodb.com/docs/atlas/sample-data/)

- [mongo - DockerHub](https://hub.docker.com/_/mongo/)

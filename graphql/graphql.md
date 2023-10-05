# GraphQL

Comments can be added to queries with the `#` character

```gql
query PetsAndCarers {
  # This will return all the pets and their name
  allPets {
    name
  }
}
```

And _documentation_ comments can also be added to the schema with `"""` blocks

> Normal comments are also supported in the schema

```gql
"""
An object that describes a bank holiday in the United Kingdom
"""
type BankHoliday {
  """
  Name of the bank holiday
  """
  title: String!
  date: String!
  notes: String # Notes are optional
  bunting: Boolean!
}
```

## Queries and Mutations

All the objects in the schema are case sensitive.

### Queries

```gql
query PetsAndCarers {
  allPets {
    name
    weight
    category
    # It supports comments
    whoCheckout: inCareOf {
      username
      name
    }
  }
}
```

### Fields

```gql
query people {
  allPeople {
    forename
    middleName
    surname
    birthDate
    gender
  }
}
```

### Arguments

```gql
query people {
  allPeople {
    forename
    middleName
    surname
    birthDate
    gender(type:FEMALE)
  }
}
```

### Aliases

```gql
query PetsAndCarers {
  pets: allPets {
    name
    weight
    category
    # It renames the "inCareOf" to "whoCheckout"
    whoCheckout: inCareOf {
      username
      name
    }
  }
}
```

### Fragments and the spread operator

#### Inline Fragments

### Operation Name

The operation name for queries and mutations can be omitted but it's a bad practice.

Therefore this query

```gql
query PetsAndCarers {
  pets: allPets {
    name
    weight
    category
    whoCheckout: inCareOf {
      username
      name
    }
  }
}
```

Can be written in this way

```gql
{
  pets: allPets {
    name
    weight
    category
    whoCheckout: inCareOf {
      username
      name
    }
  }
}
```

### Variables

```gql
mutation ($input: CreateAccountInput) {
  createAccount(input: $input) {
    username
    name
  }
}
```

```json
{
  "input": {
    "username": "admin",
    "name": "Administrator",
    "password": "$up3RsEcUReP@ssW0rD"
  }
}
```

#### Default

```gql
query HeroNameAndFriends($episode: Episode = JEDI) {
  hero(episode: $episode) {
    name
    friends {
      name
    }
  }
}
```

### Directives

### Mutations

```gql
mutation {
  createAccount(input: {
    username: "admin"
    name: "Administrator"
    password: "$up3RsEcUReP@ssW0rD"
  }) {
    username
    name
  }
}
```

---

## Schema and Types

### Scalars Types

- `Int`: A signed 32‐bit integer
- `Float`: A signed double-precision floating-point value.
- `String`: A UTF‐8 character sequence.
- `Boolean`: `true` or `false`.
- `ID`: Represents a unique identifier, often used to refetch an object or as the key for a cache. It is serialized in the same way as a `String`; however, defining it as an `ID` signifies that it is not intended to be human‐readable.

#### Custom Scalars

### Object Types

```gql
type Photo {
  id: ID!
  name: String!
  url: String!
  description: String
  rating: Float
  private: Boolean!
}
```

### Enumerations

```gql
enum Episode {
  NEWHOPE
  EMPIRE
  JEDI
}
```

### Lists and Non-Nulls

```gql
type User {
  username: String! # The exclamation mark indicates that the username cannot be null
  postedPhotos: [Photo!]! # The exclamation mark indicates that neither the Photo can be null nor the list
}
```

---

## Resolvers

## Subscriptions

## Questions

- Compare operators?
- How to order by?
- How to group by?
- How to paginate the results?
  - https://graphql.org/learn/pagination/
- How to flatten the response payload?
- AuthN & AuthZ

## References

- [Learn GraphQL](https://graphql.org/learn/)
- [Code: Using GraphQL](graphql.org/code)
- [Apollo](https://www.apollographql.com/)
- [Hasura](https://hasura.io/)
- [Prisma](https://www.prisma.io/)
- [AWS AppSync](https://aws.amazon.com/appsync/)
- [The Sitecore GraphQL API](https://jss.sitecore.com/docs/techniques/graphql/graphql-overview)
- [Fun with Sitecore JSS Exploring GraphQL](https://www.sugcon.eu/wp-content/uploads/2019/04/SUGCON-Europe-2019-Adam-Lamarre-Fun-with-Sitecore-JSS-Exploring-GraphQL.pdf)

- IDEs
  - [graphql/graphiql - github.com](https://github.com/graphql/graphiql)
  - [graphql/graphql-playground - github.com](https://github.com/graphql/graphql-playground)

- Playgrounds
  - [Countries](https://studio.apollographql.com/public/countries/explorer)
  - [GitHub](https://docs.github.com/en/graphql/overview/explorer)
  - [Pet Library](http://pet-library.moonhighway.com/)
  - [SnowTooth](http://snowtooth.moonhighway.com/)
  - [SpaceX](https://studio.apollographql.com/public/SpaceX-pxxbxen/)
  - [StarWars](https://studio.apollographql.com/public/star-wars-swapi/)
  - [IMDB](https://developer.imdb.com/documentation/api-documentation/)

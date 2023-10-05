# GraphQL Metadata

## __Schema

Query that returns the defined schema

```gql
type __Schema {
  # A list of all types supported by this server.
  types: [__Type!]!

  # The type that query operations will be rooted at.
  queryType: __Type!

  # If this server supports mutation, the type that mutation operations will be
  # rooted at.
  mutationType: __Type

  # If this server support subscription, the type that subscription operations will
  # be rooted at.
  subscriptionType: __Type
      
  # A list of all directives supported by this server.
  directives: [__Directive!]!
}
```

Example

```gql
{
  __schema {
    directives {
      name
      description
    }
  }
}
```

## __Type

```gql
type __Type {
  kind: __TypeKind!

  name: String

  description: String

  # Arguments
  # includeDeprecated: [Not documented]
  fields(includeDeprecated: Boolean): [__Field!]

  interfaces: [__Type!]

  possibleTypes: [__Type!]

  # Arguments
  # includeDeprecated: [Not documented]
  enumValues(includeDeprecated: Boolean): [__EnumValue!]

  inputFields: [__InputValue!]

  ofType: __Type
}
```

## __type

_Query_ that selects a single type by their `name`

```gql
{
  __type(name: "Photo") {
    kind
    name
    description
  }
}
```

## __typename

Object type's name

```gql
query {
    allLifts {
    __typename # In this case this will return the "Lift" string
    name
    }
}
```

## __Field

Object and Interface types are described by a list of Fields, each of which has a name, potentially a list of arguments, and a return type.

```gql
type __Field {
  name: String!
  description: String
  args: [__InputValue!]!
  type: __Type!
  isDeprecated: Boolean!
  deprecationReason: String
}
```

## __InputValue

```gql
type __InputValue {
  name: String!

  description: String

  type: __Type!

  # A GraphQL-formatted string representing the default value for this input value.
  defaultValue: String
}
```

- `__Type`: The fundamental unit of any GraphQL Schema is the type.
- `__TypeKind`: An enum describing what kind of type a given `__Type` is
- `__EnumValue`

## __Directive

A Directive provides a way to describe alternate runtime execution and type validation behavior in a GraphQL document.

```gql
type __Directive {
  name: String!

  description: String

  locations: [__DirectiveLocation!]!

  args: [__InputValue!]!

  onOperation: Boolean! @deprecated( reason: "Use `locations`." )

  onFragment: Boolean! @deprecated( reason: "Use `locations`." )

  onField: Boolean! @deprecated( reason: "Use `locations`." )
}
```

## More Information

- [GraphQL Schema Reference](https://docs.vectr.io/graphql/schema/)

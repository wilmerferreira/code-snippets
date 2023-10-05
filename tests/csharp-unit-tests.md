# C#: Unit Tests

## The basics

Parts of a test (AAA)

1. Arrange
2. Act
3. Assert

Assert classes:

- Assert
  - AreEqual()
  - AreNotEqual()
  - AreSame()
  - AreNotSame()
  - IsTrue()
  - IsFalse()
  - IsInstanceTypeOf()
  - IsNotInstanceTypeOf()
  - IsNull()
  - IsNotNull()
  - Fail()
  - Inconclusive()
- StringAssert
  - Matches()
  - DoesNotMatch()
  - Contains()
  - StartsWith()
  - EndsWith()
- CollectionAssert
  - AllItemsAreInstancesOfType()
  - AllItemsAreNotNull()
  - AllItemsAreUnique()
  - Contains()
  - DoesNotContain()
  - IsSubsetOf()
  - Equality (must be in the same order)
    - AreEqual()
    - AreNotEqual()
  - Equality (can be in any order and this only works with value type based collections)
    - AreEquivalent()
      - Comparer<T>.Create()
    - AreNotEquivalent()
      - Comparer<T>.Create()

Initialization and cleanup attributes

- Assembly
- Class
- Test

Organizing tests

- Grouping
  - Owner
  - Priority
  - Category
- Other
  - Ignore
  - Timeout

## Good practices

High Precision Tests

- Test one expectation per test.
- Multiple asserts on same object can be OK.
- Test should point to precise location of problem.

### Conventions

- The test project name should be the same as the project that we are going to test with the suffix test, e.g. The test project `MyNamespace.MyProject` class will be `MyNamespace.MyProjectTest`
- The test class name should be the same as the class that we are going to test with the suffix test, e.g. The test class for the `FileProcess` class will be `FileProcessTest` 
- Naming convention for the test method: `UnitOfWork_InitialCondition_ExpectedResult`

## Tips

- Each team should decide where will be the spectrum line of tests, this means, what it's relevant to test.
- When there are multiple asserts (in especially against more than one object), means than will be better break it in different tests.
- "Don't mock types you don't own". Stop jumping through hoops to work with closed-world libraries, use the tests to discover your objects and what they say to each other.

## Glossary

- SOLID
  - **S** - Single responsibility principle: a class should have only a single responsibility (i.e. changes to only one part of the software's specification should be able to affect the specification of the class).
  - **O** - Open/closed principle: “software entities … should be open for extension, but closed for modification.”
  - **L** - Liskov substitution principle: “objects in a program should be replaceable with instances of their subtypes without altering the correctness of that program.” See also design by contract.
  - **I** - Interface segregation principle: “many client-specific interfaces are better than one general-purpose interface.”
  - **D** - Dependency inversion principle: one should “depend upon abstractions, [not] concretions.”
- DRY: Don't repeat yourself (promotes the orthogonality of the code).
- DAMP: Descriptive And Meaningful Phrases (promotes the readability of the code).

## Resources

- PluralSight Courses
  - [Basic Unit Testing C# Developers](https://app.pluralsight.com/library/courses/basic-unit-testing-csharp-developers/table-of-contents)
- Popular Libraries
  - Fluent Assertions
    - [website](http://fluentassertions.com/)
    - [nuget](https://www.nuget.org/packages/FluentAssertions)

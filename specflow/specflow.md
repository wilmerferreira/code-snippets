# SpecFlow

- Feature Headers
  - `who`
  - `what`
  - `why`
- Scenario steps
  - `given`
  - `when`
  - `then`
- `#comments`
- `@tags`

```feature
Feature: FeatureName
    Description

Scenario: This is the scenario name or description
    Given an initial condition (arrange)
    When something happen (act)
    Then check an outcome (assert)

Scenario Outline: This is the scenario name or description
    Given an initial condition with a <value> (arrange)
    When something happen (act)
    Then check an outcome (assert)

    Examples:
    | value |
    | 1     |
    | 2     |
```

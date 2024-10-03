# SpecFlow

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

## Bindings

### Step definitions

- `[Given(expression)]` or `[Given]` - `TechTalk.SpecFlow.GivenAttribute`
- `[When(expression)]` or `[When]` - `TechTalk.SpecFlow.WhenAttribute`
- `[Then(expression)]` or `[Then]` - `TechTalk.SpecFlow.ThenAttribute`
- `[StepDefinition(expression)]` or `[StepDefinition]` - `TechTalk.SpecFlow.StepDefinitionAttribute`, matches for given, when or then attributes

### Hooks

- `[BeforeTestRun]` / `[AfterTestRun]`
- `[BeforeFeature]` / `[AfterFeature]`
- `[BeforeScenario]` or `[Before]`
- `[AfterScenario]` or `[After]`
- `[BeforeScenarioBlock]` / `[AfterScenarioBlock]`
- `[BeforeStep]` / `[AfterStep]`

## More Information

- [Docs](https://docs.specflow.org/en/latest/)
- [SpecFlowOSS - GitHub](https://github.com/SpecFlowOSS/)

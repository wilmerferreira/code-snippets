# SpecFlow: Gherkin

Here's an example of a feature file

```feature
Feature: Guess the word

  # The first example has two steps
  Scenario: Maker starts a game
    When the Maker starts a game
    Then the Maker waits for a Breaker to join

  # The second example has three steps
  Scenario: Breaker joins a game
    Given the Maker has started a game with the word "silky"
    When the Breaker joins the Maker's game
    Then the Breaker must guess a word with 5 characters
```

## Keywords

- `Feature`
- `Rule`
- `Scenario`: This is a concrete example that illustrates a business rule. It consists of a list of steps.

  > The keyword `Scenario` is a synonym of the keyword `Example`.

- Scenario Steps
  - `Given`: used to describe the initial context of the system - the scene of the scenario. It is typically something that happened in the past.
  - `When`: used to describe an event, or an action. This can be a person interacting with the system, or it can be an event triggered by another system.

    > It’s strongly recommended you only have a single `When` step per Scenario. If you feel compelled to add more, it’s usually a sign that you should split the scenario up into multiple scenarios.

  - `Then`: used to describe an expected outcome, or result.
  - `And` & `But`: used when is required to have successive `Given`'s, `When`'s or `Then`'s.
- `Background`
- `Scenario Outline` (or `Scenario Template`)
- `Examples`

Other additional keywords

- Doc Strings (`"""`)
- Data tables (`|`)
- Tags (`@`): are markers that can be assigned to features and scenarios. Assigning a tag to a feature is equivalent to assigning the tag to all scenarios in the feature file.
- Comments (`#`)

## Pending

- Feature Headers: `who`, `what`, `why`

## More Information

- [Learn Gherkin](https://specflow.org/learn/gherkin/)
- [Gherkin Reference](https://cucumber.io/docs/gherkin/reference/)
- [Writing Good Gherkin](https://automationpanda.com/2017/01/30/bdd-101-writing-good-gherkin/)
- [4 rules for writing good Gherkin](https://techbeacon.com/app-dev-testing/better-behavior-driven-development-4-rules-writing-good-gherkin)
- [6 Best Practices for Gherkin](https://blog.avenuecode.com/gherkin-best-practices)
- [Given When Then Best Practices: Make Scenarios Interesting](https://specflow.org/gherkin/five-ways-to-make-gherkin-interesting/)
- [Writing better Gherkin](https://cucumber.io/docs/bdd/better-gherkin/)

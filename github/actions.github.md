# Github: Actions

All the assets required for a github actions are located at `~/.github/workflows` as `yml` or `yaml` files. Here's a simple example of a workflow file

```yaml
name: My custom workflow    # Here goes the display name of the workflow

# List of triggers for this workflow
on:
  push:
    branches:
      - main

# List of the jobs and steps performed by this workflow
jobs:
  my-first-job:
    name: My first job    # Display name
    runs-on: ubuntu-latest    # Type of machine where this job will run on
    steps:
      - name: My first step
        env:
          NAME: Wilmer
        run: |
          echo "Hello $NAME!"
```

## Pending to Investigate

Sections

- [defaults](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions#defaults)
- [env](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions#env)
- jobs
  - [container](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions#jobsjob_idcontainer)
  - [if](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions#jobsjob_idif)
  - [needs](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions#jobsjob_idneeds)
  - steps
    [uses](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions#jobsjob_idstepsuses)
    - [with](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions#jobsjob_idstepswith)
- [permissions](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions#permissions)
- [secrets](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions#jobsjob_idsecrets)

Variables

- [secrets](https://docs.github.com/en/actions/security-guides/using-secrets-in-github-actions)

## More Information

- [Docs](https://docs.github.com/en/actions)
  - [Workflow Syntax](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions)
- [Skills](https://skills.github.com/)
- [GitHub Marketplace](https://github.com/marketplace?type=actions)
- Additional Tools
  - [nektos/act](https://github.com/nektos/act)
  - [GitHub Actions Toolkit](https://github.com/actions/toolkit)
  - [GitHub CLI](https://cli.github.com/)
  - [Awesome Actions](https://github.com/sdras/awesome-actions)

# GitHub: Actions

All the assets required for a github actions' workflow are located at `~/.github/workflows` as `yml` or `yaml` files. Here's a simple example of a workflow file:

```yaml
name: My custom workflow # Here goes the display name of the workflow

on: # List of triggers for this workflow
  push:
    branches:
      - main

jobs: # List of the jobs and steps performed by this workflow
  my-first-job:
    name: My first job # Display name for this job
    runs-on: ubuntu-latest # Type of machine where this job will run on
    steps:
      - uses: actions/checkout@v1 # This uses an action from https://github.com/actions/checkout/
      - name: My first step
        env:
          NAME: Wilmer
        run: |
          echo "Hello $NAME!"
```

Components of a GitHub Action:

- **Workflows**: A workflow is an automated process that you add to your repository. A workflow needs to have at least one job, and different events can trigger it. You can use it to build, test, package, release, or deploy your repository's project on GitHub.
- **Jobs**: The job is the first major component within the workflow. A job is a section of the workflow that will be associated with a runner.
- **Steps**: A step is an individual task that can run commands in a job. In our preceding example, the step uses the action `actions/checkout@v2` to check out the repository.
- **Actions**: The actions inside your workflow are the standalone commands that are executed. These standalone commands can reference GitHub actions such as using your own custom actions, or community actions.

## Events

Workflow triggers are [events](https://docs.github.com/en/actions/using-workflows/events-that-trigger-workflows) that cause a workflow to run.

In this example the workflow will be triggered when a pull request is created, when a branch is pushed or when the workflow is manually triggered.

```yaml
on: [pull_request, push, workflow_dispatch]
# ...
```

The most common ones are:

- `push`: Runs your workflow when you push a commit or tag, or when you create a repository from a template.
- `pull_request`: Runs your workflow when activity on a pull request in the workflow's repository occurs.
- `schedule`: Allows to trigger a workflow at a scheduled UTC time using POSIX cron syntax.
- `workflow_dispatch`: enable a workflow to be triggered manually.

## Pending to Investigate

Sections

- [Contexts](https://docs.github.com/en/actions/learn-github-actions/contexts)
- [Workflow syntax for GitHub Actions](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions)
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

- [Actions](https://github.com/features/actions)
- [Docs](https://docs.github.com/en/actions)
  - [Workflow Syntax](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions)
- [GitHub Actions](https://github.com/actions)
- [GitHub Marketplace](https://github.com/marketplace?type=actions)
- Additional Tools
  - [nektos/act](https://github.com/nektos/act)
  - [GitHub Actions Toolkit](https://github.com/actions/toolkit)
  - [GitHub CLI](https://cli.github.com/)
  - [Awesome Actions](https://github.com/sdras/awesome-actions)

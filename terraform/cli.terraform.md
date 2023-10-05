# Terraform CLI

## Installation

- Download the binary from the [terraform.io/downloads](https://www.terraform.io/downloads)
- Extract the executable into a folder in your file system, e.g. `C:\Program Files\Terraform\`
- Add the path of that folder into the PATH variable
- Restart your terminals (if you have any session opened)

## Commands

```sh
# Gets the version of the CLI
terraform -version
```

### Main commands

- `init`: Prepare your working directory for other commands
  
  > Initialize a new or existing Terraform working directory by creating initial files, loading any remote state, downloading modules, etc.

  ```sh
  terraform init
  ```

- `validate`: Check whether the configuration is valid

- `apply`: Create or update infrastructure

  ```sh
  # Shows a preview of the plan and waits for the user confirmation in order to apply them
  terraform apply
  
  # Apply the changes based on a plan file
  terraform apply <PLAN.FILE>
  
  # Apply the changes without confirmation
  terraform apply -auto-approve
  ```

- `destroy`: Destroy previously-created infrastructure
- `plan`: Generates a speculative execution plan

  ```sh
  # It will display the play for the apply command
  terraform plan

  # It will display the play for the destroy command
  terraform plan -destroy
  
  # The -out flag will save the plan into the specified file
  terraform plan -destroy -out destroy.plan
  ```

### All other commands

- `console`: Try Terraform expressions at an interactive command prompt, this will open a _Read-eval-print loop_ (repl) console where the expressions can be tested

  ```sh
  terraform console

  # Test of an expression
  > 5 + 3
  8
  ```

- `fmt`: Reformat your configuration in the standard style
- `force-unlock`: Release a stuck lock on the current workspace
- `get`: Install or upgrade remote Terraform modules
- `graph`: Generate a Graphviz graph of the steps in an operation
  > The graphs can be visualized in [webgraphviz.com](http://www.webgraphviz.com/)
- `import`: Associate existing infrastructure with a Terraform resource
- `login`: Obtain and save credentials for a remote host
- `logout`: Remove locally-stored credentials for a remote host
- `output`: Show output values from your root module
- `providers`: Show the providers required for this configuration
- `refresh`: Update the state to match remote systems
- `show`: Show the current state or a saved plan

  ```sh
  # Shows the current state of the last saved plan
  terraform show

  # Shows the current state of the last saved plan in json
  terraform show -json
  ```

- `state`: Advanced state management

  > Terraform keeps a local copy of the provider's state in a file called `terraform.tfstate`, this file is managed by the cli and should not be changed manually

  - `list`: List resources in the state
  - `mv`: Move an item in the state
  - `pull`: Pull current state and output to stdout
  - `push`: Update remote state from a local state file
  - `replace-provider`: Replace provider in the state
  - `rm`: Remove instances from the state
  - `show`: Show a resource in the state

    ```sh
    terraform state show <RESOURCE.NAME>
    ```

- `taint`: Mark a resource instance as not fully functional
- `test`: Experimental support for module integration testing
- `untaint`: Remove the 'tainted' state from a resource instance
- `version`: Show the current Terraform version
- `workspace`: Workspace management

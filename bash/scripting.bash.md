# Scripting

- Set the interpreter at the beginning of the script e.g. `#!/bin/bash`
- Set the strict mode `set -e`

## Configuration

- `bash`
  - Default variables (`$PATH`, `EXPORT`, etc.) can be set in the `~/.profile` file
  - Any other configurations (aliases, running commands) should be set in `.bashrc`
- `zsh`
  - Default variables (`$PATH`, `EXPORT`, etc.) can be set in the `~/.zshenv` file
  - Any other configurations (aliases, running commands) should be set in `.zshrc`

## Snippets

Print the variables

```sh
#!/bin/bash

if [[ $# -gt 0 ]]; then
    echo 'Number of arguments:' $#
    echo $@
else
    echo 'No arguments'
fi
```

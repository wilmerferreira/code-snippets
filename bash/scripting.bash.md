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

## Comments

```sh
# This is a single line comment

: '
This is a
multiline
comment
'
```

## Variables

```sh
name="World"
echo "Hello $name!"

# Declaring specific types
declare -i number=23 # Number
declare -a array=("One" "Two" "Three") # Array

# Clearing variable
unset variable

# This is a readonly variable (constant)
readonly pi=3.14159

# This will use the value of the "another_variable" variable if "variable" is unset
echo "Hello ${variable:-another_variable}!"

# This will use the value of the "another_variable" variable if "variable" IS SET
echo "Hello ${variable:+another_variable}!"

# Display the length of a variable
echo "Length: ${#variable}"

# Capitalize
echo "${#variable^}"

# Uppercase
echo "${#variable^^}"

# Inverse capitalize
echo "${#variable,}"

# Lowercase
echo "${#variable,,}"

# Substring (from position 0 take 3 characters)
echo "${variable:0:3}"

# Substring (from position 2)
echo "${variable:2}"
```

### Special Variables

- `$0`: The name of the Bash script.
- `$1`, `$2` ... `$9`: The first 9 arguments to the Bash script. (As mentioned above.)
- `$$`: The process ID of the current script.
- `$#`: How many arguments were passed to the Bash script.
- `$@`: All the arguments supplied to the Bash script.
- `$?`: The exit status of the most recently run process.
- `$!`: The process id of the last executed command.
- `$USER`: The username of the user running the script.
- `$HOSTNAME`: The hostname of the machine the script is running on.
- `$SECONDS`: The number of seconds since the script was started.
- `$RANDOM`: Returns a different random number each time is it referred to.
- `$LINENO`: Returns the current line number in the Bash script.

## Conditionals

```sh
variable=true

# Simple if
if $variable; then
  echo "Right!"
fi

variable=10

# if/else with conditional expression
if [[ $variable -gt 0 ]]; then
  echo "Positive"
else
  echo "Negative"
fi

# if/else with arithmetic construct
if (( $variable > 0 )); then
  echo "Positive"
else
  echo "Negative"
fi
```

## Arrays and Loops

```sh
list=("Zero" "One" "Two" "Three")

# Add element in array
list+="Four"

# Length of an array
echo "${#list}"

# List all elements
echo ${list[*]}

# Remove an specific element by index
unset list[0]

# Clear array
unset list

# For loop
for (( i = 0; i < ${#list}; i++ )); do
  echo ${list[i]}
done

# For each
for item in "${list[@]}"; do
  echo $item
done

# TODO: While
# TODO: Until
```

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

## More Information

- [Start Learning Bash](https://linuxhandbook.com/bash/)
- [Unusual Ways to Use Variables Inside Bash Scripts](https://linuxhandbook.com/variables-bash-script/)
- [How to Check a Boolean If True or False in Bash](https://linuxsimply.com/bash-scripting-tutorial/conditional-statements/if/if-true-false/)

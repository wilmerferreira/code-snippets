# Bash

- **terminal** is the default app to access bash
- The fallback is **xterm**

Terminal format:

- MacOS: `hostname: directory username$`
- Linux: `username@hostname:directory`

- In linux the filenames are case sensitive but in MacOS isn't, however this is configurable.
- The filename starting with a period are hidden.
- The filename can contain any character except the forward slash (`/`).
- The file extensions are optional.
- Hidden files start with a dot (e.g., `.gitignore`)

```sh
# Returns the bash's version
bash --version
```

Handling special characters

```sh
cd My Documents # ERROR
cd My\ Documents
cd 'My Documents'
cd "My Documents"
```

Best Practices for filenames

- Use letters, numbers, dots, `-`, `_` and `.`
- Use lowercase
- Avoid spaces
- Refrain to use some special characters
  - Quotes: ` ' "
  - Brackets and parentheses: {} () <> []
  - Interpunction: ! ? & | : ; \ ^
  - Other: $ @ ~ * #
  - Whitespaces: _tab_, _delete_, _backspace_ and _newline_

## Comments

In bash comments can be done with the following syntax

```sh
# This is a Bash comment.
```

## Commands

### Common

- `cat`: shows the file content.
  - `cat -n $FILE`: displays the file content prefixed with the line number

- `cd`: change a directory.
  - `cd` will change the location to home directory, same as `cd ~`
  - `cd $LOCATION` will change the location to the specified folder.
  - `cd ..` will change the location to a parent container.
  - `cd -` change to the previous directory

- `cp`: copy file or directories in a new directory. This command could overwrite files without warnings (**The `-i` switch will ask before overwrite file and directories**)

- `curl`: downloads urls content.
  - `curl -X GET "http://google.com" -H "accept: text/html"`

- `file`: shows the file type information.
  - `file *` will show the file type information for all of the files in the current directory.

- `find`: search for files in a directory (more powerful than ls).
  - `find ~ -name '*.log'` finds all the files with the `log` extension within the `home` directory

- `grep`: search in the file content. The `-i` will search in case insensitive mode.

- `head` and `tail`: are used to take _N_ lines from the beginning (`head`) or the end (`tail`) of the file.
  - `tail /var/log/auth.log -f`

- `ls`: list the items in the current location.
  - `ls -a` include the hidden elements.
  - `ls -l` display as a long format.
  - `ls -d` display just the directories.
  - `ls folder-1 folder-2 folder-n` lists the content in each of these folders

- `less`: shows a file content per page (similar to the man command).

- `man`: Display the manual of a command.
  - `man ls`
  - `man man`

  `man` has different shortcuts in its interface:

  - `spacebar`: down a page
  - `b`: move up a page
  - `/`: search
  - `n`: next match
  - `q`: quit

- `mkdir`: will create a new folder.
  - `mkdir folder_01`
  - `mkdir folder_02 folder_03 folder_04`

- `mv`: rename or moves an item.
  - "mv my_file_without_extension my_file.txt" will rename the file to a new name.
  - "mv file1.txt file2.jpg my_file_directory" will move these two file to my_file_directory.

- `pwd`: Path to the working directory (In mac is `/users` in linux is `/home`).

- `rm`: removes files or directories.
  - `rm a_specific_file`
  - `rm -i $FILE` ask for confirmation before remove the file
  - `rm *`
  - `rm -rf *` removes everything recursive, forced
  
- `rmdir`: removes directories.

- `sort`: sort a file content.
  - `sort students.txt`
  - `sort -k2 students.txt` the `k` switch will order by the second column.
  - `sort -nk2 students.txt` the `n` switch will order like a number
  - `sort -rnk2 students.txt` the `r` switch will do a reverse order
  - `sort students.txt | uniq`
  - `sort students.txt | uniq -c`

- `ssh`: Secure shell command.

- `sudo`: super user do, allows the execution with elevated privileges

- `tail`: shows the file open it at the end (useful with logs).

- `touch`: creates a new empty file, if the file exists the system will modify some properties like access dates.

- `tr`: to replace characters in a file
  - `tr \\t \; oscars.tsv > oscars.csv`

- `wc`: word count, this displays
  1. Number of lines
  2. Number of words
  3. Number of bytes

## Globbing

This is also referred as _wildcards_, _pattern matching_, _filename generation_ or most commonly known as **globbing**

- `*` For any characters (many or none characters).
- `**` Any descendant folder
- `?` For any character (just one).
- Brace expansions
  - `[abc7_]` Characters in the brackets.
  - `[^ax2]` Characters not included in the brackets.
  - `[0-9]` Ranges.
  - `{abc,xyz,123}.txt` List of names.
  - `{a..c}{1..3}.txt` List of names (multiplied).

## Output redirection

- `>` Will write the result in a file, by default this overwrites the file if already exists, sometimes this is not the case, if you want to ensure the file is overwritten use `>|` instead.
  - `ls > list.txt`
- `>>` Will append the result in a file
  - `ls >> appended_list.txt`
  - `cat > something.txt` will let you free write to a file.

> Pending redirect to standard input with `<`, redirect standard error with `2>`

Pipe commands

- `ls > less`
- `grep 1978 oscars | sort > 1978_films.txt`
- `cut -f 3 oscars.tsv | grep 4 | wc -l`
- `xargs`
  - `find random/ -name '*.bak' | xargs rm` delete files from another command
  - `find random/ -name '*.bak' | xargs -p rm` Asks for confirmation before running the command

Command substitution

- `"Hello $(whoami)" > "$(date).txt"`

Build-in utilities

- `nano`: text editor.
- `vi`: text editor.
- `vim`: text editor (improved `vi`).
- `emacs`: text editor.

Advanced tools or commands

- `sed`
- `akw`
- `perl`
- `python`
- `fg`: foreground job.
- `bg`: background job.
  - If the commands ends with the ampersand & character, that command will be executed in background
  - The system will show a message like: [job_id] process_id
  
- `jobs`: list the current terminal session jobs.
- `ps`: shows the running processes.
  - `ps -e`
  - `ps -e | grep calc`

- `kill`: will kill a process.
  - `kill 1234`
  - `kill 5678 -k`

- `xkill`: will allow the user click a window to kill it.
- `pkill`: will kill a process and the parents.
- `top`: will shows a running process with resource consumption.
- `alias`: allows create a alias for a command.
  - `alias`
  - `alias gerp=grep`: helpful to call the right command when a common typo is typed
  - `alias rm="rm -i"`: Sets the default remove operation to ask for confirmation
  - `alias open=xdg-open`: helpful in ubuntu to point the `open` alias to the specific one in this distribution
  - `\grep` to run a command without the alias we need use the backslash character

  > `zsh` allows to define suffix aliases, this is very helpful to open certain file types without specifying the program, e.g., `alias -s txt=nano`, then nano will be automatically called when a command ending with `txt` is called, e.g., `notes.txt`

- `.bashrc`: loaded for login shell.
- `.profile`: loaded for NON-login shell.

Environment variables

- `$PS1`
- `$USER`
- `$HOME`
- `$PATH`
- `$EDITOR`

To display all the environmental variables just use `env`

To print out a variable use `echo $PS1`

To set a variable use `PS1="\h \W \u [\t] \$"`

### Useful

- Extract files with `tar`
  - `tar -zxvf confluent-hub-client-latest.tar.gz`

- Install java on WSL (Windows Subsystem for Linux)
  `sudo apt-get install default-jre`

### Shortcuts

- `Ctrl` + `d`: logout the console.
- `Ctrl` + `r`: search in the previous commands.
- `Ctrl` + `z`: suspends a running background job.
- `Ctrl` + `c`: suspends a running foreground program.
- `Ctrl` + `u`: remove typed characters

## References

- [Bash scripting cheatsheet](https://devhints.io/bash)
- [Unofficial bash strict mode](http://redsymbol.net/articles/unofficial-bash-strict-mode/)
- [special_parameters_and_shell_variables](https://wiki.bash-hackers.org/syntax/shellvars#special_parameters_and_shell_variables)

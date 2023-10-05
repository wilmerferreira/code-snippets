# Git

## Common commands

### [init](https://www.git-scm.com/docs/git-init)

- `git init`: Create an empty Git repository or reinitialize an existing one

### [add](https://www.git-scm.com/docs/git-add)

- `git add <file_path>`: Add file contents to the index

### [commit](https://www.git-scm.com/docs/git-commit)

- `git commit -m "description of your changes"`: Record changes to the repository

### [log](https://www.git-scm.com/docs/git-log)

- `git log`: Show commit logs

### pull

- `git pull` downloads all changes and merge them in the current branch
- `git pull origin <branch_name>` pulls a origin branch that does not exists in the local repository

### branch

- `git branch` lists local branches
- `git branch -d <branch_name>` deletes specified branch
- `git branch -D <branch_name>` force the deletion of local branch
- `git branch -m <old_branch_name> <new_branch_name>` renames branch

### clone

- `git clone <remote_path>` clones a remote repository

### checkout

- `git checkout <branch_name>`: switches to a different branch
- `git checkout -b <name_of_your_new_branch>`: creates a new branch based on the current branch.
- `git checkout -b <new_branch_name> <source_branch_name>` creates a new branch from another branch

### cherry-pick

- `git cherry-pick <commit_id>`: merge one specific commit into the current branch

### merge

- `git merge <from_branch_name>` merge changes

### push

- `git push origin --delete feature/branch-name` deletes a remote branch

### status

- `git status`

### [stash](https://www.git-scm.com/docs/git-stash)

- `git stash`: stash the changes in a dirty working directory away
- `git stash push -m "your_message_here"`: stash the changes with a specified message
- `git stash pop`: Remove a single stashed state from the stash list and apply it on top of the current working tree state
- `git stash list`: List the stash entries that you currently have
- `git stash clear`: removes all the saved states

### update-index

- Add: `git update-index --skip-worktree <file>`
- Remove: `git update-index --no-skip-worktree <file>`

[More info](https://medium.com/@igloude/git-skip-worktree-and-how-i-used-to-hate-config-files-e84a44a8c859)

## References

[Checkout by date](https://stackoverflow.com/questions/6990484/how-to-checkout-in-git-by-date)

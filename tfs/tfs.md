# Team Foundation Server (TFS)

## Command Prompt

Use the _Command Prompt_ in order to use the command line features

```bat
@ %comspec% /k "C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\Tools\VsDevCmd.bat"
```

### Workspaces

- list workspaces
  
  ```bat
  tf workspaces ;internal\david.smith
  ```

- Open workspace

  ```bat
  tf workspace MACHINE_NAME;internal\david.smith
  ```

- Delete a workspace

  ```bat
  tf workspace /delete MACHINE_NAME;internal\david.smith
  ```

- list checked-out files

  ```bat
  tf status /user:MACHINE_NAME\david.smith
  ```

### Shelve & shelvesets

tf shelvesets /owner:John
tf shelvesets –format:detailed ShelvesetName
tf shelve –delete ShelvesetName

## More Information

https://msdn.microsoft.com/en-us/library/w6y8ezzs(v=vs.100).aspx
https://msdn.microsoft.com/en-us/library/ms181451(v=VS.100).aspx

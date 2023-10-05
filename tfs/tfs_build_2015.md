# Team Foundation 2015

- Agent Pool > Agent
- PS> Set-ExecutionPolicy RemoteSigned
- PS> Get-ChildItem -Recurse * | Unblock-File
- PS> ConfigureAgent.ps1
> The services will be showed as "VSO Agent..."
> The agents can be created in the server level, but we need setup a queue in the collection level.
- Build definition > Steps (Tasks "Build-in or custom tasks)

Patterns

- Agent pool names
- Agent names
- Agent working folder

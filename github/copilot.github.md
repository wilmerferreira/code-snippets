# GitHub Copilot

## Slash commands

- `/help` — show chat help and supported chat actions.
- `/explain` — ask Copilot to explain a code block or behavior.
- `/fix` — request fixes for bugs, formatting, or errors.
- `/test` — ask Copilot to generate unit tests or test cases.
- `/summarize` — summarize the current code or conversation.
- `/translate` — translate code or comments to another language.
- `/optimize` — ask for performance or readability improvements.
- `/feedback` — provide feedback directly through the chat UI.

## Editor shortcuts

- Accept suggestion: `Tab` or `Right Arrow`
- Dismiss suggestion: `Esc`
- Trigger completion manually: `Ctrl+Space`
- Open Command Palette: `Ctrl+Shift+P` (`Cmd+Shift+P` on Mac)
- Open file search: `Ctrl+P` (`Cmd+P` on Mac)

## References

- `@` — reference a workspace item, file, symbol, or command.
  - Example: `@utils/logger`, `@currentFile`, `@myClass`
- `#` — reference a GitHub issue, PR, section, or named topic when supported.
  - Example: `#123`, `#authentication`, `#performance`
- Backticks `` `code` `` — highlight code, identifiers, or inline snippets in your prompt.
- Slash/colon hints — some Copilot chat UIs support `/` or `:` to open action menus or built-in helpers.

> Note: exact support for `@` and `#` depends on your editor extension version and Copilot chat implementation.

### Examples

- `@fileName` to point Copilot at a specific file.
- `@symbolName` to point to a function, class, or variable.
- `#issueNumber` to reference an issue or pull request.
- `#file:line` or `#file:start-end` to reference specific lines in a file.
- Use these references inside your prompt for clearer context:
  - `@authService Add error handling to this method.`
  - `@app/routes.ts Refactor this route handler.`
  - `#456 Write tests for the feature described in this issue.`
  - `#app/routes.ts:12` Review this specific line.
  - `#app/routes.ts:12-18` Refactor this block of code.

## .github files and folders for Copilot customization

GitHub Copilot supports repository-level customization using files and folders under `.github`.

| Type            | Use case                                                                                                                          |
|-----------------|-----------------------------------------------------------------------------------------------------------------------------------|
| Custom Agents   | When we need to manage or limit available tools                                                                                   |
| Custom Prompts  | When we find ourselves typing the same prompt over and over                                                                       |
| Agent Skills    | When we want a determined outcome or output                                                                                       |
| Instructions    | When we want to influence the output, but not necessarily with a determined output. e.g., coding standards with example snippets  |

### Direct repo files

- `.github/copilot.yml`
  - Repository settings for Copilot behavior, policies, and feature controls.
- `.github/copilot-settings.yml`
  - Alternative or version-specific Copilot configuration settings.
- `.github/copilot-instructions.md`
  - Repository-level instructions for Copilot’s default behavior and style.
  - Example: `.github/copilot-instructions.md`
  - Useful for global guidance without needing a nested instructions folder.

### Instructions

- `.github/instructions/*.instruction.md`
  - Use this folder to define custom instruction documents.
  - Example: `.github/instructions/tests.instruction.md`
  - Each file can include guidance for Copilot about coding style, test patterns, or repository conventions.

### Prompts

- `.github/prompts/*.prompt.md`
  - Use this folder to define reusable prompt templates and prompt examples.
  - Example: `.github/prompts/bugfix.prompt.md`
  - These prompt files help standardize how you ask Copilot for common tasks.

### Agents

- `.github/agents/*.agent.md`
  - Use this folder to define custom agent workflows and specialized instructions.
  - Example: `.github/agents/review.agent.md`
  - Agent files can describe a multi-step process or a domain-specific assistant.

### Skills

- `.github/skills/*.skill.md`
  - Use this folder to define custom Copilot skills or capability extensions.
  - Example: `.github/skills/code-review.skill.md`
  - Skill files can encapsulate reusable behavior, best practices, or domain-specific helpers.

> Tip: The instruction, prompt, agent, and skill files are placed in dedicated `.github` subfolders, not directly in the root `.github` folder.

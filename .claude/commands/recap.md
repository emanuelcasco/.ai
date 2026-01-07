---
description: Understand the current context of the project by analyzing staged changes, branch diff, and implementation plans
argument-hint: [--files <paths>] [--plan <path>] [--hint <text>]
type: command
---

## Usage

`/recap [--files <paths>] [--plan <path>] [--hint <text>]`

## Variables

- `--files <paths>`: (Optional) Comma-separated list of additional files to read for context.
- `--plan <path>`: (Optional) Path to a specific implementation plan file. If not provided, searches for common plan files.
- `--hint <text>`: (Optional) Additional instructions or context from the user.

## Workflow

1. **Gather Git Context**
   Run the following commands to understand the current git state:
   a. Current branch: !`git branch --show-current`
   b. Git status: !`git status`
   c. Staged changes: !`git diff --staged`
   d. Unstaged changes: !`git diff`
   e. Recent commits on this branch: !`git log --oneline -10`
   f. Untracked files: !`git ls-files --others --exclude-standard`
   g. **Diff against base branch**: Determine the default branch (main or master) by running `git remote show origin | grep 'HEAD branch'`, then run `git diff <default-branch>...HEAD` to see all changes since branching.

2. **Find Implementation Plan** (if `--plan` not specified)
   Search for implementation plans in common locations:

   - `./PLAN.md`
   - `./IMPLEMENTATION_PLAN.md`
   - `./docs/plan.md`
   - `./docs/implementation-plan.md`
   - `./.ai/plan.md`
   - Files matching `*plan*.md` or `*spec*.md` in project root or docs folder

   If `--plan` is specified, read that file directly.

3. **Read Additional Files** (if `--files` specified)
   Read each file path provided in the comma-separated list.

4. **Synthesize Context Report**
   Generate a structured summary including:
   - **Current Branch**: Branch name and its relationship to main
   - **Work Summary**: What changes have been made (based on diff and commits)
   - **Implementation Plan**: If found, summarize the goals and current progress
   - **Staged vs Unstaged**: What's ready to commit vs still in progress
   - **User Hint**: Any additional context provided by the user
   - **Recommendations**: Suggest next steps based on the analysis

## Instructions

- Always start by understanding the git state before analyzing files.
- If no implementation plan is found and `--plan` not specified, note this but continue with git analysis.
- When analyzing diffs, focus on understanding the "why" not just the "what".
- Look for patterns in the changes: new features, bug fixes, refactoring, etc.
- If the branch name follows a pattern (e.g., `feature/BLU-123-description`), extract and note the issue reference.
- Cross-reference changes with the implementation plan to assess progress.
- Be concise but thorough in the summary.

## Output Format

```markdown
# Project Context Summary

## Branch Info

- **Current Branch**: <branch_name>
- **Base Branch**: <main/master>
- **Commits Ahead**: <count>

## Work Summary

<Brief description of what the changes accomplish>

## Implementation Plan

<If found: summary of plan goals and current progress>
<If not found: "No implementation plan detected">

## Changes Overview

### Staged (Ready to Commit)

<Summary of staged changes>

### Unstaged (Work in Progress)

<Summary of unstaged changes>

### Untracked Files

<List of new files not yet tracked>

## Progress Assessment

<How the changes align with the implementation plan, if any>

## Recommended Next Steps

1. <Action item>
2. <Action item>
   ...
```

## Examples

- `/recap`

  - Analyzes current git state and searches for implementation plans automatically.

- `/recap --plan ./docs/feature-plan.md`

  - Analyzes git state and uses the specified plan file for context.

- `/recap --files src/index.ts,README.md --hint "Working on the authentication refactor"`

  - Includes additional files in the analysis and uses the hint for better understanding.

- `/recap --hint "Focus on the API changes"`
  - Uses the hint to prioritize analysis of API-related modifications.

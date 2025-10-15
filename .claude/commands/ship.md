---
allowed-tools: Bash(git checkout --branch:*), Bash(git add:*), Bash(git status:*), Bash(git push:*), Bash(git commit:*), Bash(gh pr create:*), Bash(glab mr view:*), Bash(glab mr list:*), Bash(glab mr update:*)
description: Commit, push, and open a PR/MR
argument-hint: [--share (on slack), --branch <branch-name>, --issue <issue-url>]
type: command
model: claude-4-5-haiku-latest
---

## Usage

`ship [--share] [--branch <branch-name>] [--issue <issue-url>]`

## Variables

- `--share`: Share the merge request in Slack.
- `--branch <branch-name>`: Branch name to use for the merge request. If not specified, the current branch will be used.
- `--issue <issue-url>`: Task manager task to use for the merge request. If not specified, the current branch will be used.

## Workflow

1. Understand the context:
   a. Current git status: !`git status`
   b. Current git diff (staged and unstaged changes): !`git diff HEAD`
   c. Current branch: !`git branch --show-current`

2. (If necessary) Create a new branch based on the current branch and the user specified branch name (wait for success to continue)

3. Create a single commit with an appropriate message (wait for success to continue)

4. Push the branch to origin (wait for success to continue)

5. READ @~/.ai/tasks/create-mr-task.md and @~/.ai/templates/merge-request.tmp.md for instructions, create a pull request.
   a. Use `gh pr create` or `glab mr create` (depending the project).
   b. Wait for success to continue.
   c. Don't use any other tools or sub-agents.

## Instructions

- Never commit nor push from master, if you are already on a branch commit and push from that branch unless specified otherwise.
- Do not use any other tools or do anything else.
- Do not send any other text or messages besides these tool calls.

## Examples

- `/ship --share`
  - Creates a new branch based on the current branch, commits the changes, and creates a merge request. Shares the merge request in Slack.
- `/ship --branch <BRANCH_NAME> --issue <ISSUE_CODE>`
  - Creates a new branch named `<BRANCH_NAME>`, commits the changes, and creates a merge request for the issue `<ISSUE_CODE>`.
- `/ship --issue <ISSUE_CODE>`
  - Creates a new branch based on the current branch and name it `<ISSUE_CODE>`, commits the changes, and creates a merge request for the issue `<ISSUE_CODE>`.
- `/ship --issue <TASK_BRANCH>`
  - Creates a new branch based on the current branch and name it `<TASK_BRANCH>`, commits the changes, and creates a merge request for the issue `<TASK_BRANCH>`.

## Output

```plain
MR: <MR_LINK>
Description: <BRIEF_MR_DESCRIPTION>
Focus: <BRIEF_MR_FOCUS>
^^/CONDITION: has_external_apis^^
Issue: <LINEAR_ISSUE_LINK>
^^/CONDITION^^
```

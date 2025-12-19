---
allowed-tools: Bash(git checkout --branch:*), Bash(git add:*), Bash(git status:*), Bash(git push:*), Bash(git commit:*), Bash(gh pr create:*), Bash(glab mr view:*), Bash(glab mr list:*), Bash(glab mr update:*)
description: Commit, push, and open a PR/MR
argument-hint: [--share] [--branch <name>] [--target <name>] [--commit-message <text>] [--mr-title <text>] [--mr-description <text>] [--issue <url>] [--hint <text>] [--model <name>]
type: command
model: claude-haiku-4-5
---

## Usage

`ship [--share] [--branch <name>] [--target <name>] [--commit-message <text>] [--mr-title <text>] [--mr-description <text>] [--issue <url>] [--hint <text>] [--model <name>]`

## Variables

- `--share`: (Optional) Share the PR/MR in Slack after creation.
- `--branch <name>`: (Optional) Branch name to use. Defaults to current branch.
- `--target <name>`: (Optional) Target branch for the PR/MR. Defaults to remote default branch.
- `--commit-message <text>`: (Optional) Commit message to use. If not provided, AI generates it.
- `--mr-title <text>`: (Optional) Pull/Merge request title. If not provided, AI generates it.
- `--mr-description <text>`: (Optional) Pull/Merge request description. If not provided, AI generates it.
- `--issue <url>`: (Optional) Linear issue link to reference in commit and PR/MR.
- `--hint <text>`: (Optional) Hint passed to the AI assistant for commit and MR preparation.
- `--model <name>`: (Optional) AI provider to use (default: claude). Supported: claude, gemini, codex.

## Workflow

1. Understand the context:
   a. Current git status: !`git status`
   b. Current git diff (staged and unstaged changes): !`git diff HEAD`
   c. Current branch: !`git branch --show-current`

2. (If `--branch` specified and different from current) Create or checkout the branch

3. Stage all changes with `git add -A`

4. Generate commit message and MR details using AI (unless overridden via flags)

5. Create commit with message following format: `<type>(<scope>): <description>`
   - Commit body includes detailed explanation and `Refs: <issue>` when issue is provided

6. Push branch to origin with `-u` flag

7. Create PR/MR with structured description:
   - Summary section
   - Related Issues section (if issue provided)
   - Changes section (bullet points)
   - Additional Notes section (if applicable)
   - Evidences section (if applicable)
   - Checklist (code guidelines, documentation, tests)

8. (If `--share` specified) Share the PR/MR to Slack

## Instructions

- Never commit nor push from master/main unless explicitly specified.
- If no staged changes detected, abort with error.
- If no remote 'origin' configured, create commit locally and skip push/PR creation.
- Commit message types: feat, fix, docs, style, refactor, perf, test, chore.

## Examples

- `/ship --share`
  - Commits staged changes, pushes, creates PR/MR with AI-generated messages, shares to Slack.
- `/ship --branch my-branch --issue https://linear.app/team/issue/BLU-2218`
  - Checks out `my-branch`, commits, pushes, creates PR/MR referencing the Linear issue.
- `/ship --hint "Focus on the new validation logic"`
  - Uses the hint to guide AI in generating more relevant commit/PR messages.
- `/ship --commit-message "fix: resolve auth timeout" --mr-title "fix: BLU-123 auth timeout"`
  - Uses provided commit message and MR title instead of AI generation.

## Output

```plain
MR: <MR_LINK>
Title: <MR_TITLE>
```

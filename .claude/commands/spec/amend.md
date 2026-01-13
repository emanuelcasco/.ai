---
description: Amend implementation plan with actual code changes, replacing planned content with reality.
argument-hint: [plan_file] [--base <branch>] [--hint <text>]
type: command
model: claude-sonnet-4-5
mode: think
---

## Usage

`/spec:amend $PLAN_FILE [--base <branch>] [--hint <text>]`

## Variables

- `$PLAN_FILE`: Path to implementation plan to amend (required).
- `--base <branch>`: Base branch for diff comparison (optional, defaults to main/master).
- `--hint <text>`: Additional context about why changes were made (optional).

## Purpose

When implementation diverges from the original plan (bug fixes, improvements, different approaches discovered during development), this command updates the plan to document what was **actually implemented**—not what was originally designed. The spec becomes the source of truth for the actual changes made.

## Workflow

### 1. Gather Context

Run these commands in parallel to understand the current state:

a. Read the implementation plan from `$PLAN_FILE`
b. Detect base branch: !`git remote show origin | grep 'HEAD branch'` (use `--base` if provided)
c. Get actual diff against base: !`git diff <base>...HEAD`
d. List changed files: !`git diff --name-only <base>...HEAD`
e. Get commit history on branch: !`git log <base>..HEAD --oneline`

### 2. Analyze Divergence

Compare planned changes vs actual changes:

- **Map planned file changes** → actual file changes from git diff
- **Classify each planned step**:
  - **Completed as planned**: Actual diff matches (or closely matches) planned diff
  - **Modified**: File was changed but differently than planned
  - **Skipped**: Planned change was not made
- **Identify unplanned changes**: Files changed that weren't in the original plan

### 3. Generate Updated Plan

Create the new plan content by updating each section:

**Mid-Level Objectives:**

- Update checkboxes (`- [x]`) based on actual completion
- Adjust objective descriptions if scope changed

**Phases:**

- Keep overall structure where possible
- Replace step content with actual implementation details
- Add new phases/steps for unplanned work (mark as `[ADDED]`)
- Remove or consolidate skipped steps

**Steps:** For each step:

- Mark as completed: `- [x]`
- **Replace** planned diff with actual diff from `git diff`
- Update action description to match what was actually done
- Use correct action verbs: ADD, MODIFY, DELETE, RENAME, MOVE, COPY

**Success Criteria:**

- Update based on actual outcomes achieved

**History Section:**

- Add new section documenting original approach and what changed (see format below)

### 4. Preview Changes

Present a summary to the user **before** making any changes:

```markdown
## Amend Preview: {{plan_name}}

**Branch**: {{branch}} vs {{base}}
**Plan File**: {{plan_file}}

### Changes Summary

| Category             | Count |
| -------------------- | ----- |
| Completed as planned | X     |
| Modified from plan   | X     |
| Added (unplanned)    | X     |
| Skipped              | X     |

### Significant Modifications

{{For each major deviation, briefly explain:}}

- **Phase X, Step Y**: Changed from {{original}} to {{actual}} because {{reason}}
- ...

### Files Affected

**In Plan → Actual:**
{{list of planned files and their status}}

**Unplanned Changes:**
{{list of files changed that weren't in original plan}}
```

Then use `AskUserQuestion` to confirm:

- **"Apply changes"** → Proceed to update the file
- **"Cancel"** → Abort, no changes made
- **"Show full preview"** → Display complete updated plan before deciding

### 5. Apply Changes

Once user approves:

- Write updated plan content to `$PLAN_FILE` (in place)
- Output confirmation message

## History Section Format

Add this section at the **end** of the amended plan (before Notes if present):

```markdown
## History

### Amended: {{date}}

**Original Approach:**
{{Brief summary of what was originally planned - key decisions, architecture choices}}

**What Changed:**

- {{Step/Phase}}: {{original}} → {{actual}}
- {{Step/Phase}}: Added {{description}} (unplanned)
- {{Step/Phase}}: Skipped {{reason}}
- ...

**Rationale:**
{{Explanation of why the approach changed - use --hint if provided, otherwise infer from diffs and commits}}
```

If multiple amends occur, **prepend** new entries (most recent first), keeping older history below.

## Instructions

- **Replace, don't annotate**: The spec documents reality. Outdated diffs are replaced, not commented.
- **Preserve structure**: Keep the original plan's organization where possible.
- **Be specific**: When describing changes, reference exact files and line changes.
- **Infer rationale**: If `--hint` not provided, analyze commit messages and diff patterns to explain why changes were made.
- **Respect existing history**: If a History section already exists, add new entry at top, don't replace.

## Output Format

After successful amend:

```markdown
# Amend Complete

**Plan**: {{plan_file}}
**Amended at**: {{date}}

## Summary

- {{X}} steps updated with actual implementation
- {{Y}} unplanned changes documented
- {{Z}} planned steps skipped

History section added documenting original approach.
```

## Examples

```bash
# Basic amend - compare against default branch
/spec:amend /specs/20250113_user_auth.md

# Amend against specific base branch
/spec:amend /specs/feature_spec.md --base develop

# Amend with context about why implementation changed
/spec:amend /specs/payment_flow.md --hint "Switched to Stripe SDK after discovering PayPal rate limits during integration testing"

# Amend a spec in docs folder
/spec:amend ./docs/specs/20250110_api_refactor.md --base main
```

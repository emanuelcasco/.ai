# User-Defined Preferred Patterns and Preferences

> Use these set of rules for personal preferences.

## Dev Workflow

### Linter

You don't need to run the linter for all files, only for the files that you are working on. Use the following command:

```bash
 # Run linter for all files that are staged
git diff -z --name-only HEAD \
  | grep -zE '\.(js|ts)$' \
  | xargs -0 pnpm exec eslint --fix 
```

## Git workflows and conventions

**CRITICAL: When you need to push code, create merge request, etc, always use GitLab.**

We use GitLab as our code repository tool, when we mention we need to push our code, create merge request, etc we are always talking about GitLab.

### Conventions

**Commit message format**

Use Conventional Commits format for commit messages. For example:

- feat(tt): add new endpoint
- fix(ws): fix bug in endpoint
- docs(dg): add documentation for endpoint
- style(ws): style changes in endpoint
- refactor(ws): refactor code in endpoint
- test(ws): add tests for endpoint
- chore(ws): update dependencies for endpoint

**Branch name format**

Examples: JIR-1234-my-feature, JIR-1234-my-feature-2, JIR-1234-my-feature-3

**Merge request title format**

Examples: [JIR-1234] feat: my feature, [JIR-1234] fix: my fix, [JIR-1234] docs: my docs

**Slack messages**

Please when charing a merge request, always use the following example as reference:

- CRITICAL! Always send messages to the channel: `#tech-code-reviews` unless otherwise is specified.

Example: 

```bash
sms "tech-code-reviews" "[ID] <conventional commit>,

Link: <MR>

This is a description of the feature explaining what it does and why it is needed.

Thank you!"
```


### CLI

Use `glab` to make changes on gitlab.

To create a merge request, use the following command:

```bash
glab mr create --title "My new feature" --description "This is a new feature" --source-branch main --target-branch main
```

To update a merge request, use the following command:

```bash
# Update title
glab mr update <mr_id> --title "My new feature"

# Update description
glab mr update <mr_id> --description "This is a new feature"

# Update source branch
glab mr update <mr_id> --source-branch main

# Update target branch
glab mr update <mr_id> --target-branch main

# Update assignee
glab mr update <mr_id> --assignee <user_id>
```

To get the list of merge requests, use the following command:

```bash
glab mr list
```

To view a merge request, use the following command:

```bash
glab mr view <mr_id>
```

## General good practices

- Avoid `switch` statements, or `if-else` statements with 3 or more conditions. Use a mapping or dictionary instead.

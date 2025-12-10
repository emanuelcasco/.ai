---
description: Execute a task previously defined in the @~/.ai/tasks directory
argument-hint: [task_id] [instruction]
type: command
---

## Usage

`/task {TASK} {INSTRUCTION?}`

## Variables

- {TASK}: The task to execute (available tasks are listed on the dir @~/.ai/tasks). Provide auto-complete.
- {INSTRUCTION}: The instruction to execute (optional).

## Workflow

1. Search for @~/.ai/tasks/{TASK}-task.md where {TASK} is indicating the name of the task to adopt.
2. Follow instructions presented in the task document, and proceed until you complete the task.

## Instructions

CRITICAL: Read the full task document, follow instructions, and proceed until you complete the task.

- Avoid to `List` all available tasks, if the user provides the Task identifier simply use it, for example:
- if the user does `/task create-mr` then use the `create-mr-task.md` file
  - `TASK` should be `create-mr`
  - `INSTRUCTION` should be empty
- if the user does `/task refine some instruction` then use the `refine-task.md` file
  - `TASK` should be `refine`
  - `INSTRUCTION` should be `some instruction`
- if the user asks for a task that does not exist, then lookup for the closest match or return a list of the available tasks in the directory.

## Examples

At user-level:

```plain
/task estimate-task                      # or /task estimate-task
/task execute-implementation-plan        # or /task execute-implementation-plan
/task refine                             # or /task refine
```

At project-level:

```plain
/project:task create-merge-request        # or /task create-merge-request
/project:task refine                      # or /task refine
/project:task create-implementation-plan  # or /task create-implementation-plan
```

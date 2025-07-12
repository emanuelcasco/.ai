# /run Command

The `/run` command is used to run automated workflows.

## Commands

### `run $WORKFLOW $ARGUMENT?`

Runs a specific workflow to execute a set of instructions. Searches for @.ai/workflows/<workflow>.yml where <workflow> is $WORKFLOW indicating the name of the workflow to run.

Avoid to `List` all available workflows, if the user provides the Workflow identifier simply use it, for example:

File to read: @.ai/workflows/<workflow>.yml, where <workflow> is $WORKFLOW indicating the name of the workflow to run. For example:

- `/user:run document` must read `@.ai/workflows/document.yml`
- `/run implement-task` must read `@.ai/workflows/implement-task.yml`

**What it does:**

- Searches for @.ai/workflows/<workflow>.yml
- Loads the workflow configuration
- Activates the workflow according to its startup instructions
- Maintains the workflow state until explicitly told to exit
- If no workflow is provided simply lists all available workflows in the `.ai/workflows` directory (use `ls` to list the files in the directory).

**Examples:**

At user-level:

```plain
/user:run document        # or /run document
/user:run implement-task  # or /run implement-task
/user:run implement-task some extra argument  # or /run implement-task some extra argument
```

At project-level:

```plain
/project:run document
/project:run implement-task
```
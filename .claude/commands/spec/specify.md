---
description: Create initial specification with objectives only, setting up feedback blocks for detailed planning phase.
argument-hint: [task_description]
type: command
---

## Usage

`/spec:specify $TASK_DESCRIPTION?`

## Variables

- $TASK_DESCRIPTION: Brief description of the task or feature to specify (optional).

## Workflow

1. Use existing `@~/.ai/tasks/create-implementation-plan-task.md` in **Specify Mode**
2. CREATE implementation plan document with only foundational sections:
   - High-Level Objective
   - Mid-Level Objectives
   - Context
   - Success Criteria
3. LEAVE Implementation Notes section empty with feedback blocks in OPEN status
4. SAVE in `/specs` folder with timestamp naming convention

## Instructions

- Fill only objective sections, skip Implementation Notes
- Leave feedback blocks as OPEN for detailed planning phase
- Creates partial implementation plan for ideation
- Use timestamp naming: `yyyymmddhhmmdd_{{name_in_snake_case}}.md`

## Examples

```plain
/spec:specify Add user authentication with JWT tokens
/spec:specify Create user dashboard with analytics
/spec:specify Implement payment processing workflow
```

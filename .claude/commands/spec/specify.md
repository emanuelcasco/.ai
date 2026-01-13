---
description: Create initial specification with objectives only, setting up feedback blocks for detailed planning phase.
argument-hint: [task_description]
type: command
model: claude-opus-4-5
mode: ultrathink
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
5. SURFACE key questions from OPEN feedback blocks:
   - Classify: user-decision vs AI-resolvable
   - Use AskUserQuestion for user-decision questions (focus on goal clarity, requirements)
   - Answer AI-resolvable questions directly and mark ADDRESSED
   - Accept partial answers

## Instructions

- Fill only objective sections, skip Implementation Notes
- Leave feedback blocks as OPEN for detailed planning phase
- Creates partial implementation plan for ideation
- Use timestamp naming: `yyyymmddhhmmdd_{{name_in_snake_case}}.md`

**Feedback Resolution Guidelines:**

After creating the specification with OPEN feedback blocks, process ALL questions:

- For each OPEN feedback block, classify questions:
  - **User questions**: Require user decision (goal clarity, requirements, constraints, preferences) → use AskUserQuestion
  - **AI-resolvable**: Technical/factual questions answerable from context → answer directly and mark ADDRESSED
- Group user questions by topic area (2-4 per AskUserQuestion round)
- Focus on: main goal clarity, key requirements, known constraints
- Mark ADDRESSED once resolved; keep truly unanswerable questions OPEN for /spec:clarify
- No OPEN block should remain silently unaddressed

## Examples

```plain
/spec:specify Add user authentication with JWT tokens
/spec:specify Create user dashboard with analytics
/spec:specify Implement payment processing workflow
```

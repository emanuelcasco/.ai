---
title: Create Implementation Plan for Story
type: task
mode: ultrathink
templates:
  - @~/.ai/templates/implementation-plan.tmp.md
---

## Purpose

Generate a document containing an implementation plan for a provided story or task (it could be created locally or provided from a issue manager).

## Workflow

### 0. Generate a new implementation plan document

Create a new file using the @~/.ai/templates/implementation-plan.tmp.md template. Follow these rules:

- Name convention: `yyyymmddhhmmdd_{{name_in_snake_case}}.md`.
- Keep the name under 50 characters (summarize it if necessary).
- Create the file in the folder `/spec` of the project or domain you are working on, if not sure ask the user for details.

### 1. Identify Main Goal

- What are we implementing? Why are we doing this?
- Try to explain the goal of the story in a few sentences.

### 2. Identify Secondary Goals

- Try to split the task into smaller tasks, max 5 or 6 milestones, that once completed will achieve the main goal.
- Try to explain the secondary goals in one sentence max.

### 3. Prepate Plan by Steps

- Use the milestones defined in the Secondary Goals to create a plan by **Phases**.
- For each **Phase** must try to complete a single task, a minor change that accomplish a single little goal (like updating the interfaces for your new changes, or implementing the persitance layer for a feature).
- The idea is that each **Phase** is a self-contained iteration that does not put the system in a broken state.
- Split each phase into "Steps" that are the actual phase to be completed.
- Each phase behaves like a instruction you will provide to a pair-programming partner to instruct him what to do. Use a meta-programming language like:
  ````plain
  - Step {{n}}: {{step_name}}
    - ADD | MODIFY | DELETE | RENAME | MOVE | COPY | OTHER {{file}} action description:
      [[LLM: if necessary add code snippet]]
      ```typescript
      // your code snippet
      ```
  ````
- The most details you include in the plan the better, you focus on WHAT you want the person implementing the change to do, not HOW.

### 4. Content Generation

- **Incremental Mode**: Present each major section for review before proceeding
- **YOLO Mode**: Generate all sections, then review complete document with user
- Apply any elicitation protocols specified in template
- Incorporate user feedback and iterate as needed

### 6. Validation

If template specifies a checklist:

- Run the appropriate checklist against completed document
- Document completion status for each item
- Address any deficiencies found
- Present validation summary to user

### 7. Final Presentation

- Present clean, formatted content only
- Ensure all sections are complete
- DO NOT truncate or summarize content
- Begin directly with document content (no preamble)
- Include any handoff prompts specified in template

## Instructions

- Template markup is for AI processing only - never expose to users

## Success Criteria

- [ ] **Main Goal**: Clear 2-3 sentence explanation of what and why
- [ ] **Secondary Goals**: 5-6 milestones with single-sentence descriptions
- [ ] **Context**: Sufficient background for understanding implementation
- [ ] **Phases**: Each secondary goal maps to self-contained, non-breaking phase
- [ ] **Steps**: Use action verbs (ADD/MODIFY/DELETE), specify target files, include code snippets where helpful
- [ ] **WHAT not HOW**: Steps describe what to implement, not implementation details
- [ ] **Template Format**: Follows implementation-plan.tmp.md structure with proper markdown
- [ ] **Clean Output**: No [[LLM:]] markup, no preamble, complete content, date stamped
- [ ] **Success Criteria**: Clear, measurable completion outcomes defined
- [ ] **Pair Programming Ready**: Instructions clear enough for development partner

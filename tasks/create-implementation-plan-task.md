---
title: Create Implementation Plan for Story
type: task
mode: ultrathink
templates:
  - @~/.ai/templates/implementation-plan.tmp.md
---

## Purpose

Generate implementation plans for stories/tasks using structured phases that preserve system stability.

## Workflow

### 0. Create Plan Document

Create file using @~/.ai/templates/implementation-plan.tmp.md:

- **Naming**: `yyyymmddhhmmdd_{{name_in_snake_case}}.md` (≤50 chars)
- **Location**: `/spec` folder in project/domain (ask user if uncertain)

### 1. Define Main Goal

- Identify implementation target and purpose
- Explain goal in 2-3 sentences

### 2. Define Secondary Goals

- Split into not more than 5-6 milestones achieving main goal
- Single sentence per milestone

### 3. Create Phase Plan

- Map milestones to self-contained **Phases**
- Each phase completes single task without breaking system
- Break phases into actionable **Steps** using meta-programming syntax:

```plain
- [ ] Step {{n}}: {{step_name}}
  - ADD | MODIFY | DELETE | RENAME | MOVE | COPY | OTHER {{file}} action description:
    ```diff
    // git diff block
    ```
```

### 4. Content Generation

- **Incremental Mode**: Present sections for review before proceeding
- **YOLO Mode**: Generate complete document, then review
- Apply template elicitation protocols
- Incorporate user feedback iteratively

### 5. Validation

Run template checklist against completed document:
- Document completion status per item
- Address deficiencies
- Present validation summary

### 6. Final Presentation

- Present clean, formatted content only
- Complete sections without truncation
- Begin with document content (no preamble)
- Include template handoff prompts

## Instructions

- Template markup for AI processing only—never expose to users

## Success Criteria

- [ ] **Main Goal**: Clear 2-3 sentence what/why explanation
- [ ] **Secondary Goals**: 5-6 single-sentence milestones
- [ ] **Context**: Sufficient implementation background
- [ ] **Phases**: Each goal maps to self-contained, non-breaking phase
- [ ] **Steps**: Action verbs (ADD/MODIFY/DELETE), target files, code snippets
- [ ] **WHAT not HOW**: Describe implementation targets, not methods
- [ ] **Template Format**: Follows implementation-plan.tmp.md structure
- [ ] **Clean Output**: No [[LLM:]] markup, no preamble, complete content, timestamped
- [ ] **Success Criteria**: Clear, measurable completion outcomes
- [ ] **Pair Programming Ready**: Clear instructions for development partner
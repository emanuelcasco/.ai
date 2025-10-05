---
title: Create Implementation Plan for Story
type: task
mode: ultrathink
templates:
  - @~/.ai/templates/implementation-plan.tmp.md
---

## Purpose

Generate implementation plans for stories/tasks using structured phases that preserve system stability. Supports phased completion for iterative refinement through feedback blocks.

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

````plain
- [ ] Step {{n}}: {{step_name}}
  - ADD | MODIFY | DELETE | RENAME | MOVE | COPY | OTHER {{file}} action description:
    ```diff
    // git diff block
    ```
````

### 4. Content Generation Modes

**Mode Selection:**

- Full Mode (default): Generate complete document in single pass.
- Specify Mode: Fill only High-Level Objective, Mid-Level Objectives, Context, and Success Criteria sections. Leave Implementation Notes empty with feedback blocks as OPEN for detailed planning phase.
- Plan Mode: Complete all sections including Implementation Notes with phases and steps. Process any OPEN feedback blocks and mark as ADDRESSED.

### 5. Validation

Run template checklist against completed document:

- Document completion status per item
- Address deficiencies
- Present validation summary

### 6. Feedback Block Processing

Feedback Block Syntax:

```
<!-- FEEDBACK: section_name
[Feedback content, questions, or concerns]
Status: [OPEN|ADDRESSED|RESOLVED]
-->
```

Status Definitions:

- OPEN: New feedback requiring attention
- ADDRESSED: Response provided, awaiting confirmation
- RESOLVED: Feedback incorporated and closed

Processing Guidelines:

- When specifying: Fill only objective sections, leave feedback blocks as OPEN for detailed planning
- Plan Mode: Process OPEN feedback blocks, fill implementation details, mark as ADDRESSED
- Review Mode: Add new feedback blocks, update existing ones, mark RESOLVED when incorporated
- Remove RESOLVED feedback blocks from final document unless requested to keep them

For Plan Mode:

- Identify OPEN feedback blocks in existing document
- Address each feedback item systematically
- Update feedback status to ADDRESSED with responses
- Incorporate feedback into relevant sections

For Review Mode:

- Add new feedback blocks based on review findings
- Update existing feedback blocks with new insights
- Mark incorporated feedback as RESOLVED
- Remove RESOLVED blocks unless user requests retention

### 7. Final Presentation

- Present clean, formatted content only
- Complete sections without truncation (unless Specify Mode)
- Begin with document content (no preamble)
- Include template handoff prompts
- Maintain feedback blocks with appropriate status

## Instructions

- Template markup for AI processing only—never expose to users

## Success Criteria

- [ ] **Main Goal**: Clear 2-3 sentence what/why explanation
- [ ] **Secondary Goals**: 5-6 single-sentence milestones
- [ ] **Context**: Sufficient implementation background
- [ ] **Phases**: Each goal maps to self-contained, non-breaking phase (Plan Mode only)
- [ ] **Steps**: Action verbs (ADD/MODIFY/DELETE), target files, code snippets (Plan Mode only)
- [ ] **WHAT not HOW**: Describe implementation targets, not methods
- [ ] **Template Format**: Follows implementation-plan.tmp.md structure
- [ ] **Clean Output**: No [[LLM:]] markup, no preamble, complete content, timestamped
- [ ] **Success Criteria**: Clear, measurable completion outcomes
- [ ] **Pair Programming Ready**: Clear instructions for development partner
- [ ] **Feedback Blocks**: Properly formatted with correct status (OPEN/ADDRESSED/RESOLVED)
- [ ] **Mode Compliance**: Specify Mode stops before Implementation Notes, Plan Mode completes all sections

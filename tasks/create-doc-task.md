---
title: Create Task Document
type: task
mode: ultrathink
templates:
  - @~/.ai/templates/task.tmp.md
---

# Create Task Document

## Purpose

Produce a standardized task definition using the task template so automation agents can execute consistent workflows with clear expectations.

## Workflow

### 0. Collect Inputs

- Confirm the task objective and expected outputs with the requester.
- Gather reference workflows, templates, or domain standards that inform execution.
- Identify the target storage path in `~/.ai/tasks` unless otherwise directed.

### 1. Instantiate Template

- Create a new markdown file using @~/.ai/templates/task.tmp.md.
- Name the file in kebab-case matching the task intent (e.g., `create-example-task.md`).
- Populate front matter placeholders with concrete metadata (title, mode, template references).

### 2. Document Purpose

- Summarize why the task exists in two to three sentences focused on the outcome.
- Capture prerequisites or dependencies the executor must satisfy before starting.

### 3. Detail Workflow

- Break the execution into ordered stages using the template's repeated step block.
- Keep each stage focused on a single outcome; add sub-bullets for critical checks or artifacts.
- Highlight decision points, required inputs, and expected deliverables for each stage.

### 4. Add Supporting Instructions

- List global constraints (tooling, communication cadence, approvals) that apply throughout.
- Reference template conventions—never expose `[[LLM:]]`, `<<REPEAT>>`, or other markup to users.
- Include conditional guidance with `^^CONDITION^^` blocks when rules apply only in certain contexts.

### 5. Define Success Criteria

- Translate completion requirements into measurable checkboxes.
- Ensure criteria cover purpose clarity, workflow completeness, quality gates, and output format.

### 6. Review and Finalize

- Proofread for typos, unresolved placeholders, and markup leaks.
- Verify references (paths, templates, tooling) exist and remain accurate.
- Save to the tasks directory and stage or share per workflow expectations.

## Instructions

- Preserve template markup for AI processing; present clean content when sharing with humans.
- Replace every placeholder with real context—never leave braces or example text unresolved.
- Pause and request clarification if requirements are ambiguous before drafting.

## Success Criteria

- [ ] File created in `~/.ai/tasks` with a descriptive kebab-case filename.
- [ ] Front matter accurately reflects task metadata and references.
- [ ] Purpose communicates the task's outcome and context.
- [ ] Workflow steps cover end-to-end execution with actionable guidance.
- [ ] Instructions section lists global constraints and caveats.
- [ ] Success criteria connect directly to workflow outputs and quality gates.
- [ ] Document free of unresolved placeholders, markup leaks, and grammatical errors.

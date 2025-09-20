---
title: Execute Implementation Plan Task
type: task
---

## Purpose

Validates documentation against checklists through systematic workflow. Agent MUST follow instructions for thorough document validation.

## Workflow

### 1. Initial Assessment

- **With checklist name provided:**
  - Apply fuzzy matching (e.g., "architecture checklist" → "architect-checklist")
  - Request clarification for multiple matches
  - Load appropriate checklist from bmad-core/checklists/
- **Without checklist specified:**
  - Present available options from checklists folder
  - Request user selection
- **Confirm processing mode:**
  - Section-by-section (interactive - time-intensive)
  - All-at-once (YOLO - recommended, includes final section summary)

### 2. Document Gathering

- Follow checklist-specified required documents/artifacts
- Resolve files in docs folder; halt and confirm if uncertain

### 3. Checklist Processing

**Interactive mode:**
- Process each section sequentially
- Review all section items per embedded instructions
- Check items against relevant documentation/artifacts
- Present section findings highlighting warnings, errors, non-applicable items (with rationale)
- Obtain user confirmation before proceeding; halt for major issues requiring corrective action

**YOLO mode:**
- Process all sections simultaneously
- Generate comprehensive findings report
- Present complete analysis

### 4. Validation Approach

Per checklist item:
- Understand requirement
- Seek evidence satisfying requirement in documentation
- Consider explicit mentions and implicit coverage
- Follow all checklist LLM instructions
- Mark items resolved

### 5. Section Analysis

Per section:
- Identify themes in failed items
- Provide specific improvement recommendations
- Discuss findings with user (interactive mode)
- Document user decisions/explanations

## Final Report

Summary includes:
- Overall completion status
- Specific improvement recommendations
- Non-applicable sections/items with justification

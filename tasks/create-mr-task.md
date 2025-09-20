---
title: Create Merge Request Task
type: task
mode: think
templates:
  - @~/.ai/templates/merge-request.tmp.md
---

## Purpose

Generate comprehensive merge request descriptions for code changes following standardized format conventions. This task ensures MRs are clear, reviewer-friendly, and follow project standards with proper technical documentation.

## Workflow

### 1. Identify Context and Changes

- Analyze current git changes against target branch
- Determine scope of modifications (API, database, implementation, tests)
- Gather necessary context about affected systems and dependencies
- Understand integration points and potential impact areas

### 2. Execute Template Processing

- Load merge-request template from `@~/.ai/templates/` directory
- Follow ALL embedded LLM instructions within the template
- Process template markup according to template-format conventions

### 3. Template Processing Rules

#### CRITICAL: Never display template markup, LLM instructions, or examples to users

- Replace all {{placeholders}} with actual content from git analysis
- Execute all [[LLM: instructions]] internally
- Process conditional blocks for applicable sections only
- Use @{examples} for guidance but never output them

- **Incremental Mode**: Present each major section for review before proceeding
- **YOLO Mode**: Generate all sections, then review complete document with user
- Apply git change analysis to populate template sections
- Focus on technical accuracy and reviewer clarity

### 4. Validation

If template specifies validation requirements:

- Verify all endpoints are documented with proper HTTP methods
- Ensure database changes include migration considerations
- Confirm testing strategy covers new functionality
- Address any missing technical details

### 5. Final Presentation

- Present clean, formatted MR description only
- Ensure all sections are complete and accurate
- DO NOT truncate or summarize technical details
- Begin directly with MR content (no preamble)
- Include any handoff notes for reviewers

## Instructions

- Template markup is for AI processing only - never expose to users
- Focus on technical accuracy and change impact analysis
- Ensure MR descriptions are reviewer-friendly and comprehensive
- Always analyze actual git changes to populate template content
- Follow project-specific conventions for formatting and structure

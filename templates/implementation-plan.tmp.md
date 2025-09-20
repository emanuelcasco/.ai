---
title: Implementation Plan
type: template
---

# Implementation Plan: {{change_name}}

Last Updated: {{date}}

## High-Level Objective

[[LLM: Describe briefly the story and the context of the story.]]

## Mid-Level Objectives

[[LLM: List the requirements of the story in a checklist.]]

## Context

[[LLM: Explain the necessary context for the LLM to understand the implementation plan.]]

## Implementation Notes

<<REPEAT: pattern>>

### Phase {{m}}: {{phase_name}}

[[LLM: List the steps to implement the story.]]

<<REPEAT: pattern>>

- [] Step {{m.n}}: {{step_name}}
  - ADD | MODIFY | DELETE | RENAME | MOVE | COPY | OTHER {{file}} action description:
    (if necessary add code snipper)
<</REPEAT>>
<</REPEAT>>

## Success Criteria

[[LLM: List the success criteria for the story.]]

## Notes

Additional notes and considerations.

---
title: Implementation Plan
type: template
---

# Implementation Plan: {{change_name}}

Last Updated: {{date}}

## High-Level Objective

[[LLM: Describe briefly the story and the context of the story.]]

<!-- FEEDBACK: high_level_objective
Questions or feedback about the main goal and context.
Status: OPEN
-->

## Mid-Level Objectives

[[LLM: List the requirements of the story in a checklist.]]

<!-- FEEDBACK: mid_level_objectives
Questions or feedback about the requirements and milestones.
Status: OPEN
-->

## Context

[[LLM: Explain the necessary context for the LLM to understand the implementation plan.]]

<!-- FEEDBACK: context
Questions or feedback about the technical context and background.
Status: OPEN
-->

## Implementation Notes

<!-- FEEDBACK: implementation_approach
Questions or feedback about the overall implementation approach before diving into phases.
Status: OPEN
-->

<<REPEAT: pattern>>

### Phase {{m}}: {{phase_name}}

[[LLM: List the steps to implement the story.]]

<!-- FEEDBACK: phase_{{m}}
Questions or feedback about this specific phase.
Status: OPEN
-->

<<REPEAT: pattern>>

- [ ] Step {{m.n}}: {{step_name}}
  - ADD | MODIFY | DELETE | RENAME | MOVE | COPY | OTHER {{file}} action description:
    `diff
// git diff block if necessary
`
    <</REPEAT>>
    <</REPEAT>>

## Success Criteria

[[LLM: List the success criteria for the story.]]

<!-- FEEDBACK: success_criteria
Questions or feedback about the completion criteria and validation approach.
Status: OPEN
-->

## Notes

Additional notes and considerations.

<!-- FEEDBACK: general
General questions, concerns, or suggestions for the entire implementation plan.
Status: OPEN
-->

---
title: Task
type: template
---

---
title: {{Task Title}}
type: task
mode: {{Execution Mode}}
templates:
  - {{Primary Template Reference}}
[[LLM: Duplicate the templates line for any additional template references and remove this instruction afterward.]]
---

# {{Task Heading}}

## Purpose

{{Concise explanation of why this task exists and the outcome it produces.}}

## Workflow

<<REPEAT: workflow_step>>
### {{Step Number}}. {{Step Title}}

- {{Primary action or deliverable for this stage.}}
- {{Key considerations, decision points, or handoff notes.}}
[[LLM: Ensure numbering is sequential and duplicate this block for each step.]]
<</REPEAT>>

## Instructions

<<REPEAT: global_instruction>>
- {{Global constraint, tooling requirement, or communication protocol.}}
<</REPEAT>>

## Success Criteria

<<REPEAT: success_check>>
- [ ] {{Measurable outcome that confirms the task is complete.}}
<</REPEAT>>

^^CONDITION: additional_notes_required^^
## Additional Notes

{{Supplemental context, references, or caveats.}}
^^/CONDITION^^

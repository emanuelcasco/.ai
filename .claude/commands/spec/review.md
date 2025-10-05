---
description: Systematic review and iteration of implementation plans through structured feedback processing.
argument-hint: [plan_file] [extra_instructions?]
type: command
---

## Usage

`/spec:review $PLAN_FILE $EXTRA_INSTRUCTIONS?`

## Variables

- $PLAN_FILE: Path to existing implementation plan to review (required).
- $EXTRA_INSTRUCTIONS: Specific areas to focus on or questions to address (optional).

## Workflow

1. READ documents in parallel:
   1.1. Use existing `@~/.ai/tasks/create-implementation-plan-task.md` in **Review Mode**
   1.2. READ existing implementation plan from $PLAN_FILE
2. CONDUCT systematic review of all plan sections
3. PROCESS existing feedback blocks and add responses
4. ADD new feedback blocks for unresolved issues or concerns
5. UPDATE plan content based on review findings
6. MARK incorporated feedback as RESOLVED

## Instructions

**Review Focus Areas:**

- Architecture decisions and justifications
- Phase breakdown and self-containment
- Step clarity and actionability
- Risk assessment and mitigation
- Traceability to original objectives

**Processing Guidelines:**

- Add new feedback blocks based on review findings
- Update existing feedback blocks with new insights
- Mark incorporated feedback as RESOLVED
- Remove RESOLVED blocks unless user requests retention

## Examples

```plain
/spec:review /path/to/spec/20241128120000_user_auth.md
/spec:review /path/to/spec/feature_spec.md "Focus on security considerations"
/spec:review /path/to/spec/checkout_flow.md "Validate database migration steps"
```

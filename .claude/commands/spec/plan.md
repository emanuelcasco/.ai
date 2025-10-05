---
description: Complete implementation plan with detailed phases and steps, processing feedback blocks from specification phase.
argument-hint: [plan_file] [extra_instructions?]
type: command
---

## Usage

`/spec:plan $PLAN_FILE? $EXTRA_INSTRUCTIONS?`

## Variables

- $PLAN_FILE: Path to existing implementation plan to complete (optional).
- $EXTRA_INSTRUCTIONS: Additional context or requirements (optional).

## Workflow

1. Use existing `@~/.ai/tasks/create-implementation-plan-task.md` in **Plan Mode**
2. **If $PLAN_FILE provided**:
   - READ existing specification document
   - PROCESS OPEN feedback blocks
   - ADD Implementation Notes with detailed phases and steps
3. **If no file provided**:
   - CREATE complete implementation plan from scratch
4. MARK feedback blocks as ADDRESSED
5. MAINTAIN traceability to original objectives

## Instructions

- Process OPEN feedback blocks and mark as ADDRESSED
- Add detailed implementation phases with self-contained units
- Define specific steps with file-level actions (ADD/MODIFY/DELETE)
- Include git diff code snippets where helpful
- Each phase must be non-breaking and self-contained

## Examples

```plain
/spec:plan /path/to/spec/20241128120000_user_auth.md
/spec:plan /path/to/spec/feature_spec.md "Focus on database schema changes"
/spec:plan "Create new e-commerce checkout flow"
```
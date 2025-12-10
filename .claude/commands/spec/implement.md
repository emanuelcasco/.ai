---
description: Execute implementation plan with validation, maintaining traceability to original specification.
argument-hint: [plan_file] [extra_instructions?]
type: command
---

## Usage

`/spec:implement $PLAN_FILE $EXTRA_INSTRUCTIONS?`

## Variables

- $PLAN_FILE: Path to implementation plan to execute (required).
- $EXTRA_INSTRUCTIONS: Additional context or specific execution guidance (optional).

## Workflow
1. READ documents in parallel:
   1.1. Use existing `@~/.ai/tasks/execute-implementation-plan-task.md` in **Review Mode**
   1.2. READ existing implementation plan from $PLAN_FILE
2. EXECUTE phases sequentially as self-contained units
3. FOLLOW step-by-step instructions with file-level actions
4. VALIDATE implementation against acceptance criteria
5. MAINTAIN code quality and testing standards
6. DOCUMENT implementation decisions and changes

## Instructions

**Execution Approach:**
- Each phase must be completed without breaking the system
- Steps specify exact file changes (ADD/MODIFY/DELETE/etc.)
- Continuous validation against original objectives
- Test-driven development aligned with success criteria

**Gate 4 Validation (Implementation):**
- Code meets all acceptance criteria from spec
- Tests validate spec requirements (not just code)
- No architectural drift from approved plan
- Implementation maintains traceability to original requirements
- Documentation reflects actual implementation

## Examples

```plain
/spec:implement /path/to/specs/20241128120000_user_auth.md
/spec:implement /path/to/specs/feature_spec.md "Use TypeScript strict mode"
/spec:implement /path/to/specs/checkout_flow.md "Focus on error handling"
```

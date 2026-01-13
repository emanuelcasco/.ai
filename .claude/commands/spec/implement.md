---
description: Execute implementation plan with validation, maintaining traceability to original specification.
argument-hint: [plan_file] [extra_instructions?]
type: command
model: claude-sonnet-4-5
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
2. DETECT change type from plan content or file path:
   - Bug fix: Root cause analysis present, smaller scope
   - Greenfield: New architecture, no existing code
   - Brownfield: Legacy context, migration strategy present
3. EXECUTE phases sequentially as self-contained units
4. APPLY type-specific implementation approach
5. FOLLOW step-by-step instructions with file-level actions
6. **MARK progress in plan file as you complete each step**:
   - Update `- [ ]` to `- [x]` for completed steps
   - Update phase status when all steps in phase are done
   - Keep plan file as live progress tracker
7. VALIDATE implementation against acceptance criteria
8. MAINTAIN code quality and testing standards
9. DOCUMENT implementation decisions and changes

## Instructions

### Execution Approach

- Each phase must be completed without breaking the system
- Steps specify exact file changes (ADD/MODIFY/DELETE/etc.)
- Continuous validation against original objectives
- Test-driven development aligned with success criteria

### Progress Tracking

- **Mark steps complete immediately** after finishing each step—don't batch
- Update the plan file (`$PLAN_FILE`) with `- [x]` for completed steps
- Add brief notes to steps if implementation deviated from plan
- Update Mid-Level Objectives checkboxes when corresponding phases complete
- This keeps the plan file as a live progress document

### Type-Specific Implementation

**Bug Fix Implementation**

- START with regression test that reproduces the bug
- VERIFY test fails before fix
- IMPLEMENT minimal fix targeting root cause
- VERIFY test passes after fix
- CHECK no side effects in related functionality
- AVOID over-engineering or scope creep

**Greenfield Implementation**

- FOLLOW architecture decisions from plan
- ESTABLISH test coverage from start (target >80%)
- CREATE documentation as you build
- SET UP monitoring/logging early
- VALIDATE against design patterns chosen

**Brownfield Implementation**

- VERIFY existing behavior before changes
- IMPLEMENT behind feature flags when possible
- MAINTAIN backward compatibility (if required)
- TEST both old and new code paths
- PLAN for gradual rollout
- DOCUMENT migration strategy
- SCHEDULE legacy code cleanup

### Implementation

- Code meets all acceptance criteria from spec
- Tests validate spec requirements (not just code)
- No architectural drift from approved plan
- Implementation maintains traceability to original requirements
- Documentation reflects actual implementation
- Type-specific checks passed (see /spec:validate)

## Examples

```plain
/spec:implement /path/to/specs/bugfix/20241128_fix_login_timeout.md
/spec:implement /path/to/specs/greenfield/20241128_user_dashboard.md "Use TypeScript strict mode"
/spec:implement /path/to/specs/brownfield/20241128_migrate_payment_api.md "Enable feature flag"
```

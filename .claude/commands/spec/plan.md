---
description: Complete implementation plan with detailed phases and steps, processing feedback blocks from specification phase.
argument-hint: [plan_file] [extra_instructions?]
type: command
model: claude-opus-4-5
mode: ultrathink
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
4. **Before marking feedback as ADDRESSED**, surface OPEN questions:
   - Classify: user-decision vs AI-resolvable
   - Use AskUserQuestion for user-decision questions (group 2-4 per round)
   - Answer AI-resolvable questions directly
   - Incorporate responses into plan
5. MARK feedback blocks as ADDRESSED after resolution
6. MAINTAIN traceability to original objectives

## Instructions

- Process OPEN feedback blocks and mark as ADDRESSED
- Add detailed implementation phases with self-contained units
- Define specific steps with file-level actions (ADD/MODIFY/DELETE)
- Include code snippets of the changes for the developer to validate each change
- Each phase must be non-breaking and self-contained

**Feedback Resolution Guidelines:**

Before marking feedback blocks as ADDRESSED, process ALL OPEN questions:

- For each OPEN feedback block, classify questions:
  - **User questions**: Require user decision (architecture, trade-offs, preferences, ambiguities) → use AskUserQuestion
  - **AI-resolvable**: Technical/factual questions answerable from codebase → answer directly and mark ADDRESSED
- Group user questions by topic area (2-4 per AskUserQuestion round)
- Mark ADDRESSED only after resolved (user response OR AI answer)
- No OPEN block should be silently skipped

## Output Format

After completing the plan, ALWAYS output a summary with:

1. **File path** to the spec
2. **Phase summary table** showing all phases at a glance:

```markdown
| Phase | Layer    | Change                                    |
| ----- | -------- | ----------------------------------------- |
| 1     | Backend  | Repository - add `siteId` filter to query |
| 2     | Backend  | Service - pass `siteId` through           |
| 3     | Frontend | `useMetricsCatalog` - add to InputArgs    |
| ...   | ...      | ...                                       |
```

3. **Key Decisions** - bullet list of resolved feedback blocks
4. **Next steps prompt** - ask if ready to implement

## Examples

```plain
/spec:plan /path/to/specs/20241128120000_user_auth.md
/spec:plan /path/to/specs/feature_spec.md "Focus on database schema changes"
/spec:plan "Create new e-commerce checkout flow"
```

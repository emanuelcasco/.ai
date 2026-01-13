---
description: Systematic review and iteration of implementation plans through structured feedback processing.
argument-hint: [plan_file] [extra_instructions?]
type: command
mode: think
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
7. SURFACE OPEN feedback blocks using AskUserQuestion tool:
   - Classify questions: user-decision vs AI-resolvable
   - Group related user questions (2-4 per round)
   - Answer AI-resolvable questions directly and mark ADDRESSED
   - Present user questions with context about why they matter
   - Accept "defer" or "I'll answer later" as valid responses

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

**Feedback Resolution Guidelines:**

After adding new feedback blocks, process ALL OPEN questions:

- For each OPEN feedback block, classify questions:
  - **User questions**: Require user decision (architecture, trade-offs, preferences, ambiguities) → use AskUserQuestion
  - **AI-resolvable**: Technical/factual questions answerable from codebase → answer directly and mark ADDRESSED
- Group user questions by topic area (2-4 per AskUserQuestion round)
- Provide brief context for why each question matters
- Mark blocks ADDRESSED once resolved (user response OR AI answer)
- Accept "I'll answer later" as valid response (keep OPEN)
- No OPEN block should remain silently unaddressed

## Examples

```plain
/spec:review /path/to/specs/20241128120000_user_auth.md
/spec:review /path/to/specs/feature_spec.md "Focus on security considerations"
/spec:review /path/to/specs/checkout_flow.md "Validate database migration steps"
```

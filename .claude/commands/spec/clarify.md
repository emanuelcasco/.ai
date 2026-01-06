---
description: Deep-dive interview process to refine and complete specifications through iterative questioning.
argument-hint: [spec_file] [focus_areas?]
type: command
model: claude-opus-4-5
mode: think
---

## Usage

`/spec:clarify $SPEC_FILE $FOCUS_AREAS?`

## Variables

- $SPEC_FILE: Path to existing specification or implementation plan to clarify on (required).
- $FOCUS_AREAS: Comma-separated areas to focus interview on (optional). Examples: "security,scalability", "ux,edge-cases".

## Workflow

1. READ the specification document from $SPEC_FILE
2. ANALYZE for gaps, ambiguities, and unstated assumptions
3. INTERVIEW user using AskUserQuestion tool in iterative rounds:
   - Round 1: Architecture & Technical Implementation
   - Round 2: UI/UX & User Experience
   - Round 3: Edge Cases & Error Handling
   - Round 4: Trade-offs & Constraints
   - Round 5: Integration & Dependencies
   - Continue until no significant gaps remain
4. SYNTHESIZE answers into coherent specification updates
5. WRITE refined specification back to $SPEC_FILE

## Instructions

**Interview Principles:**

- Ask NON-OBVIOUS questions—skip anything the spec already answers clearly
- Probe second-order effects and implicit assumptions
- Challenge stated requirements to surface hidden constraints
- Focus on "what happens when X fails?" scenarios
- Explore trade-off boundaries ("how much latency is acceptable?")
- Uncover unstated user expectations and mental models

**Question Categories (use as needed, not exhaustively):**

Technical Implementation:

- Data flow edge cases and race conditions
- State management across failure scenarios
- Caching invalidation strategies
- Concurrency and locking requirements
- Backward compatibility constraints

UI/UX:

- Loading, error, and empty states
- Offline behavior and degraded modes
- Accessibility requirements beyond basics
- Animation and transition expectations
- Mobile vs desktop behavioral differences

Concerns & Risks:

- Security threat vectors specific to this feature
- Performance bottlenecks under realistic load
- Data integrity during partial failures
- Rollback and recovery procedures
- Monitoring and alerting needs

Trade-offs:

- Consistency vs availability preferences
- Feature scope vs delivery timeline
- Technical debt tolerance
- Build vs buy decisions
- Simplicity vs flexibility

**Interviewing Guidelines:**

- Use AskUserQuestion with 2-4 focused questions per round
- Group related questions to minimize context-switching
- Provide brief context for why each question matters
- Accept "I don't know" or "not important" as valid answers
- Stop when answers become redundant or user signals completion
- Never ask questions whose answers are already in the spec

**Completion Criteria:**

- All critical paths have defined behavior
- Error states and edge cases are addressed
- Trade-off decisions are explicit
- User confirms no remaining gaps

## Examples

```plain
/spec:clarify /specs/20241128120000_user_auth.md
/spec:clarify /specs/checkout_flow.md "security,edge-cases"
/spec:clarify /specs/dashboard_feature.md "ux,performance"
```
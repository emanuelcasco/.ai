---
title: Refine Iteration Story Task
type: task
mode: think
templates:
  - @~/.ai/templates/story.tmp.md
---

## Purpose

Refine an existing user story to follow established rules and standards for iteration enhancements. This task ensures stories are properly scoped, clearly defined, and aligned with existing system patterns before development begins.

## Workflow

### 1. Story Analysis

Review the existing story against iteration standards:

**Current Story Assessment:**

- [ ] Story title is specific and clear
- [ ] User story format is complete and valuable
- [ ] Acceptance criteria are testable and complete
- [ ] Integration points are clearly defined
- [ ] Technical approach is specified

**Scope Validation:**

- [ ] Story can be completed in one development session (≤4 hours)
- [ ] No new architecture or significant design required
- [ ] Change follows existing patterns exactly
- [ ] Integration is straightforward with minimal risk
- [ ] Change boundaries are clear and isolated

### 2. Story Refinement Process

#### Update Method Selection

**For Local Documents:**

- Update the story document directly following the refined structure below
- Mark changes with comments if collaboration tracking is needed

**For Issue Manager (Linear, Jira, etc.):**

- Update the ticket description with the refined story structure
- Leave a comment summarizing the key changes made (4-5 bullet points)

#### Refined Story Structure

Apply this structure to ensure the story meets iteration standards:

##### Story Title

{{Specific Enhancement}} - Iteration Addition

##### User Story

As a {{user type}},
I want {{specific action/capability}},
So that {{clear benefit/value}}.

##### Story Context

**Existing System Integration:**

- Integrates with: {{existing component/system}}
- Technology: {{relevant tech stack}}
- Follows pattern: {{existing pattern to follow}}
- Touch points: {{specific integration points}}

##### Acceptance Criteria

**Functional Requirements:**

1. {{Primary functional requirement}}
2. {{Secondary functional requirement (if any)}}
3. {{Integration requirement}}

**Integration Requirements:** 4. Existing {{relevant functionality}} continues to work unchanged 5. New functionality follows existing {{pattern}} pattern 6. Integration with {{system/component}} maintains current behavior

**Quality Requirements:** 7. Change is covered by appropriate tests 8. Documentation is updated if needed 9. No regression in existing functionality verified

##### Technical Notes

- **Integration Approach:** {{how it connects to existing system}}
- **Existing Pattern Reference:** {{link or description of pattern to follow}}
- **Key Constraints:** {{any important limitations or requirements}}

##### Definition of Done

- [ ] Functional requirements met
- [ ] Integration requirements verified
- [ ] Existing functionality regression tested
- [ ] Code follows existing patterns and standards
- [ ] Tests pass (existing and new)
- [ ] Documentation updated if applicable

### 3. Risk and Compatibility Validation

**Minimal Risk Assessment:**

- **Primary Risk:** {{main risk to existing system}}
- **Mitigation:** {{simple mitigation approach}}
- **Rollback:** {{how to undo if needed}}

**Compatibility Verification:**

- [ ] No breaking changes to existing APIs
- [ ] Database changes (if any) are additive only
- [ ] UI changes follow existing design patterns
- [ ] Performance impact is negligible

### 4. Issue Manager Comment Template

When refining stories in Linear, Jira, or similar tools, use this comment template:

```plain
Hello! {{agent_name (if available) or username}}!! I've updated the story to follow the iteration standards:
1. {{Change 1 - e.g., "Clarified integration approach with existing auth system"}}
2. {{Change 2 - e.g., "Added specific acceptance criteria for backward compatibility"}}
3. {{Change 3 - e.g., "Defined clear rollback strategy for safe deployment"}}
4. {{Change 4 - e.g., "Specified existing pattern to follow for consistency"}}
5. {{Change 5 - e.g., "Validated scope to ensure single-session completion"}}

Story is now ready for development with clear boundaries and integration approach.
```

### 5. Final Validation Checklist

Before marking the story as refined, confirm:

**Scope Validation:**

- [ ] Story can be completed in one development session
- [ ] Integration approach is straightforward
- [ ] Follows existing patterns exactly
- [ ] No design or architecture work required

**Clarity Check:**

- [ ] Story requirements are unambiguous
- [ ] Integration points are clearly specified
- [ ] Success criteria are testable
- [ ] Rollback approach is simple

**Standards Compliance:**

- [ ] Story follows iteration enhancement format
- [ ] All required sections are complete
- [ ] Technical approach is clearly defined
- [ ] Risk assessment is documented

## Success Criteria

The story refinement is successful when:

1. Story is clearly defined and appropriately scoped for single session
2. Integration approach is straightforward and low-risk
3. Existing system patterns are identified and referenced
4. Rollback plan is simple and feasible
5. Acceptance criteria include existing functionality verification
6. All team members can understand and implement the story without additional clarification

## Instructions

- This task is for ITERATION STORIES ONLY - very small changes that fit existing patterns
- If refinement reveals complexity requiring multiple stories, escalate to create-epic
- Always prioritize existing system integrity over new functionality
- When in doubt about integration complexity, escalate rather than proceed
- Refined stories should take no more than 4 hours of focused development work
- Document all refinement decisions for future reference

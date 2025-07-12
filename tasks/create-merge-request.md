---
title: Create Merge Request Task
type: task
mode: execute
templates:
  - @.ai/templates/pull-request.tmp.md
---

## Purpose

Guide the creation of a single, focused merge request (MR, pull request, PR, etc) for small, well-scoped changes. This task ensures the MR is clear, low-risk, and follows project standards, using the provided merge request template.

## When to Use This Task

**Use this task when:**

- The change is small and can be reviewed in one session
- No major refactoring or architecture changes are involved
- The MR follows existing code patterns and standards
- The change is isolated with minimal integration risk
- The MR is not a release or hotfix (use a different process for those)

**Use a different process when:**

- The change spans multiple features or modules
- Significant design or architectural work is required
- Multiple reviewers or teams are involved

## Instructions

### 1. Quick Project Assessment

Gather essential context before opening the MR:

**Current System Context:**
- [ ] Relevant functionality and impacted areas identified
- [ ] Technology stack for the change noted
- [ ] Integration points and dependencies understood
- [ ] Existing patterns or conventions to follow identified

**Change Scope:**
- [ ] Specific change clearly defined
- [ ] Impact boundaries identified
- [ ] Success criteria established

### 2. Merge Request Creation

Create the MR using the following structure (see @.ai/templates/pull-request.tmp.md):

#### MR Title

{{Concise summary of the change}}

#### MR Description (use template)

- **Summary:**
  - What was changed and why (max 3 sentences)
- **Related Issues:**
  - Link to related issues or feature requests
- **Changes:**
  - List of changes, with explanations if needed
  - Code snippets/examples if relevant
- **Additional Notes:**
  - Any extra info for reviewers
- **Evidences:**
  - Screenshots, logs, or code samples (UI/frontend only)
- **Checklist:**
  - [ ] Code follows guidelines
  - [ ] Documentation updated
  - [ ] Unit tests covered

### 3. Acceptance Criteria

**Functional Requirements:**
1. MR implements the intended change
2. No regression in existing functionality
3. All tests pass (existing and new)

**Quality Requirements:**
4. MR description is clear and complete
5. Code follows project standards
6. Documentation is updated if needed

### 4. Technical Notes

- **Integration Approach:** {{How the change fits into the system}}
- **Pattern Reference:** {{Link or description of pattern followed}}
- **Key Constraints:** {{Any important limitations}}

### 5. Risk and Compatibility Check

**Minimal Risk Assessment:**
- **Primary Risk:** {{Main risk to system}}
- **Mitigation:** {{How to reduce risk}}
- **Rollback:** {{How to revert if needed}}

**Compatibility Verification:**
- [ ] No breaking changes to APIs
- [ ] Database changes (if any) are backward compatible
- [ ] UI changes follow design patterns
- [ ] Performance impact is negligible

### 6. Validation Checklist

Before finalizing the MR, confirm:

- [ ] MR is scoped for a single review session
- [ ] Follows existing patterns and standards
- [ ] No design/architecture work required
- [ ] Requirements and impact are unambiguous
- [ ] Success criteria are testable
- [ ] Rollback approach is simple

## Success Criteria

The merge request task is successful when:

1. The change is clearly defined and scoped
2. The MR description uses the template and is complete
3. The integration approach is straightforward and low-risk
4. Rollback plan is simple and feasible
5. Acceptance criteria include verification of existing functionality

## Important Notes

- This task is for SMALL, focused merge requests only
- If complexity grows, escalate to a broader process
- Always prioritize system stability and code quality
- When in doubt about risk or integration, consult a lead or escalate

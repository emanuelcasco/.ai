---
title: Review Merge Request Task
type: task
mode: think
---

## Purpose

Guide the review of a single, focused merge request (MR) for small, well-scoped changes. This task ensures the MR is thoroughly reviewed for clarity, risk, and adherence to project standards, referencing the pull request template.

## Workflow

### 1. Quick Project Assessment

Before reviewing, gather essential context:

**Current System Context:**

- [ ] Relevant functionality and impacted areas identified
- [ ] Technology stack for the change noted
- [ ] Integration points and dependencies understood
- [ ] Existing patterns or conventions to follow identified

**Change Scope:**

- [ ] Specific change clearly defined
- [ ] Impact boundaries identified
- [ ] Success criteria established

### 2. Merge Request Review

Review the MR using the following structure (see @~/.ai/templates/pull-request.tmp.md):

#### MR Title & Description

- [ ] Title is concise and descriptive
- [ ] Description follows the template and is complete
- [ ] Summary explains the WHAT and WHY
- [ ] Related issues are linked
- [ ] List of changes is clear and matches the code
- [ ] Additional notes and evidences are provided if needed
- [ ] Checklist items are addressed

### 3. Acceptance Criteria

**Functional Requirements:**

1. MR implements the intended change as described
2. No regression in existing functionality
3. All tests pass (existing and new)

**Quality Requirements:** 4. MR description is clear and complete 5. Code follows project standards 6. Documentation is updated if needed

### 4. Technical Notes

- **Integration Approach:** Review how the change fits into the system
- **Pattern Reference:** Confirm adherence to existing patterns
- **Key Constraints:** Identify any important limitations

### 5. Risk and Compatibility Check

**Minimal Risk Assessment:**

- [ ] Primary risks are identified and addressed
- [ ] Mitigation and rollback plans are clear

**Compatibility Verification:**

- [ ] No breaking changes to APIs
- [ ] Database changes (if any) are backward compatible
- [ ] UI changes follow design patterns
- [ ] Performance impact is negligible

### 6. Validation Checklist

Before approving the MR, confirm:

- [ ] MR is scoped for a single review session
- [ ] Follows existing patterns and standards
- [ ] No design/architecture work required
- [ ] Requirements and impact are unambiguous
- [ ] Success criteria are testable
- [ ] Rollback approach is simple

## Success Criteria

The merge request review is successful when:

1. The change is clearly defined and scoped
2. The MR description uses the template and is complete
3. The integration approach is straightforward and low-risk
4. Rollback plan is simple and feasible
5. Acceptance criteria include verification of existing functionality

## Instructions

- This task is for SMALL, focused merge requests only
- If complexity grows, escalate to a broader process
- Always prioritize system stability and code quality
- When in doubt about risk or integration, consult a lead or escalate

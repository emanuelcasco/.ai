---
title: Code Review Task
type: task
mode: think
---

## Purpose

Perform comprehensive code review for MR links/branches using conventional comments, generating structured markdown with actionable feedback.

## Workflow

### 1. Initial Analysis

**Gather MR Information:**

- [ ] Access MR (title, description, changes, files)
- [ ] Understand context and modification scope

**Technical Assessment:**

- [ ] Code quality, standards adherence
- [ ] Security vulnerabilities, performance impact
- [ ] Architectural consistency, test coverage

### 2. Review Execution

**Guidelines:**

- Follow Conventional Comments format
- Brief, actionable, gentle explanations
- Focus: quality, security, performance, maintainability

**Comment Structure:**

```
<label>: <subject>
[discussion]
```

**Labels:** `praise`, `nitpick`, `suggestion`, `issue`, `todo`, `question`, `thought`, `chore`, `note`

### 3. Generate Review Document

**Filename:** `code-review-{timestamp}-{mr-id}.md`

**Structure:**

```markdown
# Code Review - [MR Title]

**MR Link:** [link]
**Date:** {current_date}

## Review Status

- [ ] **Approved** - Ready to merge
- [ ] **Approved with Comments** - Can merge, address in follow-up
- [ ] **Request Changes** - Must address before merge

## Summary

Brief overview and overall assessment.

## Review Comments

### File: {filename}

#### [ ] {type}: {description}

- Comments: <LEAVE EMPTY FOR USER FEEDBACK ON THE LOOP>
- Location: Line {number} or {name}
- Comment: {conventional_format}
- Suggested Change:

`/`/`/diff
// Proposed code if applicable
`/`/`/`

## Output

- **Total Comments:** {number}
- **Blocking Issues:** {number}
- **Non-blocking Suggestions:** {number}
- **Files Reviewed:** {list}
- **Overall Assessment:** {summary}

## Next Steps

- [ ] User reviews markdown, checks completed items
- [ ] User requests submission of remaining comments
- [ ] Apply review status to MR
```

### 4. User Review Loop

Present markdown → User reviews/modifies → User indicates submission readiness

### 5. MR Comment Submission

**CRITICAL: Comments must be inline on specific code lines, not standalone MR notes.**

**Important:** Always use inline comments attached to specific lines in the code, never standalone general comments.

**When requested:**

- [ ] Re-read markdown file
- [ ] Identify unchecked comments
- [ ] Submit inline comments to specific file lines using `--file` and `--line` parameters
- [ ] Apply review status
- [ ] Confirm with summary

### 6. Quality Standards

**Code Quality Checklist:**

- [ ] Coding conventions, error handling, security practices
- [ ] Performance, readability, documentation
- [ ] Test coverage, no obvious bugs

**Comment Quality:**

- [ ] Clear, actionable, constructive, respectful
- [ ] Reasoning included, conventional format
- [ ] Appropriate priority, code examples when helpful

## Instructions

- **Be Constructive:** Improve, don't criticize
- **Explain Reasoning:** Provide context for suggestions
- **Prioritize:** Use blocking vs non-blocking appropriately
- **Focus Areas:** Security, performance, conventions, testing, documentation

## Success Criteria

1. **Comprehensive Analysis:** All files and critical paths reviewed
2. **Structured Documentation:** Clear markdown with actionable items
3. **Quality Feedback:** Conventional format, valuable comments
4. **User Control:** Review/modify before submission
5. **Proper Status:** Appropriate MR review status
6. **Clear Communication:** Final summary with action items

## Output

```plain
✅ Code Review Completed

- Comments Submitted: {number}
- Files with Comments: {list}
- Review Status Applied: {status}

Breakdown:

- Blocking Issues: {number}
- Suggestions: {number}
- Questions: {number}
- Praise: {number}
```

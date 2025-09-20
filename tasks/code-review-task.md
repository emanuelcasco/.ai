---
title: Code Review Task
type: task
mode: think
---

## Purpose

Perform a comprehensive code review for a given Merge Request (MR) link or branch, following conventional comments guidelines and generating a structured markdown review document with actionable feedback.

## Workflow

### 1. Initial Setup and Analysis

**Gather MR Information:**

- [ ] MR link or branch provided
- [ ] Access MR details (title, description, changes)
- [ ] Identify changed files and scope of modifications
- [ ] Understand the context and purpose of the changes

**Technical Assessment:**

- [ ] Review code quality and adherence to standards
- [ ] Check for security vulnerabilities
- [ ] Assess performance implications
- [ ] Verify architectural consistency
- [ ] Evaluate test coverage and quality

### 2. Code Review Execution

**Review Guidelines:**

- Follow https://conventionalcomments.org/ format
- Keep comments brief and actionable
- Be gentle and explain the reasoning behind suggestions
- Focus on code quality, security, performance, and maintainability
- Provide constructive feedback with clear improvement paths

**Comment Structure:**

```
<label> [decoration]: <subject>

[discussion]
```

**Labels:** `praise`, `nitpick`, `suggestion`, `issue`, `todo`, `question`, `thought`, `chore`, `note`
**Decorations:** `(non-blocking)`, `(blocking)`, `(if-minor)`

### 3. Generate Review Document

Create a markdown file named: `code-review-{timestamp}-{mr-id}.md`

**Document Structure:**

```markdown
# Code Review - [MR Title]

**MR Link:** [link]
**Reviewer:** Aristotle (Business Analyst)
**Date:** {current_date}

## Review Status

- [ ] **Approved** - Ready to merge
- [ ] **Approved with Comments** - Can merge, address comments in follow-up
- [ ] **Request Changes** - Must address issues before merge

## Summary

Brief overview of the changes and overall assessment.

## Review Comments

### File: {filename}

- [ ] **{comment_type}**: {brief_description}

  **Location:** Line {number} or function/class {name}

  **Comment:**
  {conventional_comment_format}

  **Suggested Change:**
  `/`/`/{language}
// Proposed code change if applicable
`/`/`/

### File: {filename2}

- [ ] **{comment_type}**: {brief_description}

  ... (repeat for each comment)

## Output

- **Total Comments:** {number}
- **Blocking Issues:** {number}
- **Non-blocking Suggestions:** {number}
- **Files Reviewed:** {list}
- **Overall Assessment:** {brief_summary}

## Next Steps

- [ ] User reviews markdown and checks completed items
- [ ] User requests submission of remaining comments to MR
- [ ] Apply review status to MR (approve/request changes)
```

### 4. User Review and Feedback Loop

**Wait for User Review:**

- Present the markdown document to user
- Allow user to review and check boxes for items they want to address
- User can modify or remove comments as needed
- User indicates when ready to submit remaining comments

### 5. MR Comment Submission

**When User Requests Submission:**

- [ ] Re-read the markdown file
- [ ] Identify unchecked comments (remaining items to submit)
- [ ] Submit only the remaining comments to the actual MR
- [ ] Apply the selected review status (approve/request changes/comment only)
- [ ] Confirm submission with summary

**Final Report Structure:**

```
✅ Code Review Completed

**Comments Submitted:** {number}
**Files with Comments:** {list}
**Review Status Applied:** {approved/requested_changes/commented}

**Breakdown:**
- Blocking Issues: {number}
- Suggestions: {number}
- Questions: {number}
- Praise: {number}
```

### 6. Quality Standards

**Code Quality Checklist:**

- [ ] Follows established coding conventions
- [ ] Proper error handling and validation
- [ ] Security best practices implemented
- [ ] Performance considerations addressed
- [ ] Code is readable and maintainable
- [ ] Proper documentation and comments
- [ ] Test coverage is adequate
- [ ] No obvious bugs or logical errors

**Comment Quality Standards:**

- [ ] Clear and actionable feedback
- [ ] Constructive and respectful tone
- [ ] Includes reasoning behind suggestions
- [ ] Follows conventional comments format
- [ ] Appropriate priority levels assigned
- [ ] Code examples provided when helpful

## Instructions

- **Be Constructive:** Focus on improvement, not criticism
- **Explain Reasoning:** Always provide context for suggestions
- **Prioritize Issues:** Use blocking vs non-blocking appropriately
- **Security Focus:** Pay special attention to security implications
- **Performance Awareness:** Consider scalability and performance impacts
- **Follow Conventions:** Adhere to project-specific coding standards
- **Test Coverage:** Ensure adequate testing for new functionality
- **Documentation:** Verify that changes are properly documented

## Success Criteria

The code review is successful when:

1. **Comprehensive Analysis:** All changed files and critical paths reviewed
2. **Structured Documentation:** Clear markdown document with actionable items
3. **Quality Feedback:** Comments follow conventional format and provide value
4. **User Control:** User can review and modify comments before submission
5. **Proper Status:** Appropriate review status applied to MR
6. **Clear Communication:** Final summary provides clear action items

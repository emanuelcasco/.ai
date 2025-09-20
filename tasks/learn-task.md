---
title: Learn and Abstract Knowledge Task
type: task
mode: think
---

## Purpose

Abstract valuable knowledge from the current session and append it to the memory system for future reference.

## Workflow

### 1. Identify Knowledge

Analyze the session for:

- [ ] Technical patterns or architectural insights
- [ ] Problem-solving approaches that worked
- [ ] Tool usage or command sequences
- [ ] Process improvements or workflows

### 2. Generate Draft

Create a structured knowledge section:

```markdown
#### {{Knowledge Title}}

**Context**: {{When this applies}}
**Approach**: {{Core insight or method}}
**Example**: {{Code snippet or specific implementation}}
**Success Indicators**: {{How to verify it works}}
```

### 3. Present for Confirmation

Show draft to user with questions:

1. Does this capture the key insight accurately?
2. Are there additional contexts where this applies?
3. Should anything be modified or added?

### 4. Append to Memory

After user approval:

- Add as h4 section at end of @~/.ai/data/memory.md (for strategic knowledge)
- Or add to @~/.ai/data/technical-preferences.md (for technical patterns)
- Maintain existing structure and formatting
- When referencing other files be sure to append the "@<your root>". Do not use "``" around the routes as they avoid Claude Code to look up for the files

## Success Criteria

- Knowledge is clearly articulated and actionable
- Can be applied to future similar situations
- User confirms accuracy and usefulness
- Properly integrated into memory system

# Memory

#### User Request Understanding

**Context**: When receiving user requests that may be ambiguous or incomplete
**Approach**: Apply systematic questioning to fully understand the real requirements before starting implementation
**Example**: Before implementing "fix the login issue", ask: What specific login behavior is failing? What should happen vs what actually happens? Which components are involved?
**Success Indicators**: Clear understanding of expected vs actual behavior, specific components identified, issue type classified

#### Mandatory Implementation Files Review

**Context**: Before implementing complex features or debugging issues
**Approach**: Always read and understand the actual implementation files rather than making assumptions
**Example**: For a React component issue, read the component file, check imports, understand the state management library used, and map the data flow
**Success Indicators**: Complete understanding of technology stack, dependencies mapped, no assumptions about implementation approach

#### Architecture Compatibility Check

**Context**: Before proposing solutions to ensure they work with existing system
**Approach**: Validate proposed solutions against actual technology stack and architectural constraints
**Example**: If proposing a state management solution, verify it works with existing Redux setup and doesn't conflict with current patterns
**Success Indicators**: Solution works with existing implementation, no technology conflicts, known limitations addressed

#### Root Cause Analysis (Apply 5 Whys)

**Context**: When debugging complex issues or understanding system behavior
**Approach**: Apply systematic questioning using the 5 Whys technique to reach root cause
**Example**: Bug: "API calls fail" → Why? "Network timeout" → Why? "Server overloaded" → Why? "No connection pooling" → Why? "Legacy architecture" → Why? "Technical debt priority"
**Success Indicators**: Root cause identified, not just symptoms, underlying system behavior understood

#### Automatic Escalation Triggers

**Context**: When standard problem-solving approaches are not working
**Approach**: Recognize patterns that indicate need for deeper investigation and escalate immediately
**Example**: User says "still not working" after trying 2 solutions, or CSS fixes fail for layout issues - stop and read implementation files
**Success Indicators**: Quick recognition of escalation triggers, immediate pivot to investigation mode, no continued failed attempts

#### Sign your work

**Context**: When generating any artifact (documents, merge requests, comments)
**Approach**: Always sign work with agent name and role to maintain accountability and tracking when generating some artifact (document, merge request, comment, etc)
**Example**: "Made with ❤️ by Ada (Dev), with the assistance of Linus (Architect). Special thanks to Emanuel Casco for his contribution."
**Success Indicators**: Clear attribution of work, team collaboration acknowledged, professional presentation maintained

---
title: Advanced Elicitation Task
type: task
mode: think harder
---

## Purpose

Provide reflective and brainstorming actions to enhance content quality through structured elicitation techniques and iterative refinement.

## Instructions

### 1. Section Context and Review

[[LLM: When invoked after outputting a section:
1. Provide 1-2 sentence summary of what user should review
2. If Mermaid diagrams present, explain each briefly before offering options
3. For multiple items, inform user they can apply actions to entire section or individual items
4. Present action list below.]]

### 2. Ask for Review and Present Action List

[[LLM: Ask user to review section. In SAME message, inform they can suggest modifications OR select numbered action. For multiple items, mention they can specify which to apply action to. Present ONLY numbered list (0-9). State selecting 9 proceeds to next section. If 0-8 chosen, execute then re-offer choice. If 9 or direct feedback, proceed accordingly.]]

**Present the numbered list (0-9) with this exact format:**

```text
**Advanced Reflective, Elicitation & Brainstorming Actions**
Choose an action (0-9 - 9 to bypass - HELP for explanation of these options):

0. Expand or Contract for Audience
1. Explain Reasoning (CoT Step-by-Step)
2. Critique and Refine
3. Analyze Logical Flow and Dependencies
4. Assess Alignment with Overall Goals
5. Identify Potential Risks and Unforeseen Issues
6. Challenge from Critical Perspective (Self or Other Persona)
7. Explore Diverse Alternatives (ToT-Inspired)
8. Hindsight is 20/20: The 'If Only...' Reflection
9. Proceed / No Further Actions
```

### 3. Processing Guidelines

**Do NOT show**: Protocol text with `[[LLM: ...]]` instructions, detailed explanations unless executing, internal markup

**After user selection**: Execute chosen action per protocol below, ask for another action or proceed with option 9, continue until option 9 or completion

## Workflow

0. Expand or Contract for Audience
   [[LLM: Ask the user whether they want to 'expand' on the content (add more detail, elaborate) or 'contract' it (simplify, clarify, make more concise). Also, ask if there's a specific target audience they have in mind. Once clarified, perform the expansion or contraction from your current role's perspective, tailored to the specified audience if provided.]]

1. Explain Reasoning (CoT Step-by-Step)
   [[LLM: Explain the step-by-step thinking process, characteristic of your role, that you used to arrive at the current proposal for this content.]]

2. Critique and Refine
   [[LLM: From your current role's perspective, review your last output or the current section for flaws, inconsistencies, or areas for improvement, and then suggest a refined version reflecting your expertise.]]

3. Analyze Logical Flow and Dependencies
   [[LLM: From your role's standpoint, examine the content's structure for logical progression, internal consistency, and any relevant dependencies. Confirm if elements are presented in an effective order.]]

4. Assess Alignment with Overall Goals
   [[LLM: Evaluate how well the current content contributes to the stated overall goals of the document, interpreting this from your specific role's perspective and identifying any misalignments you perceive.]]

5. Identify Potential Risks and Unforeseen Issues
   [[LLM: Based on your role's expertise, brainstorm potential risks, overlooked edge cases, or unintended consequences related to the current content or proposal.]]

6. Challenge from Critical Perspective (Self or Other Persona)
   [[LLM: Adopt a critical perspective on the current content. If the user specifies another role or persona (e.g., 'as a customer', 'as [Another Persona Name]'), critique the content or play devil's advocate from that specified viewpoint. If no other role is specified, play devil's advocate from your own current persona's viewpoint, arguing against the proposal or current content and highlighting weaknesses or counterarguments specific to your concerns. This can also randomly include YAGNI when appropriate, such as when trimming the scope of an MVP, the perspective might challenge the need for something to cut MVP scope.]]

7. Explore Diverse Alternatives (ToT-Inspired)
   [[LLM: From your role's perspective, first broadly brainstorm a range of diverse approaches or solutions to the current topic. Then, from this wider exploration, select and present 2 distinct alternatives, detailing the pros, cons, and potential implications you foresee for each.]]

8. Hindsight is 20/20: The 'If Only...' Reflection
   [[LLM: In your current persona, imagine it's a retrospective for a project based on the current content. What's the one 'if only we had known/done X...' that your role would humorously or dramatically highlight, along with the imagined consequences?]]

9. Proceed / No Further Actions
   [[LLM: Acknowledge the user's choice to finalize the current work, accept the AI's last output as is, or move on to the next step without selecting another action from this list. Prepare to proceed accordingly.]]

---
title: Write Agents Prompts
type: task
mode: think
---

# Create Documentation for Agent System Prompts and Tool Descriptions

## Objective

Develop a guide that helps create high-quality agent prompts that leverage:

- Clear role/persona definition
- Few-shot prompting examples
- Chain-of-thought reasoning
- ReAct prompting patterns

## Key Requirements

### 1. Agent Role and Persona Definition

- **Purpose**: Establish clear agent identity and responsibilities
- **Implementation**: Define specific expertise, communication style, and behavioral patterns
- **Example Structure**:
  ```
  You are [ROLE] with expertise in [DOMAIN].
  Your primary responsibility is [MAIN_FUNCTION].
  You communicate in a [STYLE] manner and always [BEHAVIOR_PATTERN].
  ```

### 2. Few-Shot Prompting Integration

- **Purpose**: Provide 1-2 concrete examples to clarify expected behavior
- **Implementation**: Include realistic input-output pairs that demonstrate:
  - Proper reasoning flow
  - Expected response format
  - Tool usage patterns
- **Structure**: Present examples before main instructions

### 3. Chain-of-Thought Prompting

- **Purpose**: Enable step-by-step reasoning for complex tasks
- **Implementation**:
  - Include "let's think step by step" triggers
  - Break down reasoning into explicit steps
  - Show intermediate thinking processes
- **Use Cases**: Problem-solving, analysis, multi-step procedures

### 4. ReAct Prompting Pattern

- **Purpose**: Enable effective tool usage and adaptive behavior
- **Components**:
  - **Reasoning**: Why a specific action is needed
  - **Acting**: What tool/action to take
  - **Observing**: Process and learn from results
- **Implementation**: Create feedback loops that allow agents to:
  - Plan actions based on reasoning
  - Execute tools/functions
  - Adapt based on outcomes

## Documentation Structure

### System Prompt Template

- **Purpose**: Defines the agent’s behavior and constraints when talking to the LLM.
- **Audience**: The **LLM itself** (never seen by humans).
- **Writing Tips**:

  - Be **specific** about what the agent should and should not do.
  - Set the **style, tone, and format** of answers.
  - Include **hard rules** the LLM must follow.

```
# [AGENT_NAME]

## Role and Expertise
[Clear persona definition]

## Core Responsibilities
[Primary functions and objectives]

## Communication Style
[Tone, verbosity, interaction patterns]

## Examples
[1-2 few-shot examples showing expected behavior]

## Reasoning Framework
[Chain-of-thought and ReAct patterns]

## Tool Usage Guidelines
[How to reason about and use available tools]
```

### Agent Description

### 🔹 **Description**

- **Purpose**: A short summary of what the agent does.
- **Audience**: For **humans** and **the LangGraph planner/router** (to decide if this agent is relevant).
- **Writing Tips**:

  - Keep it **1–2 sentences max**.
  - Focus on **what problem the agent solves**.
  - Avoid unnecessary details (that belongs in the system prompt).

```
## Agent: [AGENT_NAME]

### Description
[Short summary of what the agent does]
```

### Tool Description Template

Each **tool** also has a **description**, which guides the LLM in selecting the right one.

- **Purpose**: Explains **when and why** the tool should be used.
- **Audience**: The **LLM/planner** that decides which tool to call.
- **Writing Tips**:

  - Be **action-oriented**: start with a verb (e.g., “Searches”, “Retrieves”, “Calculates”).
  - Mention the **scope** of the tool (so the LLM doesn’t misuse it).
  - Keep it short (1 sentence).

```
## Tool: [TOOL_NAME]

### Purpose
[What problem this tool solves]

### When to Use
[Reasoning patterns for tool selection]

### Parameters
[Input requirements and format]

### Example Usage
[ReAct pattern example: Reasoning → Action → Observation]
```

## Implementation Guidelines

1. **Start with Role Definition**: Establish clear agent identity before adding complexity
2. **Include Concrete Examples**: Show don't just tell - provide working examples
3. **Structure Reasoning**: Make thinking processes explicit and step-by-step
4. **Enable Adaptation**: Build in feedback mechanisms for tool-using agents
5. **Test and Iterate**: Validate prompts with real scenarios and refine based on results

## Success Criteria

- [ ] Clear agent role and persona defined
- [ ] 1-2 relevant few-shot examples included
- [ ] Chain-of-thought reasoning patterns integrated
- [ ] ReAct framework applied for tool usage
- [ ] Documentation is actionable and complete
- [ ] Examples demonstrate expected behavior clearly

## Deliverables

1. System prompt template with all four techniques integrated
2. Tool description template following ReAct patterns
3. Implementation guidelines document
4. Example agent prompts demonstrating best practices

## Notes

- Focus on practical application over theoretical concepts
- Ensure prompts are production-ready, not just demonstrations
- Consider different agent types (analytical, creative, tool-heavy, etc.)
- Balance structure with flexibility for different use cases

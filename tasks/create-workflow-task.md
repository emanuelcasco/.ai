---
title: Create Agentic Workflow Task
type: task
mode: think
templates:
  - @~/.ai/templates/workflow.tmp.yml
---

## Purpose

Create standardized agentic workflows that coordinate multiple agents to complete complex, multi-step processes. This task defines workflows using YAML DSL for clear orchestration, data flow, and execution control across agent collaboration.

## Workflow

### 1. Workflow Analysis

Define the process and identify requirements:

**Process Assessment:**

- [ ] End goal clearly defined
- [ ] Process broken into logical steps
- [ ] Required agent specializations identified
- [ ] Data flow dependencies mapped
- [ ] Execution strategy determined (sequential/parallel)

**Complexity Validation:**

- [ ] Process requires multiple agent interactions
- [ ] Steps have clear input/output relationships
- [ ] Each step is atomic and testable
- [ ] Workflow benefits from standardization

### 2. Agent Role Definition

Identify and map agent specializations:

**Agent Mapping:**

- **analyst** research, data analysis, synthesis
- **writer** content generation, documentation
- **reviewer** quality assurance, improvement, validation
- **executor** code execution, testing, deployment
- **architect** system design, technical planning

**Role Validation:**

- [ ] Each agent has a clear, distinct purpose
- [ ] Agents are domain-specific and predictable
- [ ] No overlap in responsibilities
- [ ] Agent capabilities match step requirements

### 3. Workflow Structure Design

Create the workflow following the YAML DSL structure:

#### Workflow Header

```yaml
workflow:
  name: { { descriptive_workflow_name } }
  description: { { clear description of what this workflow achieves } }
  version: 1.0
```

#### Default Configuration

```yaml
defaults:
  execution: sequential # sequential | parallel
  retry: 1 # number of retries if step fails
  timeout: 30m # default timeout for steps
```

#### Global Context

```yaml
context:
  topics: [] # optional: global parameters
  env: {} # optional: environment variables
```

#### Step Definition

```yaml
steps:
  - id: { { step_identifier } }
    agent: { { agent_name } }
    execution: sequential | parallel # overrides default
    foreach: { { file/list/variable } } # optional: iterate items
    input: { { file_or_path } } # optional: where data comes from
    output: { { file_or_path } } # optional: where results go
    retry: { { number } } # optional: override default
    timeout: { { duration } } # optional: override default
    task: |
      {{natural language description of what this step does}}
    context: { { extra parameters specific to this step } }
```

### 4. Data Flow Design

Define clear input/output relationships:

**I/O Conventions:**

- Inputs/outputs are files, streams, or references
- Always define them explicitly for traceability
- Use consistent naming patterns
- Document data transformations between steps

**Flow Patterns:**

- Linear: `input.md → step1.md → step2.md → output.md`
- Parallel: `input.md → [draft1.md, draft2.md] → review.md`
- Iterative: `items.json → foreach → outputs/{item}.md`

### 5. Execution Strategy

Define how steps should execute:

**Sequential Execution:**

- Use when steps depend on previous outputs
- Default for most workflows
- Ensures data consistency

**Parallel Execution:**

- Use for independent operations
- Improves performance for batch processing
- Good for generating multiple variants

**Iteration (foreach):**

- Use for processing lists or datasets
- Can be combined with parallel execution
- Enables batch operations on multiple items

### 6. Operational Controls

Add reliability and monitoring features:

**Retry Strategy:**

- Set appropriate retry counts for each step
- Consider agent-specific failure patterns
- Balance reliability with execution time

**Timeout Configuration:**

- Set realistic timeouts based on step complexity
- Allow for agent processing time
- Consider external dependency delays

**Version Control:**

- Use semantic versioning for workflows
- Document breaking changes
- Maintain backward compatibility when possible

### 7. Workflow Validation

Ensure workflow quality and feasibility:

**Structure Validation:**

- [ ] Workflow name is descriptive and unique
- [ ] All steps have unique identifiers
- [ ] Input/output dependencies are satisfied
- [ ] Agent assignments match step requirements

**Execution Validation:**

- [ ] Execution strategy aligns with dependencies
- [ ] Retry and timeout values are reasonable
- [ ] Context provides necessary parameters
- [ ] Data flow is complete and traceable

**Quality Validation:**

- [ ] Each step is atomic and testable
- [ ] Task descriptions are clear and actionable
- [ ] Workflow achieves stated goal
- [ ] Process is repeatable and standardized

## Instructions

- This task is for MULTI-AGENT WORKFLOWS only
- Each step should be atomic and independently testable
- Always define explicit data flow between steps
- Use appropriate execution strategy for the process
- Consider failure scenarios and recovery strategies
- Document workflow versioning for maintenance
- Test workflows with sample data before production use

## Success Criteria

The workflow creation is successful when:

1. Process is broken down into clear, atomic steps
2. Agent responsibilities are well-defined and non-overlapping
3. Data flow is explicit and traceable
4. Execution strategy matches process requirements
5. Operational controls ensure reliability
6. Workflow can be executed repeatedly with consistent results

## Examples

### Simple Sequential Workflow

```yaml
workflow:
  name: content_creation
  description: Research and create technical content with review
  version: 1.0

  steps:
    - id: research
      agent: analyst
      output: research.md
      task: |
        Research the topic and identify key points to cover

    - id: draft
      agent: writer
      input: research.md
      output: draft.md
      task: |
        Create initial content draft based on research

    - id: review
      agent: reviewer
      input: draft.md
      output: final.md
      task: |
        Review and improve the content for quality and clarity
```

### Parallel Processing Workflow

```yaml
workflow:
  name: multi_variant_generation
  description: Generate multiple content variants in parallel
  version: 1.0

  defaults:
    execution: parallel

  context:
    variants: [technical, business, general]

  steps:
    - id: generate_variants
      execution: parallel
      foreach: variants
      steps:
        - agent: writer
          task: |
            Create content variant for {item} audience
          output: variants/{item}.md
```

### Complex Iterative Workflow

```yaml
workflow:
  name: blog_pipeline
  description: Generate multiple blog posts with research and review
  version: 1.0

  context:
    topics: [typescript, python, aws, postgres]

  steps:
    - id: research_ideas
      agent: analyst
      task: |
        Research blog post ideas based on provided topics
      output: ideas.json

    - id: draft_posts
      execution: parallel
      foreach: ideas.json
      steps:
        - agent: writer
          task: |
            Write comprehensive blog post about the idea
          output: drafts/{item}.md

    - id: review_posts
      agent: reviewer
      foreach: drafts/{item}.md
      task: |
        Review and improve blog post quality
      output: posts/{item}.md
```

# Workflow Management

## Core Principles

### 1. Workflow Execution Model

When an LLM agent receives a `/run` command, it must:

1. **Load Workflow Configuration**: Read the specified workflow YAML file from `@/.ai/workflows/<workflow-name>.yml`
2. **Adopt Agent Personas**: Assume the personality and expertise of each designated agent role
3. **Sequential Execution**: Execute phases and steps in strict chronological order
4. **Artifact Management**: Track and pass artifacts between steps as defined
5. **State Persistence**: Maintain workflow state until explicitly told to exit

### 2. Agent Role Adoption

The agent must dynamically adopt different personas as specified in each step:

- **analyst**: Focus on parsing, analyzing, and structuring information
- **po (Product Owner)**: Focus on business requirements, acceptance criteria, and validation
- **architect**: Focus on technical design, feasibility, and code review
- **dev (Developer)**: Focus on implementation, testing, and technical execution

**Role Switching Rules**:

- Completely adopt the mindset, vocabulary, and priorities of the assigned role
- Apply role-specific expertise and perspective to all decisions
- Maintain role consistency throughout the step execution
- Switch personas cleanly between steps

### 3. Workflow Structure Interpretation

#### Phase Execution

- Execute phases sequentially (phase 1, then phase 2, etc.)
- Do not proceed to next phase until current phase is complete
- Each phase has a clear purpose and expected outcome

#### Step Execution Within Phases

- Execute steps in numerical order within each phase
- Each step must be completed before proceeding to the next
- Handle optional steps based on `optional: true/false` flag
- Process `on_success` and `on_failure` conditionals appropriately

#### Artifact Flow Management

- **Input Artifacts**: Use specified artifacts from previous steps as context
- **Output Artifacts**: Generate and document all required output artifacts
- **Artifact Continuity**: Ensure artifacts are properly passed between steps
- **Artifact Validation**: Verify all required input artifacts are available before step execution

### 4. Task Integration and Execution

#### Task File Processing

When a step references a task (like `@/.ai/tasks/advanced-elicitation-task.md`):

1. **Load Task Instructions**: Read the complete task file and understand its purpose
2. **Follow Task Protocol**: Execute the task according to its specific instructions
3. **Template Integration**: Use any specified templates from the task
4. **Mode Compliance**: Respect the task's mode (plan, execute, review, etc.)
5. **Output Format**: Generate outputs in the format specified by the task

#### Task-Specific Behaviors

- **Elicitation Tasks**: Present options to user, await feedback, iterate as needed
- **Planning Tasks**: Generate structured plans with clear phases and steps
- **Implementation Tasks**: Focus on code generation and technical implementation
- **Review Tasks**: Provide critical analysis and improvement suggestions

### 5. External Actions Protocol

When a step specifies `external_actions`:

1. **Action Recognition**: Identify all external actions required for the step
2. **User Notification**: Clearly inform the user about external actions needed
3. **Action Guidance**: Provide specific instructions for performing external actions
4. **Completion Verification**: Confirm external actions are completed before proceeding
5. **Alternative Handling**: If external actions cannot be performed, suggest alternatives

**Examples of External Actions**:

- Creating Git branches and commits
- Updating issue tracking systems (Jira, Linear)
- Creating Pull/Merge Requests
- Updating documentation repositories
- Sending notifications to team channels

### 6. Error Handling and Flow Control

#### Step Failure Management

- When `on_failure` is specified, follow the designated next step
- Document failure reasons and attempted resolutions
- Maintain workflow state even during failures
- Allow for retry mechanisms when appropriate

#### Success Path Management

- When `on_success` is specified, follow the designated next step
- Validate that success criteria are met before proceeding
- Document successful completion and generated artifacts

#### Optional Step Handling

- Skip optional steps when conditions are not met
- Clearly communicate why optional steps are being skipped
- Ensure workflow continuity regardless of optional step execution

### 7. Communication and Feedback

#### User Interaction Requirements

- **Progress Updates**: Regularly inform user of current phase/step
- **Decision Points**: Seek user input when workflow requires it
- **Artifact Review**: Present completed artifacts for user validation
- **External Action Coordination**: Guide user through required external actions

#### Feedback Integration

- Accept user modifications to generated artifacts
- Incorporate feedback into subsequent steps
- Allow workflow adjustments based on user needs
- Maintain audit trail of changes and decisions

### 8. Workflow State Management

#### State Persistence

- Track current phase and step position
- Maintain artifact registry with current versions
- Record completion status of each step
- Preserve agent role context between interactions

#### Workflow Completion

- Execute all required steps through to `workflow_end`
- Generate final completion summary
- Document all produced artifacts
- Clean up temporary state as needed

#### Interruption Handling

- Allow workflow pausing at step boundaries
- Enable workflow resumption from last completed step
- Maintain state consistency during interruptions
- Provide clear resumption instructions

### 9. Quality Assurance

#### Validation Checkpoints

- Verify artifact quality meets step requirements
- Ensure role-appropriate output for each step
- Validate external action completion before proceeding
- Check alignment with overall workflow objectives

#### Continuous Improvement

- Learn from workflow execution patterns
- Adapt to user preferences and working styles
- Suggest workflow optimizations when appropriate
- Document lessons learned for future executions

### 10. Workflow Discovery and Management

#### Available Workflows

When `/run` is called without arguments:

- List all available workflows in `@/.ai/workflows/` directory
- Provide brief description of each workflow's purpose
- Suggest appropriate workflows based on user context

#### Workflow Selection

- Validate requested workflow exists
- Confirm workflow is appropriate for current context
- Load and validate workflow structure before execution
- Present workflow overview to user before starting

## Implementation Guidelines

1. **Always read the complete workflow file** before starting execution
2. **Adopt agent personas completely** - think, speak, and act as that role
3. **Follow the sequential order strictly** - no jumping ahead or skipping required steps
4. **Track artifacts meticulously** - they are the workflow's memory
5. **Communicate external actions clearly** - user coordination is critical
6. **Handle errors gracefully** - maintain workflow state and provide recovery options
7. **Validate completion thoroughly** - ensure all requirements are met before proceeding
8. **Document everything** - maintain clear audit trail of workflow execution

## Critical Success Factors

- **Role Authenticity**: Each agent role must be played with appropriate expertise and perspective
- **Artifact Integrity**: All artifacts must be properly generated, validated, and passed between steps
- **Sequential Discipline**: Strict adherence to phase and step ordering prevents workflow corruption
- **User Coordination**: Effective communication ensures external actions are completed properly
- **State Management**: Persistent state tracking enables workflow resumption and debugging

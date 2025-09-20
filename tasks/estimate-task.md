---
title: Estimate Task
type: task
mode: think
---

## Purpose

Analyze Linear tasks and provide consistent, accurate story point estimates based on complexity, scope, technical risk, and effort required

## Workflow

### 1. Gather task Information

- Read the task description, acceptance criteria, and developer comments
- Identify the task type (bug fix, feature addition, integration, etc.)
- Understand the technical scope and business impact
- Note any dependencies, unknowns, or risk factors

### 2. Apply Estimation Framework

Use the Fibonacci sequence for story point scale to assess complexity:

#### 1 Point - Trivial

**Time**: 1-4 hours
**Characteristics**:

- Simple text/UI changes (grammar fixes, label updates)
- Minor styling adjustments
- Single-file changes with clear scope
- No complex business logic
- Low risk, well-understood requirements

#### 2 Points - Simple

**Time**: 4-8 hours
**Characteristics**:

- Single feature additions with clear requirements
- Bug fixes requiring investigation + solution
- Database queries/data manipulation
- Frontend component modifications
- Some testing required

#### 3 Points - Standard

**Time**: 1-2 days
**Characteristics**:

- Multi-component changes
- Integration between systems
- New feature implementation
- Requires some research/investigation
- Multiple acceptance criteria
- Backend + Frontend changes

#### 5 Points - Complex

**Time**: 3-4 days
**Characteristics**:

- Complex business logic implementation
- Multi-system integration
- Data model changes with migrations
- Significant research/design required
- Multiple stakeholders involved
- High technical complexity or risk

#### 8 Points - Very Complex

**Time**: 1 week
**Characteristics**:

- Large feature development
- System architecture changes
- Multiple integration points
- High uncertainty/unknowns
- Significant testing required
- Cross-team coordination needed

#### 13 Points - Epic/Extremely Complex

**Time**: 2+ weeks
**Characteristics**:

- Major system overhauls
- Multiple epic coordination
- Architectural refactoring
- High uncertainty with research spikes needed
- Multiple team coordination required
- Should typically be broken down into smaller tasks

### 3. Decision Tree Process

Execute these steps in order:

#### Step 1: Scope Assessment

- **Single file/component?** → Consider 1-2 points
- **Multiple components/systems?** → Consider 3+ points
- **New feature vs bug fix?** → New features typically +1 point
- **Database changes required?** → Add +1 point for migrations/schema

#### Step 1.5: Feature Wholeness Assessment

- **Complete feature in one task?** → Estimate normally
- **Feature split across tasks?** → Estimate each part based on its actual complexity:
  - Frontend portion: Focus on UI components, state management, and user interactions
  - Backend portion: Focus on business logic, data models, APIs, and database changes
  - Do NOT add artificial coordination overhead - estimate the actual work required
- **Related tasks exist?** → Review total feature complexity to ensure parts sum to reasonable whole

#### Step 2: Technical Complexity

- **Simple CRUD operations?** → 1-2 points
- **Business logic required?** → 3+ points
- **Integration with external systems?** → 3+ points
- **Complex algorithms/calculations?** → 5+ points

#### Step 3: Risk & Uncertainty Factors

- **Clear, well-defined requirements?** → No adjustment
- **Ambiguous or research required?** → +1-2 points
- **Involves unfamiliar technology?** → +1 point
- **Cross-team dependencies?** → +1 point

#### Step 4: Testing & Quality Requirements

- **Unit tests only?** → No adjustment
- **Integration testing required?** → +1 point
- **Customer-facing/critical path?** → +1 point
- **Security implications?** → +1 point

### 4. Task Type Pattern Matching

Apply these common patterns:

#### Bug Fixes

- **UI/Text tasks**: 1 point
- **Data display problems**: 1-2 points
- **Logic/calculation errors**: 2-3 points
- **Integration failures**: 3-5 points
- **Performance/security tasks**: 3-8 points

#### Feature Additions

- **Simple UI additions**: 1-2 points
- **New endpoints/APIs**: 2-3 points
- **Complex business features**: 3-5 points
- **System integrations**: 5-8 points

#### Data Operations

- **Data export/backup**: 2 points
- **Data migration/cleanup**: 2-3 points
- **Complex data processing**: 3-5 points

#### IoT/Hardware Integration

- **Device setup/configuration**: 3 points
- **Communication protocols**: 3-5 points
- **Data processing pipelines**: 5 points
- **Multi-packet assembly**: 5-8 points

#### Split Feature Tasks

- **Frontend-only portion**: Estimate based on UI complexity, components, and interactions (typically 2-3 points for standard features)
- **Backend-only portion**: Estimate based on business logic, data models, APIs, and database changes (typically 3-5 points for standard features)
- **Multiple endpoints + new DB tables**: 5 points (complex backend work)
- **Validation rule**: Split tasks should sum to reasonable total without artificial overhead

### 5. Generate Estimation Report

Provide a structured response including:

- **Task Summary**: Brief description of what needs to be implemented
- **Estimated Points**: Final story point estimate
- **Reasoning**: Explanation of factors that influenced the estimate
- **Risk Factors**: Any uncertainties or dependencies identified
- **Recommendations**: Suggestions for reducing complexity or risk if applicable

### 6. Quality Validation

Before finalizing, verify:

- [ ] Acceptance criteria count considered
- [ ] Dependencies on external teams/systems identified
- [ ] Unknown technical challenges flagged
- [ ] Customer impact level assessed
- [ ] Testing complexity requirements evaluated
- [ ] If task is part of split feature, total estimates reviewed for consistency
- [ ] Coordination overhead between related tasks considered
- [ ] Integration complexity between frontend/backend accounted for

## Instructions

- If the task belongs to a task manager (i.e. Linear or Jira) then update the task with the estimated points and add a comment explaining your reasoning.
- **Focus on complexity and effort**, not just time
- Consider the full development lifecycle (code, test, deploy)
- Account for uncertainty and technical debt
- Be consistent with similar tasks in the project
- When in doubt, estimate higher to account for unknowns

## Anti-Patterns to Avoid

- Don't estimate based solely on time
- Don't underestimate integration complexity
- Don't forget about testing effort
- Don't ignore technical debt implications
- Don't assume perfect requirements understanding

## Output

Structure your response as:

```
## Task Estimation: [Task Title]

**Story Points**: [1/2/3/5/8] points

**Reasoning**:
- [Factor 1 that influenced estimate]
- [Factor 2 that influenced estimate]
- [Additional considerations]
```

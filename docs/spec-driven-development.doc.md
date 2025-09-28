# Spec-Driven Development Workflow

## Introduction to Spec-Driven Design

Spec-driven design is a methodology that prioritizes explicit specification before implementation, addressing the critical problem of **prompt-to-code drift** where AI-generated code doesn't align with actual business requirements.

### The Problem

Traditional AI-assisted development often follows this problematic pattern:

1. Developer provides high-level prompt
2. AI generates plausible-looking code
3. Code doesn't match real business needs
4. Results in spaghetti code or misaligned features

### The Solution

Spec-driven design acts as a guardrail system:

- **Makes intent explicit** - Reduces misunderstanding
- **Adds validation checkpoints** - Prevents skipping ahead
- **Provides living artifacts** - Creates source of truth
- **Ensures traceability** - Code maps back to requirements

Think of it as **Test-Driven Development (TDD) at the specification level**.

## Workflow Overview

Our spec-driven workflow consists of four gated phases, each with validation checkpoints:

```
SPECIFY → PLAN → REVIEW → IMPLEMENT
   ↓        ↓       ↓        ↓
 Gate 1  Gate 2  Gate 3   Gate 4
```

Each gate prevents progression until validation criteria are met, ensuring no phase is skipped or rushed.

**Key Enhancement:** Uses your existing single implementation plan document with feedback blocks for structured iteration.

## Phase 1: SPECIFY

### Purpose

Define **WHAT** we're building and **WHY**, establishing clear requirements and success criteria without diving into implementation details.

### Key Activities

- Requirements elicitation and documentation
- Stakeholder alignment on goals and constraints
- Acceptance criteria definition
- Success metrics identification

### Artifacts Created

- `implementation-plan.md` with objectives and context only
- Feedback blocks positioned for detailed planning phase

### Tools & Commands

- `/spec:specify` - Create initial specification with objectives only
- Uses existing `create-implementation-plan-task.md` in Specify Mode

### Gate 1 Validation (Specify → Plan)

- High-level objective clearly defined
- Mid-level objectives (requirements) listed
- Technical context documented
- Success criteria established
- Feedback blocks ready for planning phase

## Phase 2: PLAN

### Purpose

Define **HOW** we'll build the solution—architecture, tech stack, and detailed implementation approach with phases and steps.

### Key Activities

- Process feedback blocks from Specify phase
- Technical architecture decisions
- Implementation phases breakdown
- Detailed steps with file-level actions

### Artifacts Created

- Complete `implementation-plan.md` with Implementation Notes
- Feedback blocks marked as ADDRESSED

### Tools & Commands

- `/spec:plan [plan_file]` - Complete implementation plan with phases/steps
- If file provided: Process existing spec and add implementation details
- If no file: Create new complete implementation plan from scratch
- Uses existing `create-implementation-plan-task.md` in Plan Mode

### Gate 2 Validation (Plan → Review)

- All OPEN feedback blocks processed
- Architecture decisions documented with justification
- Implementation phases defined as self-contained units
- Steps specify exact file changes with action verbs
- Plan maintains traceability to original objectives

## Phase 3: REVIEW

### Purpose

Systematic iteration and refinement of the implementation plan through structured feedback processing.

### Key Activities

- Review implementation plan for gaps and improvements
- Process new feedback and concerns
- Validate technical approach against constraints
- Refine phases and steps based on insights

### Artifacts Created

- Updated `implementation-plan.md` with refinements
- New feedback blocks for unresolved issues
- RESOLVED feedback blocks for incorporated changes

### Tools & Commands

- `/spec:review [plan_file]` - Systematic review and iteration of implementation plan
- Processes existing feedback blocks and adds new ones
- Updates plan content based on review findings
- Uses existing `create-implementation-plan-task.md` in Review Mode

### Gate 3 Validation (Review → Implement)

- Critical feedback addressed and incorporated
- Implementation approach validated against requirements
- Phases remain self-contained and non-breaking
- Plan quality meets execution standards
- All OPEN issues either resolved or acknowledged

## Phase 4: IMPLEMENT

### Purpose

Execute tasks while maintaining alignment to the original specification through continuous validation.

### Key Activities

- Code implementation following task specifications
- Continuous validation against spec requirements
- Test-driven development aligned with acceptance criteria
- Documentation and knowledge capture

### Artifacts Created

- Production code implementing the specification
- Comprehensive test suites validating requirements
- Implementation documentation
- Deployment and operational guides

### Tools & Commands

- `/spec:implement [plan_file]` - Execute implementation plan with validation
- Uses existing `execute-implementation-plan-task.md`

### Gate 4 Validation (Implementation)

- Code meets all acceptance criteria from spec
- Tests validate spec requirements (not just code)
- No architectural drift from approved plan
- Implementation maintains traceability to original requirements
- Documentation reflects actual implementation

## Validation Framework

### Gate Checkpoints

Each gate uses systematic validation to prevent progression without proper completion:

**Gate Structure:**

```
Current Phase - Validation Checklist - Next Phase
```

**Validation Types:**

- **Requirements Validation** - Does it meet the spec?
- **Technical Validation** - Is it architecturally sound?
- **Traceability Validation** - Can we trace back to original requirements?
- **Quality Validation** - Does it meet our standards?

## Command Reference

### Core Workflow Commands

| Command           | Purpose                                           | Phase     | Output                            |
| ----------------- | ------------------------------------------------- | --------- | --------------------------------- |
| `/spec:specify`   | Create initial specification with objectives only | Specify   | implementation-plan.md (partial)  |
| `/spec:plan`      | Complete implementation plan with phases/steps    | Plan      | implementation-plan.md (complete) |
| `/spec:review`    | Systematic review and iteration of plan           | Review    | implementation-plan.md (refined)  |
| `/spec:implement` | Execute implementation plan with validation       | Implement | Code, tests, docs                 |

### Command Details

**`/spec:specify [task_description]`**

- Creates implementation plan with only High-Level Objective, Mid-Level Objectives, Context, and Success Criteria
- Leaves feedback blocks as OPEN for detailed planning phase
- Uses existing `create-implementation-plan-task.md` in Specify Mode

**`/spec:plan [plan_file] [extra_instructions]`**

- If file provided: Processes existing spec and adds Implementation Notes
- If no file: Creates complete implementation plan from scratch
- Processes OPEN feedback blocks and marks as ADDRESSED
- Uses existing `create-implementation-plan-task.md` in Plan Mode

**`/spec:review [plan_file] [extra_instructions]`**

- Systematic review of existing implementation plan
- Adds new feedback blocks based on review findings
- Updates plan content with improvements
- Marks incorporated feedback as RESOLVED

**`/spec:implement [plan_file] [extra_instructions]`**

- Executes implementation plan with validation
- Uses existing `execute-implementation-plan-task.md`
- Maintains traceability to original plan

## Best Practices

### Specification Best Practices

1. **Be Specific and Measurable** - Avoid ambiguous language
2. **Include Negative Cases** - What should NOT happen
3. **Define Success Criteria** - How do we know it's done?
4. **Document Constraints** - Technical and business limitations
5. **Get Stakeholder Sign-off** - Formal approval before proceeding

### Planning Best Practices

1. **Justify Architecture Decisions** - Document the "why" behind choices
2. **Assess Risks Early** - Identify and plan for potential issues
3. **Validate Against Requirements** - Ensure technical plan meets spec
4. **Consider Alternatives** - Document options considered and rejected
5. **Plan for Testing** - How will we validate the implementation?

### Task Management Best Practices

1. **Keep Tasks Atomic** - Each task should be independently completable
2. **Maintain Traceability** - Every task maps to spec requirements
3. **Define Clear Success Criteria** - How do we know the task is done?
4. **Estimate Realistically** - Base estimates on historical data
5. **Plan Dependencies** - Understand task ordering and relationships

### Implementation Best Practices

1. **Validate Continuously** - Check against spec regularly
2. **Test Against Requirements** - Not just code coverage
3. **Document Decisions** - Capture implementation choices
4. **Maintain Quality** - Don't compromise standards for speed
5. **Communicate Changes** - Any deviation needs stakeholder approval

## Common Anti-Patterns to Avoid

### Specification Anti-Patterns

- **Premature Planning** - Starting architecture before requirements are clear
- **Scope Creep** - Adding features not in original spec
- **Ambiguous Requirements** - Vague or untestable specifications
- **Stakeholder Bypass** - Proceeding without proper approval

### Planning Anti-Patterns

- **Over-Engineering** - Building more complexity than needed
- **Technology Bias** - Choosing tools before understanding requirements
- **Risk Ignorance** - Not considering what could go wrong
- **Architecture Drift** - Changing approach without updating plans

### Implementation Anti-Patterns

- **Spec Drift** - Implementing features not in specification
- **Testing Neglect** - Not validating against acceptance criteria
- **Documentation Debt** - Not updating docs to match implementation
- **Quality Shortcuts** - Compromising standards to meet deadlines

# .ai framework

This repository captures reusable prompts, personas, and workflow tooling for Codex-style assistants. Use it as the hub for configuring agent behavior, generating documentation, and speeding up recurring tasks.

## Directory Structure

The workspace is organized into the following key directories:

```plain
<root>/
├── AGENTS.md                # System overview and agent descriptions
├── personas/                # Agent persona definitions (YAML)
├── tasks/                   # Task definitions and workflows
├── templates/               # Document templates for generation
└── utils/                   # Utility scripts and tools
```

## Personas

The AI agents' behavior is determined by personas. Each persona in the `personas/` directory is a YAML file that defines a specific role.

Each persona is defined in YAML format with:

- Agent identity and role
- Core principles and focus areas
- Available tasks and dependencies
- Startup instructions and behavior

Examples of available personas include:

- `analyst`: A business analyst for brainstorming, research, and analysis.
- `architect`: A software architect for designing system architecture.
- `dev`: A full-stack developer for implementing user stories.
- `devops`: A DevOps engineer for managing infrastructure and deployments.
- `po`: A product owner for managing the product backlog and user stories.
- `qa`: A quality assurance engineer for testing and ensuring quality.
- `ux-expert`: A UX expert for designing user experiences.
- `writer`: A technical writer for creating documentation.

## Tasks

The `tasks/` directory contains Markdown files that provide step-by-step instructions for the AI agents.

Tasks follow a structured workflow:

1. Purpose definition
2. Step-by-step execution guide
3. Success criteria validation
4. Output formatting requirements

## Templates

The `templates/` directory holds templates for generating various documents. This ensures that the AI agents produce consistent and well-structured output.

## Utilities

### claude-plus.sh

Shell script wrapper for enhanced Claude AI interactions with additional functionality and configuration management.

## Configuration

The system uses template-driven document generation with:

- Placeholder replacement (`{{variable}}`)
- Conditional content (`^^CONDITION^^`)
- Repeatable sections (`<<REPEAT>>`)
- Embedded AI instructions (`[[LLM: instruction]]`)

## Workflow

The intended workflow for this multi-agent system is as follows:

1.  **Story Creation:** A user provides a high-level goal. A persona like the Product Owner (`po`) or Analyst (`analyst`) refines this goal into a structured user story using the `story.tmp.md` template.
2.  **Implementation:** The Developer (`dev`) persona takes the user story and implements it, following the instructions in the relevant task files (e.g., `execute-implementation-plan-task.md`).
3.  **Review and Deployment:** Other personas like the QA (`qa`) and DevOps (`devops`) engineers can be involved in reviewing, testing, and deploying the implemented feature.

## Usage

To use this AI workspace, you can leverage the personas and tasks to automate your development workflow. The system is designed to be extensible, so you can add new personas, tasks, and templates to suit your needs.

## Contributing

When adding new personas, tasks, or templates:

1. Follow existing naming conventions
2. Include comprehensive documentation
3. Define clear success criteria
4. Test with realistic scenarios
5. Update this README with new capabilities

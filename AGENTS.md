# AGENTS MEMORY

## Directory Overview

This directory contains the configuration for a multi-agent AI system. It defines the personas of different AI agents, the tasks they can perform, and templates for their work. The system is designed to automate various tasks, including software development, by having AI agents collaborate on user stories.

## Key Files

- `personas/`: This directory contains YAML files that define the different AI agent personas. Each file specifies the agent's name, role, personality, and capabilities.

  - `analyst.yml`: Defines the "Business Analyst" persona, responsible for brainstorming, research, and analysis.
  - `dev.yml`: Defines the "Full Stack Developer" persona, responsible for implementing user stories.
  - Other files in this directory define other personas like `architect.yml`, `devops.yml`, `po.yml`, `qa.yml`, `ux-expert.yml`, and `writer.yml`.

- `tasks/`: This directory contains Markdown files that define the tasks the AI agents can perform. These tasks are referenced in the persona files.

  - `brainstorming-task.md`: A detailed guide for the "analyst" persona on how to conduct a brainstorming session.
  - `execute-implementation-plan-task.md`: A guide for the "dev" persona on how to execute a development plan.

- `templates/`: This directory contains templates for the documents the AI agents create.

  - `story.tmp.md`: A template for creating user stories, which are then implemented by the "dev" persona.
  - Other files in this directory provide templates for API documentation, architecture, implementation plans, merge requests, and more.

- `utils/`: This directory contains utility scripts.
  - `claude-plus.sh`: A shell script wrapper for Claude AI model.

## Usage

This directory is used to configure and run a multi-agent AI system. The system is likely used for software development and other tasks by defining personas and tasks, and then having the agents execute those tasks based on user stories and other inputs. The general workflow appears to be:

1.  A user provides a high-level goal or story.
2.  The "analyst" or "po" (Product Owner) persona helps to refine the goal into a structured story using the `story.tmp.md` template.
3.  The "dev" persona takes the story and implements it, following the instructions in the `execute-implementation-plan-task.md` and other relevant tasks.
4.  Other personas like "qa" and "devops" might be involved in testing and deployment.

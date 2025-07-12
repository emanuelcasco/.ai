# AI Personas Framework - Research Project

> A structured methodology for AI-assisted development using specialized personas and modular guidelines, inspired by the [BMAD-METHOD](https://github.com/bmadcode/BMAD-METHOD).

[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)

## 🎯 What is AI Personas Framework?

The AI Personas Framework transforms how you work with AI assistants by providing **role-based expertise**, **consistent workflows**, and **modular guidelines**. Instead of repeating instructions or getting inconsistent responses, you get specialized AI personas that understand their roles and follow established patterns.

### Key Benefits

- **🎭 Role Specialization** - Switch between developer, architect, writer, and analyst personas
- **📋 Workflow Automation** - Execute complete development workflows with single commands
- **📚 Modular Guidelines** - Load only relevant coding standards per technology stack
- **💾 Project Memory** - AI learns and adapts to your specific project needs
- **🔄 Consistent Quality** - Standardized approaches across all tasks and team members

## 🚀 Quick Start

### Prerequisites

- Claude AI assistant (Anthropic)
- Git repository for your project
- Basic understanding of your development workflow

### Installation

1. **Clone or download** this framework to your project:

   ```bash
   git clone https://github.com/emanuelcasco/.ai
   cd .ai
   ```

2. **Customize for your project** - Edit the files in `/data` to match your preferences:

   ```bash
   # Edit project-specific preferences
   vim data/technical-preferences.md
   ```

3. **Start using personas** with Claude:

   ```bash
   # Activate a developer persona
   /be personas/dev.yml

   # Or run a complete workflow
   /run workflows/implement-task.yml
   ```

### First Steps

1. **Try a persona**: `/be personas/writer.yml` - "Help me write better documentation"
2. **Run a workflow**: `/run workflows/implement-task.yml` - "Add user authentication"
3. **Customize guidelines**: Edit `docs/` files to match your coding standards

## 📁 Project Structure

```
ai-personas/
├── 📚 docs/                          # Technical Guidelines
│   ├── general-technical-guidelines.md  # Universal coding principles
│   ├── typescript-guidelines.md         # TypeScript best practices
│   ├── react-guidelines.md             # React patterns
│   ├── testing-guidelines.md           # Testing methodologies
│   └── documentation-guidelines.md     # Documentation standards
│
├── 🎭 personas/                       # AI Role Definitions
│   ├── dev.yml                        # Developer persona
│   ├── architect.yml                  # System architect
│   ├── writer.yml                     # Technical writer
│   └── analyst.yml                    # Requirements analyst
│
├── 🔄 workflows/                      # Complete Task Workflows
│   ├── implement-task.yml             # Full development cycle
│   ├── create-documentation.yml       # Documentation generation
│   └── code-review.yml               # Review process
│
├── 💾 data/                          # Project Memory & Customization
│   └── technical-preferences.md       # Project-specific settings
│
└── 📋 CLAUDE.md                      # AI Assistant Index
```

## 🎭 Working with Personas

Personas provide specialized expertise for different aspects of development:

### Core Development Personas

```bash
# 👨‍💻 Developer - Implementation & code quality
/be personas/dev.yml Implement user authentication with JWT tokens

# 🏗️ Architect - System design & technical decisions
/be architect # will read personas/architect.yml

# 🔍 Analyst - Requirements & planning
/be analyst.yml Analyze this feature request and identify missing requirements
```

### Why Use Personas?

- **Consistent Expertise** - Each persona follows specific guidelines and approaches
- **Context Switching** - Clean transitions between different types of work
- **Quality Assurance** - Built-in best practices and validation steps
- **Team Alignment** - Shared understanding of roles and responsibilities

## 🔄 Automated Workflows

Execute complete development processes with single commands:

### Available Workflows

```bash
# Complete feature implementation (analysis → design → code → review)
/run implement-task Add user profile editing functionality

# Documentation creation with proper structure
/run create-documentation Generate API documentation for the payment service

# Comprehensive code review process
/run code-review Review this merge request for the authentication module
```

### Workflow Benefits

- **End-to-End Automation** - Complete processes, not just individual tasks
- **Quality Gates** - Built-in checkpoints and validation steps
- **Consistent Outputs** - Standardized deliverables every time
- **Time Savings** - No need to remember complex multi-step processes

## 📚 Modular Guidelines System

The framework loads relevant guidelines based on your technology stack:

### How It Works

```markdown
Request: "Fix this TypeScript React component"
→ Automatically loads:
✓ general-technical-guidelines.md (universal principles)
✓ typescript-guidelines.md (type safety, patterns)  
 ✓ react-guidelines.md (component best practices)
✓ technical-preferences.md (project-specific rules)
```

### Available Guidelines

- **🌐 General** - Universal coding principles, naming conventions, function design
- **📘 TypeScript** - Type safety, imports, immutability, RO-RO patterns
- **⚛️ React** - Components, hooks, JSX, state management
- **🧪 Testing** - Jest patterns, mocking, E2E testing, coverage
- **📖 Documentation** - README structure, API docs, architecture guides

## 🛠️ Practical Examples

### Feature Development Workflow

```bash
# 1. Analyze requirements
/be analyst "Analyze this user story: 'As a user, I want to reset my password'"

# 2. Design architecture
/be architect "Design the password reset flow including security considerations"

# 3. Implement solution
/be dev "Implement the password reset functionality following the architectural plan"

# OR use the complete automated workflow
/run implement-task "Implement password reset functionality"
```

### Code Review Process

```bash
# Review from different perspectives
/be architect "Review this merge request focusing on architectural patterns and scalability"

/be dev "Review this code for TypeScript best practices and test coverage"
```

### Documentation Creation

```bash
# Generate comprehensive documentation
/be writer Create user guide for the new dashboard features

/run create-documentation Generate complete API documentation for the user management service
```

## 🎛️ Customization

### Project-Specific Configuration

Edit `data/technical-preferences.md` to customize:

- **Git workflows** - Branch naming, commit messages, merge request format
- **Code standards** - Linting rules, formatting preferences
- **Team processes** - Review requirements, communication channels
- **Development tools** - Preferred CLI commands, project structure

### Adding New Personas

Create new personas by adding YAML files to `personas/`:

```yaml
# personas/qa-engineer.yml
agent:
  name: "Alex"
  title: "QA Engineer"
  role: "Quality Assurance & Testing Specialist"

persona:
  focus: "Test planning, automation, quality gates"
  guidelines:
    - "./docs/testing-guidelines.md"
    - "./docs/general-technical-guidelines.md"
```

## 🙏 Acknowledgments

This framework is inspired by the [BMAD-METHOD](https://github.com/bmadcode/BMAD-METHOD) approach to AI-assisted development, adapting its core principles:

- **Agent Specialization** - Role-based AI interactions
- **Clean Handoffs** - Fresh context between different tasks
- **Document Organization** - Structured, modular guidelines
- **Iterative Development** - Systematic, step-by-step approach

## 📞 Support

- **Issues**: [GitHub Issues](https://github.com/emanuelcasco/.ai/issues)
- **Discussions**: [GitHub Discussions](https://github.com/emanuelcasco/.ai/discussions)

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

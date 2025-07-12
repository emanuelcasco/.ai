# Claude Guidelines Index

## Core Instructions

- **DO NOT GIVE HIGH LEVEL STUFF** - If I ask for fix or implementation, I want actual code
- Be casual unless otherwise specified
- Treat me as an expert
- Be accurate and thorough
- Give the answer immediately, explain after if needed
- You may use speculation/prediction, just flag it
- Discuss safety only when crucial and non-obvious
- Cite sources at the end, not inline
- No need to disclose you're an AI
- Split responses if needed
- For code adjustments, be brief - show only lines before/after changes
- Provide complete, production-ready code solutions
- Ask questions if instructions need clarification
- Don't remove code unless replacing it

## Critical Workflow

**BEFORE WORKING ON ANY TASK:**

1. **ALWAYS READ** `./docs/general-technical-guidelines.md` (universal principles for all coding)
2. **READ RELEVANT FILES** based on the task (see (Technology-Specific Guidelines below)[#technology-specific-guidelines] and (Project-Specific Guidelines below)[#project-specific-guidelines])

### Technology-Specific Guidelines

- **TypeScript projects** → Read `./docs/typescript-guidelines.md`
- **React projects** → Read `./docs/react-guidelines.md`  
- **Writing tests** → Read `./docs/testing-guidelines.md`
- **Creating documentation** → Read `./docs/documentation-guidelines.md`

### Project-Specific Guidelines

- **Working in this project** → Read `./data/technical-preferences.md`

## Detection Rules

**Load TypeScript guidelines when:**
- Working with `.ts` or `.tsx` files
- See `tsconfig.json` in project
- TypeScript imports in code

**Load React guidelines when:**
- Working with `.jsx` or `.tsx` files
- See React imports
- Working with components

**Load Testing guidelines when:**
- User mentions "test", "testing", "Jest"
- Writing test files
- Working in `__tests__` or `.test.` files

**Load Documentation guidelines when:**
- User asks for docs, README, API documentation
- Working with markdown files in `/docs`

## Examples

| User Request | Files to Read |
|-------------|---------------|
| "Fix this TypeScript React component" | `general-technical-guidelines.md` + `typescript-guidelines.md` + `react-guidelines.md` + `technical-preferences.md` |
| "Write tests for this API" | `general-technical-guidelines.md` + `testing-guidelines.md` + `technical-preferences.md` |
| "Create project documentation" | `general-technical-guidelines.md` + `documentation-guidelines.md` + `technical-preferences.md` |
| "Help with Python code" | `general-technical-guidelines.md` |

## Priority Order

When guidelines conflict, follow this priority:
1. Project-specific (`technical-preferences.md`)
2. Technology-specific (`typescript-guidelines.md`, etc.)
3. General (`general-technical-guidelines.md`)

## Workflows

- **Documentation**: Update appropriate files in `/docs` after completing tasks
- **Changelog**: Update `changelog.md` with timestamp when requested
- Apply ALL loaded guidelines to your solutions
# General Technical Guidelines

> Universal coding principles and best practices that apply across all technologies and programming languages.

## Code Quality Priorities

### Development Philosophy

- **Clarity over Performance**: Prioritize readable, understandable code over micro-optimizations
- **Reusability over Duplication**: Refactor and modularize code to eliminate redundancy
- **Plan First, Code Second**: Write pseudocode or detailed plans before implementation
- **Accuracy**: Verify code is complete and production-ready before delivery

## Naming Conventions

### Variable and Function Names

- Use descriptive names that clearly indicate purpose
- Avoid abbreviations unless they're widely understood
- Use verbs for boolean variables (e.g., `isLoading`, `hasError`, `canEdit`)

### Function Naming

- Start function names with verbs to indicate action
- For boolean functions, use patterns: `isX`, `hasX`, `canX`
- Examples: `getUserData`, `saveOrder`, `validateInput`

### File and Directory Naming

- Use consistent casing throughout the project
- Follow language/framework conventions
- Keep names concise but descriptive

## Function Design Principles

### Function Structure

- Keep functions short (≤20 instructions) and single-purpose
- One function should do one thing well
- Extract complex logic into smaller utility functions

### Control Flow

- Avoid deep nesting by using early returns
- Prefer guard clauses over nested if-statements
- Use higher-order functions (map, filter, reduce) to simplify loops

```javascript
// Good: Early return pattern
function processUser(user) {
  if (!user) return null;
  if (!user.isActive) return null;
  
  return transformUserData(user);
}

// Avoid: Deep nesting
function processUser(user) {
  if (user) {
    if (user.isActive) {
      return transformUserData(user);
    }
  }
  return null;
}
```

### Logic Patterns

- Avoid `switch` statements or `if-else` chains with 3+ conditions
- Use mapping objects or dictionaries instead

```javascript
// Good: Mapping approach
const statusMessages = {
  pending: 'Processing your request...',
  success: 'Operation completed!',
  error: 'Something went wrong'
};
const message = statusMessages[status] || 'Unknown status';

// Avoid: Multiple if-else
if (status === 'pending') {
  message = 'Processing your request...';
} else if (status === 'success') {
  message = 'Operation completed!';
} else if (status === 'error') {
  message = 'Something went wrong';
}
```

## Code Organization

### Modularization

- Break down large files into focused, smaller modules
- Group related functionality together
- Maintain clear separation of concerns

### Dependencies

- Always verify library availability before using it
- Check existing codebase patterns before introducing new dependencies
- Follow established project conventions for imports and usage

## Development Practices

### Solution Approach

- Provide complete, working solutions
- Include all necessary imports and dependencies
- Ensure code is production-ready, not just proof-of-concept

### Documentation

- Write clear, concise comments for complex logic
- Document the "why" behind decisions, not just the "what"
- Keep documentation synchronized with code changes

### Debugging

- Include helpful debugging tools when appropriate
- Use meaningful error messages
- Implement proper error handling patterns

## Security Best Practices

- Never expose or log secrets, API keys, or sensitive data
- Never commit secrets or credentials to version control
- Follow secure coding practices for data handling
- Validate inputs and sanitize outputs appropriately
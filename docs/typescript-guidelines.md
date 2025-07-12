# TypeScript Guidelines

> TypeScript-specific conventions and patterns for type-safe, maintainable code.

## Type Declaration Requirements

### Explicit Types

- Always declare explicit types for variables, parameters, and return values
- NEVER use `any` - always declare an explicit type, even if it requires creating a new type definition
- Do not define types inline within function parameters or return types

```typescript
// Good: Explicit types
type UserData = {
  readonly id: string;
  readonly name: string;
  readonly email: string;
};

function processUser(userData: UserData): ProcessedUser {
  return transformUser(userData);
}

// Avoid: Inline types and any
function processUser(userData: any): any {
  return transformUser(userData);
}
```

### Type Organization

- Maintain consistency with existing structure of commented sections
- Use patterns like `ENTITY_TYPES`, `AUXILIARY_TYPES`, `MAPPERS`, etc.
- Place new types within appropriate commented sections
- Avoid declaring code outside established structure

```typescript
// ==========================================
// USER_TYPES
// ==========================================

type User = {
  readonly id: string;
  readonly name: string;
};

type UserCreateRequest = {
  readonly name: string;
  readonly email: string;
};

// ==========================================
// PRODUCT_TYPES  
// ==========================================

type Product = {
  readonly id: string;
  readonly title: string;
};
```

## Import/Export Patterns

### Type Imports

- Always prepend the keyword `type` when importing types
- Ensure clarity and differentiation from value imports

```typescript
// Good: Clear type imports
import { type UserData, type ProductInfo } from './types';
import { processUser, saveProduct } from './services';

// Avoid: Mixed imports without type keyword
import { UserData, ProductInfo, processUser } from './types';
```

## TypeScript Patterns

### Immutability

- Prioritize immutability using `readonly` and `as const`
- Encapsulate primitive types in composite types for clarity

```typescript
// Good: Immutable types
type Config = {
  readonly apiUrl: string;
  readonly timeout: number;
  readonly features: readonly string[];
};

const defaultConfig = {
  apiUrl: 'https://api.example.com',
  timeout: 5000,
  features: ['auth', 'analytics']
} as const;

// Avoid: Mutable types
type Config = {
  apiUrl: string;
  timeout: number;
  features: string[];
};
```

### RO-RO Pattern

- Use the RO-RO (Receive an Object, Return an Object) pattern to reduce parameter complexity
- Simplifies function signatures and improves maintainability

```typescript
// Good: RO-RO pattern
type CreateUserParams = {
  readonly name: string;
  readonly email: string;
  readonly role?: string;
};

type CreateUserResult = {
  readonly user: User;
  readonly success: boolean;
};

function createUser(params: CreateUserParams): CreateUserResult {
  // Implementation
}

// Avoid: Multiple parameters
function createUser(name: string, email: string, role?: string): { user: User; success: boolean } {
  // Implementation
}
```

### Default Parameters

- Avoid null/undefined checks by using default parameter values
- Provide sensible defaults to reduce conditional logic

```typescript
// Good: Default parameters
type ProcessOptions = {
  readonly timeout?: number;
  readonly retries?: number;
};

function processData(
  data: DataInput,
  options: ProcessOptions = {}
): ProcessResult {
  const { timeout = 5000, retries = 3 } = options;
  // Implementation
}

// Avoid: Null checks
function processData(data: DataInput, options?: ProcessOptions): ProcessResult {
  if (!options) {
    options = {};
  }
  if (!options.timeout) {
    options.timeout = 5000;
  }
  // Implementation
}
```

## Function Guidelines

### Arrow Functions

- Use arrow functions for simple inline logic (≤3 lines)
- Use regular functions for complex logic or when function hoisting is needed

```typescript
// Good: Arrow functions for simple operations
const users = userData.map(user => ({ ...user, isActive: true }));

const isValidEmail = (email: string): boolean => 
  /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);

// Good: Regular functions for complex logic
function processComplexData(input: ComplexInput): ComplexOutput {
  // Multi-line implementation
  const step1 = validateInput(input);
  const step2 = transformData(step1);
  return formatOutput(step2);
}
```

### JSDoc Comments

- Write JSDoc comments for all functions, classes, and methods
- Types are handled by TypeScript, so focus on describing purpose and behavior

```typescript
/**
 * Processes user data and returns formatted result
 * Validates input and applies business rules
 */
function processUserData(userData: UserData): ProcessedUser {
  // Implementation
}

/**
 * Utility class for managing user sessions
 * Handles authentication and session persistence
 */
class SessionManager {
  /**
   * Creates a new user session
   * Automatically handles token generation and storage
   */
  createSession(userId: string): SessionResult {
    // Implementation
  }
}
```

## Type Safety Best Practices

### Composite Types

- Encapsulate primitive types in composite types for better type safety
- Use discriminated unions for type variants

```typescript
// Good: Composite types
type UserId = {
  readonly value: string;
};

type EmailAddress = {
  readonly value: string;
};

type ApiResponse<T> = 
  | { readonly success: true; readonly data: T }
  | { readonly success: false; readonly error: string };

// Avoid: Primitive types everywhere
function getUser(id: string): User | null {
  // Implementation
}
```

### Type Guards

- Use type guards for runtime type checking
- Combine with TypeScript's type narrowing

```typescript
type User = { readonly id: string; readonly name: string };
type AdminUser = User & { readonly permissions: readonly string[] };

function isAdminUser(user: User): user is AdminUser {
  return 'permissions' in user;
}

function processUser(user: User): void {
  if (isAdminUser(user)) {
    // TypeScript knows user is AdminUser here
    console.log(user.permissions);
  }
}
```
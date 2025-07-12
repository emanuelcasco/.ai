# React Guidelines

> React-specific patterns and conventions for building maintainable components and applications.

## Component Architecture

### Component Type

- Use functional components with TypeScript interfaces
- Prefer hooks over class components for state management
- Keep components focused and single-purpose

```typescript
// Good: Functional component with TypeScript
type UserCardProps = {
  readonly user: User;
  readonly onEdit: (userId: string) => void;
  readonly isEditable?: boolean;
};

function UserCard({ user, onEdit, isEditable = false }: UserCardProps): JSX.Element {
  return (
    <div className="user-card">
      <h3>{user.name}</h3>
      {isEditable && (
        <button onClick={() => onEdit(user.id)}>
          Edit
        </button>
      )}
    </div>
  );
}

// Avoid: Class components for new code
class UserCard extends React.Component<UserCardProps> {
  render() {
    // Implementation
  }
}
```

### Props Pattern

- Use the RORO (Receive an Object, Return an Object) pattern for props
- Define clear TypeScript interfaces for all props
- Use readonly properties for immutability

```typescript
// Good: RORO pattern with clear interface
type ButtonProps = {
  readonly label: string;
  readonly variant?: 'primary' | 'secondary';
  readonly disabled?: boolean;
  readonly onClick: () => void;
};

function Button(props: ButtonProps): JSX.Element {
  const { label, variant = 'primary', disabled = false, onClick } = props;
  
  return (
    <button 
      className={`btn btn-${variant}`}
      disabled={disabled}
      onClick={onClick}
    >
      {label}
    </button>
  );
}

// Avoid: Multiple individual props
function Button(
  label: string,
  variant: string,
  disabled: boolean,
  onClick: () => void
): JSX.Element {
  // Implementation
}
```

## Event Handling

### Event Handler Naming

- Name event handlers with a `handle` prefix
- Use descriptive names that indicate the action

```typescript
type FormProps = {
  readonly onSubmit: (data: FormData) => void;
  readonly onCancel: () => void;
};

function ContactForm({ onSubmit, onCancel }: FormProps): JSX.Element {
  const [formData, setFormData] = useState<FormData>({
    name: '',
    email: ''
  });

  const handleNameChange = (event: React.ChangeEvent<HTMLInputElement>): void => {
    setFormData(prev => ({ ...prev, name: event.target.value }));
  };

  const handleSubmit = (event: React.FormEvent): void => {
    event.preventDefault();
    onSubmit(formData);
  };

  const handleCancel = (): void => {
    setFormData({ name: '', email: '' });
    onCancel();
  };

  return (
    <form onSubmit={handleSubmit}>
      <input 
        value={formData.name}
        onChange={handleNameChange}
        placeholder="Name"
      />
      <button type="submit">Submit</button>
      <button type="button" onClick={handleCancel}>Cancel</button>
    </form>
  );
}
```

## JSX Best Practices

### Declarative Rendering

- Write declarative JSX for clean rendering logic
- Use conditional rendering patterns effectively
- Keep JSX readable and well-structured

```typescript
// Good: Declarative and readable
function UserList({ users, isLoading, error }: UserListProps): JSX.Element {
  if (isLoading) {
    return <LoadingSpinner />;
  }

  if (error) {
    return <ErrorMessage message={error} />;
  }

  if (users.length === 0) {
    return <EmptyState message="No users found" />;
  }

  return (
    <div className="user-list">
      {users.map(user => (
        <UserCard 
          key={user.id} 
          user={user}
          onEdit={handleUserEdit}
        />
      ))}
    </div>
  );
}

// Avoid: Complex nested conditionals in JSX
function UserList({ users, isLoading, error }: UserListProps): JSX.Element {
  return (
    <div>
      {isLoading ? (
        <LoadingSpinner />
      ) : error ? (
        <ErrorMessage message={error} />
      ) : users.length === 0 ? (
        <EmptyState message="No users found" />
      ) : (
        <div className="user-list">
          {users.map(user => (
            <UserCard key={user.id} user={user} onEdit={handleUserEdit} />
          ))}
        </div>
      )}
    </div>
  );
}
```

### Component Composition

- Follow modularization to reduce duplication and improve readability
- Extract reusable components and hooks
- Use composition over inheritance

```typescript
// Good: Modular composition
function UserProfile({ userId }: UserProfileProps): JSX.Element {
  const { user, isLoading } = useUser(userId);
  const { posts } = useUserPosts(userId);

  return (
    <div className="user-profile">
      <UserHeader user={user} isLoading={isLoading} />
      <UserDetails user={user} />
      <UserPosts posts={posts} />
    </div>
  );
}

// Separate, focused components
function UserHeader({ user, isLoading }: UserHeaderProps): JSX.Element {
  if (isLoading) return <SkeletonHeader />;
  
  return (
    <header className="user-header">
      <Avatar src={user.avatar} alt={user.name} />
      <h1>{user.name}</h1>
    </header>
  );
}
```

## State Management

### Local State

- Use `useState` for component-local state
- Keep state as close to where it's used as possible
- Use `useReducer` for complex state logic

```typescript
// Good: Local state with clear types
type FormState = {
  readonly values: FormValues;
  readonly errors: FormErrors;
  readonly isSubmitting: boolean;
};

function ContactForm(): JSX.Element {
  const [state, setState] = useState<FormState>({
    values: { name: '', email: '' },
    errors: {},
    isSubmitting: false
  });

  const updateField = (field: keyof FormValues, value: string): void => {
    setState(prev => ({
      ...prev,
      values: { ...prev.values, [field]: value },
      errors: { ...prev.errors, [field]: undefined }
    }));
  };

  // Implementation
}
```

### Custom Hooks

- Extract reusable logic into custom hooks
- Follow hook naming conventions (use prefix)
- Return objects instead of arrays for better readability

```typescript
// Good: Custom hook with clear return object
function useUserData(userId: string) {
  const [user, setUser] = useState<User | null>(null);
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    fetchUser(userId)
      .then(setUser)
      .catch(err => setError(err.message))
      .finally(() => setIsLoading(false));
  }, [userId]);

  return {
    user,
    isLoading,
    error,
    refetch: () => fetchUser(userId).then(setUser)
  };
}

// Usage
function UserProfile({ userId }: UserProfileProps): JSX.Element {
  const { user, isLoading, error, refetch } = useUserData(userId);
  
  // Component implementation
}
```

## Performance Optimization

### Memoization

- Use `React.memo` for components that receive stable props
- Use `useMemo` and `useCallback` judiciously
- Don't over-optimize - measure first

```typescript
// Good: Memoized component with stable props
type ExpensiveComponentProps = {
  readonly data: ComplexData;
  readonly onUpdate: (id: string, data: Partial<ComplexData>) => void;
};

const ExpensiveComponent = React.memo(function ExpensiveComponent({
  data,
  onUpdate
}: ExpensiveComponentProps): JSX.Element {
  const processedData = useMemo(() => {
    return expensiveDataTransformation(data);
  }, [data]);

  const handleUpdate = useCallback((newData: Partial<ComplexData>) => {
    onUpdate(data.id, newData);
  }, [data.id, onUpdate]);

  return (
    <div>
      {/* Render processed data */}
    </div>
  );
});
```
# Testing Guidelines

> Testing methodologies, frameworks, and patterns for reliable, maintainable test suites.

## Testing Framework

### Jest as Standard

- Use Jest as the standard testing framework
- Leverage Jest's built-in mocking, assertions, and test running capabilities
- Configure Jest appropriately for TypeScript projects

```typescript
// jest.config.js
module.exports = {
  preset: 'ts-jest',
  testEnvironment: 'node',
  collectCoverageFrom: [
    'src/**/*.{ts,tsx}',
    '!src/**/*.d.ts',
  ],
  testMatch: [
    '**/__tests__/**/*.(ts|tsx)',
    '**/*.(test|spec).(ts|tsx)'
  ]
};
```

## Unit Testing Patterns

### Arrange-Act-Assert Convention

- Follow the Arrange-Act-Assert (AAA) pattern for clear test structure
- Separate test phases with comments or whitespace for readability

```typescript
describe('UserService', () => {
  describe('createUser', () => {
    it('should create user with valid data', () => {
      // Arrange
      const inputUserData: CreateUserRequest = {
        name: 'John Doe',
        email: 'john@example.com'
      };
      const expectedUser: User = {
        id: 'user-123',
        name: 'John Doe',
        email: 'john@example.com',
        createdAt: new Date('2023-01-01')
      };
      const mockUserRepository = createMockUserRepository();
      mockUserRepository.save.mockResolvedValue(expectedUser);

      // Act
      const result = await userService.createUser(inputUserData);

      // Assert
      expect(result).toEqual(expectedUser);
      expect(mockUserRepository.save).toHaveBeenCalledWith(inputUserData);
    });
  });
});
```

### Variable Naming in Tests

- Use clear, descriptive variable names with prefixes
- Follow patterns: `inputX`, `expectedX`, `mockX`, `actualX`

```typescript
describe('calculateTotal', () => {
  it('should calculate total with discount applied', () => {
    // Arrange
    const inputItems: CartItem[] = [
      { id: '1', price: 100, quantity: 2 },
      { id: '2', price: 50, quantity: 1 }
    ];
    const inputDiscount = 0.1; // 10% discount
    const expectedTotal = 225; // (200 + 50) * 0.9
    
    // Act
    const actualTotal = calculateTotal(inputItems, inputDiscount);
    
    // Assert
    expect(actualTotal).toBe(expectedTotal);
  });
});
```

### Mocking Dependencies

- Mock external dependencies to isolate units under test
- Use descriptive mock function names
- Reset mocks between tests

```typescript
// Mock setup
const mockEmailService = {
  sendEmail: jest.fn(),
  validateEmail: jest.fn()
};

const mockUserRepository = {
  findById: jest.fn(),
  save: jest.fn(),
  delete: jest.fn()
};

describe('UserService', () => {
  beforeEach(() => {
    jest.clearAllMocks();
  });

  it('should send welcome email after user creation', async () => {
    // Arrange
    const inputUserData: CreateUserRequest = {
      name: 'Jane Doe',
      email: 'jane@example.com'
    };
    const mockCreatedUser: User = {
      id: 'user-456',
      ...inputUserData,
      createdAt: new Date()
    };

    mockUserRepository.save.mockResolvedValue(mockCreatedUser);
    mockEmailService.sendEmail.mockResolvedValue(true);

    // Act
    await userService.createUser(inputUserData);

    // Assert
    expect(mockEmailService.sendEmail).toHaveBeenCalledWith({
      to: inputUserData.email,
      subject: 'Welcome!',
      template: 'welcome'
    });
  });
});
```

## Acceptance Testing

### Given-When-Then Convention

- Use Given-When-Then pattern for acceptance tests
- Focus on business behavior rather than implementation
- Test complete user workflows

```typescript
describe('User Registration Flow', () => {
  it('should complete user registration successfully', async () => {
    // Given: A new user wants to register
    const givenUserData = {
      name: 'Alice Smith',
      email: 'alice@example.com',
      password: 'SecurePass123!'
    };
    
    const givenEmailServiceIsWorking = true;
    setupEmailServiceMock(givenEmailServiceIsWorking);

    // When: The user submits registration form
    const whenRegistrationResult = await registrationService.registerUser(givenUserData);

    // Then: User should be created and welcome email sent
    expect(whenRegistrationResult.success).toBe(true);
    expect(whenRegistrationResult.user).toMatchObject({
      name: givenUserData.name,
      email: givenUserData.email
    });
    
    // And: Welcome email should be sent
    expect(mockEmailService.sendEmail).toHaveBeenCalledWith(
      expect.objectContaining({
        to: givenUserData.email,
        subject: expect.stringContaining('Welcome')
      })
    );
  });
});
```

### Module Testing

- Test complete modules for functionality
- Verify integration between related components
- Use realistic data and scenarios

```typescript
describe('Order Processing Module', () => {
  let orderModule: OrderModule;
  let mockPaymentService: jest.Mocked<PaymentService>;
  let mockInventoryService: jest.Mocked<InventoryService>;

  beforeEach(() => {
    mockPaymentService = createMockPaymentService();
    mockInventoryService = createMockInventoryService();
    orderModule = new OrderModule(mockPaymentService, mockInventoryService);
  });

  describe('processOrder', () => {
    it('should process complete order workflow', async () => {
      // Given: Valid order with available inventory
      const givenOrder: OrderRequest = {
        customerId: 'customer-123',
        items: [
          { productId: 'product-1', quantity: 2, price: 50 },
          { productId: 'product-2', quantity: 1, price: 30 }
        ],
        paymentMethod: 'credit-card'
      };

      mockInventoryService.checkAvailability.mockResolvedValue(true);
      mockInventoryService.reserveItems.mockResolvedValue(true);
      mockPaymentService.processPayment.mockResolvedValue({
        success: true,
        transactionId: 'txn-456'
      });

      // When: Processing the order
      const result = await orderModule.processOrder(givenOrder);

      // Then: Order should be processed successfully
      expect(result.success).toBe(true);
      expect(result.orderId).toBeDefined();
      
      // And: All services should be called in correct order
      expect(mockInventoryService.checkAvailability).toHaveBeenCalledBefore(
        mockPaymentService.processPayment as jest.Mock
      );
      expect(mockInventoryService.reserveItems).toHaveBeenCalledBefore(
        mockPaymentService.processPayment as jest.Mock
      );
    });
  });
});
```

## End-to-End Testing

### API Testing Requirements

- Ensure at least 1 E2E test for API modules covering the happy path
- Test real API endpoints with realistic data
- Verify complete request-response cycles

```typescript
describe('User API E2E', () => {
  let apiClient: ApiClient;
  let testDatabase: TestDatabase;

  beforeAll(async () => {
    testDatabase = await setupTestDatabase();
    apiClient = new ApiClient(process.env.TEST_API_URL);
  });

  afterAll(async () => {
    await teardownTestDatabase(testDatabase);
  });

  it('should handle complete user lifecycle', async () => {
    // Create user
    const createUserResponse = await apiClient.post('/users', {
      name: 'Test User',
      email: 'test@example.com'
    });

    expect(createUserResponse.status).toBe(201);
    expect(createUserResponse.data.user.id).toBeDefined();

    const userId = createUserResponse.data.user.id;

    // Get user
    const getUserResponse = await apiClient.get(`/users/${userId}`);
    expect(getUserResponse.status).toBe(200);
    expect(getUserResponse.data.user.name).toBe('Test User');

    // Update user
    const updateUserResponse = await apiClient.put(`/users/${userId}`, {
      name: 'Updated User'
    });
    expect(updateUserResponse.status).toBe(200);
    expect(updateUserResponse.data.user.name).toBe('Updated User');

    // Delete user
    const deleteUserResponse = await apiClient.delete(`/users/${userId}`);
    expect(deleteUserResponse.status).toBe(204);

    // Verify deletion
    const getDeletedUserResponse = await apiClient.get(`/users/${userId}`);
    expect(getDeletedUserResponse.status).toBe(404);
  });
});
```

## Testing Utilities

### Smoke Tests for API Endpoints

- Add test/admin smoke test methods to verify API endpoints
- Quick health checks for critical functionality
- Useful for debugging and monitoring

```typescript
describe('API Smoke Tests', () => {
  const apiClient = new ApiClient(process.env.API_URL);

  describe('Health Checks', () => {
    it('should respond to health endpoint', async () => {
      const response = await apiClient.get('/health');
      expect(response.status).toBe(200);
      expect(response.data.status).toBe('healthy');
    });

    it('should authenticate with valid credentials', async () => {
      const response = await apiClient.post('/auth/login', {
        email: process.env.TEST_USER_EMAIL,
        password: process.env.TEST_USER_PASSWORD
      });
      expect(response.status).toBe(200);
      expect(response.data.token).toBeDefined();
    });

    it('should access protected endpoint with token', async () => {
      const authResponse = await apiClient.post('/auth/login', {
        email: process.env.TEST_USER_EMAIL,
        password: process.env.TEST_USER_PASSWORD
      });

      const response = await apiClient.get('/users/me', {
        headers: {
          Authorization: `Bearer ${authResponse.data.token}`
        }
      });

      expect(response.status).toBe(200);
      expect(response.data.user).toBeDefined();
    });
  });
});
```

## Test Organization

### Test Structure

- Group related tests using `describe` blocks
- Use nested `describe` blocks for different scenarios
- Keep test descriptions clear and specific

```typescript
describe('UserValidator', () => {
  describe('validateEmail', () => {
    describe('when email is valid', () => {
      it('should return true for standard email format', () => {
        const result = UserValidator.validateEmail('user@example.com');
        expect(result).toBe(true);
      });

      it('should return true for email with subdomain', () => {
        const result = UserValidator.validateEmail('user@mail.example.com');
        expect(result).toBe(true);
      });
    });

    describe('when email is invalid', () => {
      it('should return false for email without @ symbol', () => {
        const result = UserValidator.validateEmail('userexample.com');
        expect(result).toBe(false);
      });

      it('should return false for empty string', () => {
        const result = UserValidator.validateEmail('');
        expect(result).toBe(false);
      });
    });
  });
});
```
# Documentation Guidelines

> Standards and conventions for creating and maintaining project documentation that serves developers and stakeholders effectively.

## Documentation Structure

### README.md (Project Root)

The main entry point that provides project overview and guides readers to detailed documentation.

**Requirements:**
- Start with a clear, one-sentence description of what the project does
- Provide setup instructions that work for new developers
- Reference other documentation files with descriptions of their purpose
- Act as the navigation hub for all project documentation

```markdown
# Project Name

A brief, clear description of what this project does and its main purpose.

## Quick Start

### Prerequisites
- Node.js 18+
- npm or yarn
- Any other requirements

### Installation
```bash
npm install
npm run dev
```

## Documentation

- [API Documentation](docs/API.md) - Complete API reference with examples
- [Architecture](docs/ARCHITECTURE.md) - System design and component overview
- [Database Schema](docs/SCHEMAS.md) - Data models and relationships
- [Project Specifications](docs/SPECIFICATIONS.md) - Requirements and business context

## Contributing

See our [contribution guidelines](CONTRIBUTING.md) for development workflow.
```

### CLAUDE.md (Project Context)

Track project context, priorities, and ongoing tasks for AI assistance.

**Requirements:**
- Track project context, current priorities, and ongoing tasks
- Reference each documentation file for AI context
- Maintain working memory of important constraints and requirements
- Update regularly to reflect current project state and decisions
- Help AI assistants provide consistent, context-aware assistance

```markdown
# Project Context for AI Assistance

## Current Priorities
1. [Priority description with current status]
2. [Next priority or blocking issue]

## Project Structure
- `/src` - Main application code
- `/docs` - All project documentation
- `/tests` - Test suites and test utilities

## Documentation References
- SPECIFICATIONS.md: Product requirements and user stories
- ARCHITECTURE.md: Technical architecture and system design
- API.md: Complete API documentation
- SCHEMAS.md: Database schema and data models

## Current Constraints
- [Important technical constraints]
- [Business or timeline constraints]
- [Dependencies or external factors]

## Recent Decisions
- [Recent architectural decisions]
- [Technology choices and rationale]
```

## Detailed Documentation Files

### SPECIFICATIONS.md (Business Requirements)

Define the problem being solved and guide development priorities.

**Requirements:**
- Clearly define the problem being solved and target audience
- Include user personas, use cases, and user stories
- Guide development priorities and feature scope decisions
- Focus on what to build and why, not how to build it

```markdown
# Project Specifications

## Problem Statement
[Clear description of the problem this project solves]

## Target Audience
- **Primary Users**: [Description of main users]
- **Secondary Users**: [Description of other stakeholders]

## User Personas
### [Persona Name]
- **Role**: [User's role or job title]
- **Goals**: [What they want to achieve]
- **Pain Points**: [Current challenges they face]
- **Technical Level**: [Their technical expertise]

## Use Cases
### [Use Case Name]
**Actor**: [Who performs this action]
**Goal**: [What they want to achieve]
**Steps**:
1. [Step description]
2. [Step description]
**Success Criteria**: [How we know it worked]

## User Stories
- As a [user type], I want to [action] so that [benefit]
- As a [user type], I need [functionality] to [achieve goal]

## Success Metrics
- [Measurable success criteria]
- [Performance or usage targets]
```

### ARCHITECTURE.md (Technical Design)

Provide system structure overview and technology decisions.

**Requirements:**
- Show high-level system components and relationships with diagrams
- Document technology choices and reasoning behind them
- Provide system structure overview before developers dive into code
- Reference external dependencies and integration points
- Update when significant architectural changes are made

```markdown
# System Architecture

## High-Level Overview
[Brief description of the overall system architecture]

## System Components

### Frontend
- **Technology**: [Framework/library used]
- **Purpose**: [What it handles]
- **Key Dependencies**: [Main libraries]

### Backend API
- **Technology**: [Framework used]
- **Purpose**: [Core responsibilities]
- **Key Dependencies**: [Main libraries]

### Database
- **Technology**: [Database system]
- **Purpose**: [Data storage strategy]
- **Schema**: See [SCHEMAS.md](SCHEMAS.md)

## Architecture Diagram
```
[ASCII diagram or reference to image file]
```

## Data Flow
1. [Description of how data flows through the system]
2. [Key processes and transformations]

## External Dependencies
- **[Service Name]**: [Purpose and integration method]
- **[API Name]**: [How it's used and any constraints]

## Technology Decisions
### [Technology Choice]
**Chosen**: [Selected technology]
**Alternatives Considered**: [Other options]
**Rationale**: [Why this choice was made]
```

### SCHEMAS.md (Data Models)

Document database structure and data relationships.

**Requirements:**
- Document database schema with entity relationships and constraints
- Define data types, validation rules, and field requirements
- Show how data entities relate to business concepts and use cases
- Keep synchronized with actual database structure and models

```markdown
# Database Schema

## Entity Overview
- **Users**: Application users and authentication
- **[Entity Name]**: [Brief description of purpose]

## Entity Definitions

### Users Table
```sql
CREATE TABLE users (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  email VARCHAR(255) UNIQUE NOT NULL,
  name VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

**Fields:**
- `id`: Unique identifier for the user
- `email`: User's email address (used for authentication)
- `name`: Display name for the user
- `created_at`: When the user account was created
- `updated_at`: Last modification timestamp

**Constraints:**
- Email must be unique across all users
- Email format validation at application level
- Name cannot be empty

## Relationships

### User → [Related Entity]
- **Type**: One-to-Many
- **Description**: [How these entities relate]
- **Foreign Key**: [Field names and references]

## Data Validation Rules
- [Validation rules implemented at application level]
- [Business rules for data integrity]

## Migration Strategy
- [How schema changes are handled]
- [Versioning approach for database changes]
```

### API.md (API Reference)

Complete API documentation with examples and usage guidelines.

**Requirements:**
- Document all endpoints with HTTP methods, URLs, and parameters
- Provide request and response examples with realistic sample data
- Explain authentication, authorization, and security requirements
- Define error codes, error messages, and proper error handling
- Include rate limiting, versioning, and usage guidelines

```markdown
# API Documentation

## Base URL
```
Production: https://api.example.com/v1
Development: http://localhost:3000/api/v1
```

## Authentication
All API requests require authentication via Bearer token in the Authorization header:
```
Authorization: Bearer <your-token>
```

## Endpoints

### Users

#### Create User
```http
POST /users
Content-Type: application/json

{
  "name": "John Doe",
  "email": "john@example.com"
}
```

**Response (201 Created):**
```json
{
  "success": true,
  "data": {
    "user": {
      "id": "user-123",
      "name": "John Doe",
      "email": "john@example.com",
      "created_at": "2023-01-01T00:00:00Z"
    }
  }
}
```

#### Get User
```http
GET /users/{id}
```

**Response (200 OK):**
```json
{
  "success": true,
  "data": {
    "user": {
      "id": "user-123",
      "name": "John Doe",
      "email": "john@example.com",
      "created_at": "2023-01-01T00:00:00Z"
    }
  }
}
```

## Error Handling

### Error Response Format
```json
{
  "success": false,
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Invalid email format",
    "details": {
      "field": "email",
      "value": "invalid-email"
    }
  }
}
```

### Common Error Codes
- `400 BAD_REQUEST`: Invalid request format or parameters
- `401 UNAUTHORIZED`: Missing or invalid authentication
- `403 FORBIDDEN`: Insufficient permissions
- `404 NOT_FOUND`: Resource does not exist
- `422 VALIDATION_ERROR`: Request validation failed
- `500 INTERNAL_ERROR`: Server error

## Rate Limiting
- **Limit**: 1000 requests per hour per API key
- **Headers**: Rate limit info included in response headers
- **Exceeded**: Returns 429 status with retry information

## Versioning
- API version specified in URL path: `/v1/`, `/v2/`
- Backward compatibility maintained for one major version
- Deprecation notices provided 6 months before removal
```

## Documentation Workflows

### Update Process

**After completing tasks:**
- Document changes in appropriate documentation file in `/docs` folder
- Update CLAUDE.md with current project state and any new constraints
- Ensure documentation reflects actual implementation

**For changelog updates:**
- Update `changelog.md` file in project root when requested
- Add timestamp to new entries to track when changes were made
- Create `changelog.md` if it doesn't exist

### Maintenance Guidelines

- Keep documentation synchronized with code changes
- Review and update documentation during code reviews
- Regularly audit documentation for accuracy and completeness
- Archive or remove outdated documentation sections
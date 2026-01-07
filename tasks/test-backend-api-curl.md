---
title: Test Backend API with cURL
type: task
mode: think
templates:
  - @~/.ai/templates/task.tmp.md
---

## Purpose

Validate backend API endpoints using cURL commands and jq for JSON parsing. This task enables quick manual verification of feature implementations, smoke testing, and debugging without requiring a full test suite.

## Workflow

### 1. Gather API Information

- Ask user for the base URL (e.g., `http://localhost:8081`).
- Ask user for the endpoint path to test.
- Identify required path parameters, query parameters, and request body from the endpoint.
- Ask user for any missing values needed to construct the request.

### 2. Handle Authentication

- Ask user if the endpoint requires authentication.
- If yes, ask for credentials or an existing token.
- For login endpoints, execute auth request and extract token from response.

```bash
curl -s -X POST '<base_url>/auth/login' -H 'Content-Type: application/json' -d '{"username": "<email>", "password": "<password>"}' | jq -r '.accessToken'
```

### 3. Construct and Execute cURL Command

- Build the cURL command following the correct syntax (see Instructions).
- Execute and capture the response.
- Parse with jq to extract relevant fields.

### 4. Validate and Report Results

- Compare actual response against expected behavior.
- Report pass/fail status with actual values.
- If test fails, provide debugging guidance.

## Instructions

### cURL Syntax Rules

**CRITICAL**: Follow these rules to avoid common shell parsing issues:

1. **Use double quotes for URLs**: `curl -s "http://..."`
2. **Use single quotes for headers**: `-H 'Content-Type: application/json'`
3. **Inline tokens directly**: Never use variable expansion for tokens in headers
4. **Single-line commands**: Avoid multiline commands with backslashes; write on one line
5. **Always use `-s` flag**: Suppresses progress output for clean JSON parsing

**Correct pattern:**

```bash
curl -s "http://localhost:8081/v3/endpoint/resource?param=value" -H "Authorization: Bearer <token>" | jq '.field'
```

**Avoid these patterns:**

```bash
# BAD: Variable in header often fails
curl -s "$URL" -H "Authorization: Bearer $TOKEN"

# BAD: Multiline with backslash causes parsing issues
curl -s "http://..." \
  -H "Authorization: ..."

# BAD: Single quotes around URL with variables
curl -s '$URL'
```

### Query Parameter Encoding

- For bracket notation (e.g., `?unit[water]=gallons`), URL-encode brackets:
  - `[` → `%5B`
  - `]` → `%5D`
  - Example: `?unit%5Bwater%5D=gallons`

### jq Parsing Patterns

```bash
# Extract nested field
jq '.data.nested.field'

# Select specific keys
jq '{key1, key2, key3}'

# Get first array element
jq '.items[0]'

# Filter by condition
jq '.items[] | select(.status == "active")'

# Check response keys (debugging)
jq 'keys'
```

### Error Handling

- If response is not valid JSON, check for HTML error pages or server issues.
- If `jq: parse error`, inspect raw response first: `curl -s "..." | head -100`
- If `Unauthorized`, verify token is valid and correctly passed.

## Success Criteria

- [ ] All required inputs gathered from user before execution.
- [ ] cURL commands execute without shell parsing errors.
- [ ] Responses successfully parsed with jq.
- [ ] Test results clearly reported with pass/fail status.
- [ ] Any failures include actionable debugging information.

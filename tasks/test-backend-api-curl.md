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
- **First, inspect raw response** to verify it's valid JSON: `curl -s "..." | head -100`
- If response is valid JSON, parse with jq to extract relevant fields.
- If response is not JSON (404, HTML, empty), debug before proceeding.

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

### Preventing jq Parse Errors

**CRITICAL**: The error `jq: parse error: Invalid numeric literal` means jq received non-JSON content. **Always validate responses before piping to jq.**

#### Rule 1: Inspect raw response first

```bash
# ALWAYS do this before complex jq parsing
curl -s "http://..." -H "Authorization: Bearer <token>" | head -100

# Only after confirming valid JSON, use jq
curl -s "http://..." -H "Authorization: Bearer <token>" | jq '.'
```

#### Rule 2: Check for common non-JSON responses

| Response Pattern | Likely Cause |
|------------------|--------------|
| `{"errors":[],"internal_code":"Not Found"}` | Wrong endpoint path or invalid ID |
| `<!DOCTYPE html>` | Server error page, wrong port, or auth redirect |
| `Unauthorized` | Token expired or malformed |
| Empty response | Server not running or network issue |

#### Rule 3: Verify endpoint paths

Many APIs have multiple path patterns for the same resource:

```bash
# Company-scoped (may not work for all resources)
/v3/resource/:companyId/items/:itemId

# Site-scoped (often required)
/v3/resource/:companyId/sites/:siteId/items/:itemId
```

If you get 404, try the alternative path pattern.

#### Rule 4: Use simple, inline commands

```bash
# GOOD: All values inline, single command
curl -s "http://localhost:8081/v3/resource/company-123/items/456" -H "Authorization: Bearer eyJ..." | jq '.field'

# BAD: Variable expansion can cause shell parsing issues
TOKEN="eyJ..."
curl -s "http://..." -H "Authorization: Bearer $TOKEN" | jq '.'
```

### Error Handling

- If response is not valid JSON, check for HTML error pages or server issues.
- If `jq: parse error`, **stop and inspect raw response**: `curl -s "..." | head -100`
- If `Unauthorized`, verify token is valid and correctly passed.
- If `Not Found`, verify the endpoint path (site-scoped vs company-scoped).

## Success Criteria

- [ ] All required inputs gathered from user before execution.
- [ ] cURL commands execute without shell parsing errors.
- [ ] Responses successfully parsed with jq.
- [ ] Test results clearly reported with pass/fail status.
- [ ] Any failures include actionable debugging information.

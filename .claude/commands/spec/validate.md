---
description: Validate implementation against spec requirements and verify system health
argument-hint: [plan_file] [validation_scope?]
type: command
model: claude-sonnet-4-5
---

## Usage

`/spec:validate $PLAN_FILE $VALIDATION_SCOPE?`

## Variables

- $PLAN_FILE: Path to implementation plan to validate against (required).
- $VALIDATION_SCOPE: Specific validation areas to focus on - "quick", "standard", "comprehensive" (optional, defaults to "standard").

## Workflow

1. READ documents in parallel:
   1.1. READ implementation plan from $PLAN_FILE
   1.2. DETECT change type (bugfix/greenfield/brownfield)
2. EXECUTE type-specific validation checks
3. RUN test suite and verify coverage
4. CHECK for breaking changes
5. VALIDATE performance baselines (if applicable)
6. REVIEW security implications
7. VERIFY documentation synchronization
8. GENERATE validation report
9. MARK spec as COMPLETED or flag gaps for resolution

## Instructions

**Validation Scope:**

- **quick**: Essential checks only (tests, acceptance criteria)
- **standard**: Core validation suite (default)
- **comprehensive**: Full validation including performance, security, observability

**Type-Specific Validation:**

### Bug Fix Validation
- [ ] **Regression Test**: Bug-specific test added and passing
- [ ] **Bug Verification**: Original issue no longer reproducible
- [ ] **Side Effects**: No new issues in related functionality
- [ ] **Performance**: Fix has minimal performance impact
- [ ] **Documentation**: Bug and fix documented in changelog/comments

### Greenfield Validation
- [ ] **Architecture**: Implementation follows approved design decisions
- [ ] **Test Coverage**: Coverage meets target (>80% for new code)
- [ ] **Code Quality**: Linting, formatting, type checking passing
- [ ] **Documentation**: README, API docs, architecture docs complete
- [ ] **CI/CD**: Build pipeline functional and green
- [ ] **Observability**: Logging, metrics, error tracking implemented
- [ ] **No Shortcuts**: No TODO/FIXME/HACK in critical paths

### Brownfield Validation
- [ ] **Backward Compatibility**: Breaking changes documented or avoided
- [ ] **Data Migration**: Migrations successful and reversible (if applicable)
- [ ] **Comparison Testing**: Both old and new implementations validated
- [ ] **Performance**: No regression vs. baseline
- [ ] **Feature Flags**: Properly configured and tested (if applicable)
- [ ] **Rollback Plan**: Tested and documented
- [ ] **Legacy Cleanup**: Removal plan scheduled or completed
- [ ] **Integration**: All integration points verified

**Universal Validation Checks:**

### Acceptance Criteria
- [ ] All success criteria from spec verified
- [ ] Edge cases handled
- [ ] Error scenarios tested

### Test Validation
- [ ] All tests passing (unit, integration, e2e)
- [ ] Test coverage meets standards
- [ ] Tests validate spec requirements (not just code paths)
- [ ] Flaky tests identified and fixed

### Code Quality
- [ ] Linter passing
- [ ] Type checks passing
- [ ] Code review completed (if applicable)
- [ ] No security vulnerabilities introduced

### Documentation
- [ ] Code comments for complex logic
- [ ] API documentation updated
- [ ] README updated (if needed)
- [ ] Migration guide (if breaking changes)

### Security (Comprehensive)
- [ ] No new dependencies with critical CVEs
- [ ] Input validation implemented
- [ ] Authentication/authorization verified
- [ ] Sensitive data properly handled

### Performance (Comprehensive)
- [ ] Response times within acceptable range
- [ ] Memory usage acceptable
- [ ] Database query performance validated
- [ ] No N+1 queries introduced

### Observability (Comprehensive)
- [ ] Appropriate logging added
- [ ] Metrics/alerts configured
- [ ] Error tracking functional
- [ ] Debugging information available

## Validation Report Format

```markdown
# Validation Report: {{change_name}}

**Date**: {{date}}
**Type**: Bug Fix | Greenfield | Brownfield
**Status**: ✓ PASSED | ⚠ PASSED WITH WARNINGS | ✗ FAILED

## Summary
{{brief_summary}}

## Type-Specific Checks
{{type_checks_results}}

## Universal Checks
{{universal_checks_results}}

## Issues Found
{{list_of_issues_or_none}}

## Warnings
{{list_of_warnings_or_none}}

## Recommendations
{{improvement_suggestions}}

## Sign-off
- [ ] Ready for deployment
- [ ] Needs fixes before deployment
```

## Examples

```plain
/spec:validate /path/to/specs/bugfix/20241128_fix_login_timeout.md
/spec:validate /path/to/specs/greenfield/20241128_user_dashboard.md comprehensive
/spec:validate /path/to/specs/brownfield/20241128_migrate_payment_api.md "Focus on backward compatibility"
```
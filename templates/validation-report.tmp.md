---
title: Validation Report Template
type: template
---

# Validation Report: {{change_name}}

**Date**: {{date}}
**Plan**: {{plan_file}}
**Type**: {{bugfix|greenfield|brownfield}}
**Scope**: {{quick|standard|comprehensive}}
**Status**: {{✓ PASSED | ⚠ PASSED WITH WARNINGS | ✗ FAILED}}

---

## Summary

[[LLM: Provide a brief 2-3 sentence summary of validation results]]

---

## Type-Specific Validation

<<IF: bugfix>>
### Bug Fix Checks

- [ ] **Regression Test**: Bug-specific test added and passing
  - Test location: {{test_file}}
  - Status: {{result}}
- [ ] **Bug Verification**: Original issue no longer reproducible
  - Verification method: {{method}}
  - Status: {{result}}
- [ ] **Side Effects**: No new issues in related functionality
  - Related areas tested: {{areas}}
  - Status: {{result}}
- [ ] **Performance Impact**: Fix has minimal performance overhead
  - Benchmarks: {{results}}
  - Status: {{result}}
- [ ] **Documentation**: Bug and fix documented
  - Changelog updated: {{yes|no}}
  - Code comments added: {{yes|no}}
  - Status: {{result}}

**Bug Fix Notes:**
[[LLM: Additional notes about bug fix validation]]
<</IF>>

<<IF: greenfield>>
### Greenfield Checks

- [ ] **Architecture Alignment**: Implementation follows approved design
  - Design pattern compliance: {{result}}
  - Status: {{result}}
- [ ] **Test Coverage**: Meets target threshold
  - Coverage: {{percentage}}%
  - Target: >80%
  - Status: {{result}}
- [ ] **Code Quality Gates**: All quality checks passing
  - Linting: {{result}}
  - Type checking: {{result}}
  - Formatting: {{result}}
  - Status: {{result}}
- [ ] **Documentation Complete**: All required docs present
  - README: {{result}}
  - API docs: {{result}}
  - Architecture docs: {{result}}
  - Status: {{result}}
- [ ] **CI/CD Pipeline**: Build and deployment configured
  - Pipeline status: {{result}}
  - Status: {{result}}
- [ ] **Observability**: Monitoring and logging implemented
  - Logging: {{result}}
  - Metrics: {{result}}
  - Error tracking: {{result}}
  - Status: {{result}}
- [ ] **Production Readiness**: No shortcuts in critical paths
  - TODO count: {{count}}
  - FIXME count: {{count}}
  - Status: {{result}}

**Greenfield Notes:**
[[LLM: Additional notes about greenfield validation]]
<</IF>>

<<IF: brownfield>>
### Brownfield Checks

- [ ] **Backward Compatibility**: No unintended breaking changes
  - API compatibility: {{result}}
  - Database schema: {{result}}
  - Status: {{result}}
- [ ] **Data Migration**: Migrations successful and reversible
  - Migration status: {{result}}
  - Rollback tested: {{yes|no}}
  - Status: {{result}}
- [ ] **Dual Implementation Testing**: Both old and new paths verified
  - Old implementation: {{result}}
  - New implementation: {{result}}
  - Status: {{result}}
- [ ] **Performance Baseline**: No regression from current state
  - Current baseline: {{baseline}}
  - New performance: {{new_perf}}
  - Change: {{delta}}
  - Status: {{result}}
- [ ] **Feature Flags**: Properly configured and tested
  - Flag configuration: {{result}}
  - Rollout plan: {{result}}
  - Status: {{result}}
- [ ] **Rollback Plan**: Documented and tested
  - Rollback procedure: {{documented|tested|verified}}
  - Status: {{result}}
- [ ] **Legacy Code Handling**: Cleanup planned or completed
  - Deprecated code marked: {{yes|no}}
  - Removal scheduled: {{date|completed}}
  - Status: {{result}}
- [ ] **Integration Verification**: All touchpoints validated
  - Integration points: {{list}}
  - Status: {{result}}

**Brownfield Notes:**
[[LLM: Additional notes about brownfield validation]]
<</IF>>

---

## Universal Validation Checks

### Acceptance Criteria
[[LLM: Validate each success criterion from the spec]]

- [ ] Criterion 1: {{description}}
  - Status: {{✓|✗}}
  - Evidence: {{proof}}
- [ ] Criterion 2: {{description}}
  - Status: {{✓|✗}}
  - Evidence: {{proof}}

### Test Suite Validation

- [ ] **All Tests Passing**
  - Unit tests: {{passed}}/{{total}}
  - Integration tests: {{passed}}/{{total}}
  - E2E tests: {{passed}}/{{total}}
  - Status: {{✓|✗}}
- [ ] **Test Coverage**
  - Overall: {{percentage}}%
  - New code: {{percentage}}%
  - Target met: {{yes|no}}
  - Status: {{✓|✗}}
- [ ] **Test Quality**
  - Tests validate spec (not just code): {{✓|✗}}
  - Flaky tests identified: {{count}}
  - Edge cases covered: {{✓|✗}}
  - Status: {{✓|✗}}

### Code Quality

- [ ] **Linting**: {{✓ PASSED | ✗ FAILED}}
  - Errors: {{count}}
  - Warnings: {{count}}
- [ ] **Type Checking**: {{✓ PASSED | ✗ FAILED}}
  - Type errors: {{count}}
- [ ] **Code Review**: {{✓ COMPLETED | ⊘ N/A}}
  - Reviewer: {{name}}
  - Status: {{approved|changes_requested}}

### Documentation

- [ ] **Code Documentation**
  - Complex logic commented: {{✓|✗}}
  - Public API documented: {{✓|✗}}
- [ ] **User Documentation**
  - README updated: {{✓|⊘}}
  - API docs updated: {{✓|⊘}}
  - Migration guide: {{✓|⊘}}

<<IF: comprehensive>>

---

## Comprehensive Checks

### Security Analysis

- [ ] **Dependency Security**
  - Critical CVEs: {{count}}
  - High CVEs: {{count}}
  - Status: {{✓|⚠|✗}}
- [ ] **Input Validation**
  - User input sanitized: {{✓|⊘}}
  - SQL injection prevented: {{✓|⊘}}
  - XSS prevented: {{✓|⊘}}
- [ ] **Authentication/Authorization**
  - Auth checks present: {{✓|⊘}}
  - Permission validation: {{✓|⊘}}
- [ ] **Sensitive Data**
  - No secrets in code: {{✓|✗}}
  - PII properly handled: {{✓|⊘}}

### Performance Analysis

- [ ] **Response Times**
  - Average: {{ms}}ms
  - P95: {{ms}}ms
  - P99: {{ms}}ms
  - Target met: {{yes|no}}
- [ ] **Resource Usage**
  - Memory: {{usage}}
  - CPU: {{usage}}
  - Status: {{✓|⚠|✗}}
- [ ] **Database Performance**
  - Query count: {{count}}
  - N+1 queries: {{count}}
  - Slow queries: {{count}}
  - Status: {{✓|⚠|✗}}

### Observability

- [ ] **Logging**
  - Error logging: {{✓|✗}}
  - Debug logging: {{✓|✗}}
  - Log levels appropriate: {{✓|✗}}
- [ ] **Metrics**
  - Key metrics tracked: {{✓|⊘}}
  - Dashboards configured: {{✓|⊘}}
- [ ] **Error Tracking**
  - Error reporting configured: {{✓|⊘}}
  - Alert thresholds set: {{✓|⊘}}
- [ ] **Debugging**
  - Source maps available: {{✓|⊘}}
  - Debug endpoints secured: {{✓|⊘}}

<</IF>>

---

## Issues Found

<<IF: issues_exist>>
[[LLM: List all issues that must be fixed before deployment]]

### Critical Issues
1. {{issue_description}}
   - Impact: {{impact}}
   - Required fix: {{fix}}

### High Priority Issues
1. {{issue_description}}
   - Impact: {{impact}}
   - Recommended fix: {{fix}}

<<ELSE>>
✓ No blocking issues found
<</IF>>

---

## Warnings

<<IF: warnings_exist>>
[[LLM: List warnings that should be addressed but don't block deployment]]

1. {{warning_description}}
   - Recommendation: {{recommendation}}

<<ELSE>>
✓ No warnings
<</IF>>

---

## Recommendations

[[LLM: Provide actionable recommendations for improvement]]

1. {{recommendation}}
   - Priority: {{high|medium|low}}
   - Effort: {{small|medium|large}}

---

## Traceability

- [ ] **Requirements Mapping**
  - All spec requirements implemented: {{✓|✗}}
  - No scope creep detected: {{✓|✗}}
- [ ] **Architecture Alignment**
  - No architectural drift: {{✓|✗}}
  - Design decisions followed: {{✓|✗}}

---

## Sign-off

**Overall Assessment:**
[[LLM: Final assessment and deployment readiness recommendation]]

**Deployment Readiness:**
- [ ] ✓ Ready for immediate deployment
- [ ] ⚠ Ready with noted warnings
- [ ] ✗ Requires fixes before deployment

**Recommended Next Steps:**
[[LLM: What should happen next based on validation results]]

---

**Validated by**: AI Agent
**Validation Date**: {{date}}
**Validation Duration**: {{duration}}
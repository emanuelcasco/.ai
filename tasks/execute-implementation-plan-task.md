---
title: Execute Implementation Plan Task
type: task
mode: ultrathink
---

## Purpose

Execute implementation plans following type-specific approaches (bugfix, greenfield, brownfield). Agent MUST follow change-type-specific instructions for thorough implementation.

## Workflow

### 1. Initial Assessment

- **Read implementation plan**
  - Understand objectives and success criteria
  - Identify all phases and steps
- **Detect change type:**
  - Bug Fix: Root cause analysis present, minimal scope
  - Greenfield: Architecture decisions, new codebase
  - Brownfield: Legacy context, migration strategy
- **Select implementation approach** based on type

### 2. Type-Specific Setup

**Bug Fix:**
- Write regression test that reproduces the bug
- Verify test fails before implementing fix
- Focus on minimal, targeted changes

**Greenfield:**
- Verify architecture decisions are clear
- Set up project structure if needed
- Establish testing framework early

**Brownfield:**
- Document current behavior before changes
- Identify integration points and dependencies
- Plan feature flag usage if needed

### 3. Phase Execution

- Execute each phase sequentially
- Follow step-by-step instructions (ADD/MODIFY/DELETE actions)
- Maintain system stability (no breaking changes mid-phase)
- Run tests after each phase
- Document decisions and deviations

### 4. Type-Specific Implementation

**Bug Fix Approach:**
- Implement minimal fix targeting root cause
- Verify regression test now passes
- Check for side effects in related code
- Avoid scope creep or over-engineering

**Greenfield Approach:**
- Follow architecture patterns from plan
- Write tests alongside implementation (TDD)
- Aim for >80% test coverage
- Set up observability early
- Document as you build

**Brownfield Approach:**
- Implement behind feature flags when possible
- Maintain backward compatibility (if required)
- Test both old and new code paths
- Document migration path
- Plan gradual rollout strategy

### 5. Continuous Validation

- Run test suite after each phase
- Verify acceptance criteria continuously
- Check code quality gates (linting, types)
- Ensure no architectural drift
- Update documentation alongside code

### 6. Completion Handoff

After implementation complete:
- Run full test suite
- Document any deviations from plan
- Note any follow-up tasks needed
- **Recommend running `/spec:validate` for formal validation**

## Type-Specific Guidelines

### Bug Fix Implementation
1. START with failing regression test
2. Implement MINIMAL fix
3. Verify test passes
4. Check NO side effects
5. Document bug and fix

### Greenfield Implementation
1. Follow ARCHITECTURE decisions
2. Establish TEST COVERAGE early
3. Set up OBSERVABILITY
4. Create DOCUMENTATION
5. Configure CI/CD

### Brownfield Implementation
1. Document EXISTING behavior
2. Use FEATURE FLAGS
3. Maintain COMPATIBILITY
4. Test OLD and NEW paths
5. Plan GRADUAL rollout
6. Schedule LEGACY cleanup

## Success Criteria

- [ ] All phases executed successfully
- [ ] Tests passing at each phase
- [ ] Acceptance criteria met
- [ ] Code quality gates passed
- [ ] Type-specific requirements satisfied
- [ ] Documentation updated
- [ ] Ready for formal validation (`/spec:validate`)

---
description: Autonomously implement a planned bead issue following its acceptance criteria
---

**IMPORTANT: This is an autonomous workflow. Execute ALL steps continuously without stopping or asking for confirmation. Do NOT pause between steps. Keep working until the issue is CLOSED.**

## Arguments

This skill requires an issue ID as argument (e.g., `/codegangsta:build df-123`).

## Workflow

### 1. Read and Validate the Issue

```bash
bd show $ARGUMENTS
```

**Validate before proceeding:**
- The issue MUST have acceptance criteria (checkbox items)
- If no acceptance criteria exist, STOP and report:
  > "Issue `$ARGUMENTS` has no acceptance criteria. Run `/codegangsta:plan $ARGUMENTS` first to prepare it for implementation."

### 2. Claim the Issue

```bash
bd update $ARGUMENTS --claim
```

If the claim fails (already claimed by someone else), STOP and report the conflict.

### 3. Implement the Solution

Work through each acceptance criterion:

1. Read the acceptance criteria carefully
2. Implement each item following:
   - The implementation notes in the issue
   - The project's coding standards and patterns
   - Existing conventions in the codebase
3. Write tests for new functionality
4. Make atomic, focused commits as you work

If you discover related bugs or new work:
```bash
bd create --title="..." --type=task --priority=2
```

### 4. Update Acceptance Criteria

As you complete each criterion, update the issue to check it off:

```bash
bd update $ARGUMENTS --description="<description with checked items>"
```

Format completed items as:
```markdown
- [x] Completed criterion
- [ ] Pending criterion
```

### 5. Verify Before Closing

**Do not close the issue until verification is complete.**

Verification checklist:
- [ ] ALL acceptance criteria are checked off
- [ ] Tests pass (run the project's test suite)
- [ ] Code compiles/builds without errors
- [ ] Linting passes (if applicable)
- [ ] Changes are committed

If verification fails, fix the issues before proceeding.

### 6. Close the Issue

Once verified:

```bash
bd close $ARGUMENTS --reason="Implemented: <brief summary of what was done>"
```

### 7. Report Completion

Only AFTER the issue is closed, stop and ask the user:

> "Completed and closed `$ARGUMENTS`: <title>
>
> Changes made:
> - <change 1>
> - <change 2>
>
> What next? (1) Pick next issue (2) Create PR (3) Something else"

## Guidelines

- **Work autonomously**: Do NOT pause or ask questions during steps 1-6. Just do the work.
- **Require acceptance criteria**: Do not start implementation without them
- **Claim before working**: Prevents conflicts with other agents
- **Check off criteria**: Update the issue as you complete each item
- **Verify before closing**: Run tests, ensure all criteria are met
- **Only stop at the end**: The only time to pause is after closing the issue

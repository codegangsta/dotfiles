---
description: Find and work on the next ready bead issue with proper lifecycle management
---

**IMPORTANT: This is an autonomous workflow. Execute ALL steps continuously without stopping or asking for confirmation. Do NOT pause between steps. Keep working until the issue is CLOSED.**

## Workflow

### 1. Find and Claim an Issue

```bash
bd ready --unassigned
```

Select the first issue returned. Then immediately claim it:

```bash
bd update <issue-id> --claim
```

If the claim fails (already claimed), pick the next issue and try again.

### 2. Understand and Immediately Start Working

Run `/beads:show <issue-id>` to get context, then **immediately begin implementing the solution**. Do NOT stop here. Do NOT ask the user what to do. Start coding right away.

### 3. Implement the Solution

- Follow the project's coding standards and patterns
- Write tests for new functionality
- Make atomic, focused commits
- If you discover related bugs or TODOs, create new issues with `/beads:create` and link them

### 4. Verify Before Closing

**Do not close the issue until verification is complete.**

Verification checklist:
- [ ] All acceptance criteria from the issue are met
- [ ] Tests pass (run the project's test suite)
- [ ] Code compiles/builds without errors
- [ ] Linting passes (if applicable)
- [ ] Changes are committed

If verification fails, fix the issues before proceeding.

### 5. Close the Issue

Once verified, close the issue with a descriptive reason:

```
/beads:close <issue-id> --reason "Implemented: <brief summary of what was done>"
```

### 6. Report and Ask What's Next

Only AFTER the issue is closed, stop and ask the user:

> "Completed and closed `<issue-id>`: <title>
>
> Changes made:
> - <change 1>
> - <change 2>
>
> What next? (1) Next issue (2) Create PR (3) Something else"

## Guidelines

- **Work autonomously**: Do NOT pause or ask questions during steps 1-5. Just do the work.
- **Claim before working**: Prevents conflicts with other agents
- **Verify before closing**: Run tests, ensure acceptance criteria are met
- **Only stop at the end**: The only time to pause is after closing the issue

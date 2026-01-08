---
description: Act as a PM to flesh out a bead issue with acceptance criteria and implementation notes
---

Plan and document a bead issue without implementing it. This skill acts as a PM to prepare issues for development.

## Arguments

This skill requires an issue ID as argument (e.g., `/codegangsta:plan df-123`).

## Workflow

### 1. Read the Issue

```bash
bd show $ARGUMENTS
```

Review the current state of the issue including title, description, and any existing details.

### 2. Analyze the Codebase

If the issue involves code changes:
- Explore relevant files and directories
- Understand existing patterns and conventions
- Identify files that will likely need modification
- Note any dependencies or related components

### 3. Flesh Out the Issue

Create or update the issue description to include:

#### Clear Acceptance Criteria
Format as checkboxes:
```markdown
## Acceptance Criteria
- [ ] Specific, testable criterion 1
- [ ] Specific, testable criterion 2
- [ ] ...
```

#### Implementation Notes
```markdown
## Implementation Notes
- Suggested approach and rationale
- Key files to modify: `path/to/file.ext`
- Patterns to follow from existing code
- Potential edge cases to handle
- Testing strategy
```

#### Complexity Assessment
```markdown
## Complexity
- Scope: Small/Medium/Large
- Risk areas: (any tricky parts)
- Dependencies: (external libs, other issues)
```

### 4. Update the Issue

Update the issue with the fleshed-out description:

```bash
bd update $ARGUMENTS --description="<full updated description>"
```

If the title is vague or unclear, update it too:

```bash
bd update $ARGUMENTS --title="<clearer title>"
```

### 5. Identify Dependencies

If this issue depends on other work:
```bash
bd dep add $ARGUMENTS <depends-on-id>
```

If you discover new issues that should be created:
```bash
bd create --title="..." --type=task --priority=2
bd dep add <new-id> $ARGUMENTS  # if new issue depends on this one
```

### 6. Report Summary

After planning, report:

> "Planned issue `$ARGUMENTS`: <title>
>
> Changes made:
> - <what was added/updated>
>
> Acceptance criteria: <count> items
> Ready for: `/codegangsta:build $ARGUMENTS`"

## Guidelines

- **Do NOT implement** - Only plan and document
- **Be specific** - Vague acceptance criteria are useless
- **Be realistic** - Note actual complexity and risks
- **Explore first** - Understand the codebase before suggesting approaches
- **Check dependencies** - Ensure blockers are identified and linked
- **Make it buildable** - Another agent should be able to implement from your plan

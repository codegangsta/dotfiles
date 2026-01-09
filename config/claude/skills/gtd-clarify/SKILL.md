---
name: gtd-clarify
description: Review today's tasks and resolve ambiguity or blockers
---

# GTD Clarify

> **Reference:** See `things3` skill for task requirements, tag taxonomy, and MCP operations.

Review today's tasks and resolve any ambiguity or blockers.

## Workflow

### 1. Get Today's Tasks

```
mcp__things__get_today
```

### 2. Evaluate Each Task

Check against `things3` skill requirements:

1. **Title clear and actionable?** - Verb-first, specific enough to act on
2. **Next physical action obvious?** - Can start without "but first..."
3. **Hidden blockers?** - Dependencies, missing info, waiting on something
4. **Time estimate present?** - Must have 2m, 5m, 25m, or 1h+
5. **Project/Area assigned?** - No orphan tasks

### 3. Propose Clarifications

For unclear tasks, propose improvements:

```
Task: "Project X"
Issues:
- Not verb-first
- Too vague

Suggested: "Draft project X proposal outline" [25m]

Or break into project:
1. "Review project X requirements doc" [5m]
2. "Draft initial proposal outline" [25m]
3. "Send outline to stakeholders" [5m]

Apply this clarification? [Y/n]
```

### 4. Handle Multi-Step Tasks

If a task has 3+ steps, offer to convert to a Project using `mcp__things__add_project`.

For 2 steps, add checklist in notes instead.

### 5. Surface Blockers

For blocked tasks, add "Waiting for" tag and note who/what is blocking.

### 6. Report Summary

```
Clarified X of Y tasks:

Improved:
- "Project X" → "Draft project X proposal outline" [25m]

Added time estimates to:
- "Review doc" [5m]

Identified blockers:
- "Deploy feature" - waiting on QA approval

Skipped (already clear):
- "Send invoice to client" [5m]

Your Today list is now clearer!
```

## Guidelines

- **Interactive process** - Ask before making changes (unlike process-inbox)
- **Projects vs tasks** - If 3+ steps, probably a project
- **Surface blockers early** - Better to know now than when you start

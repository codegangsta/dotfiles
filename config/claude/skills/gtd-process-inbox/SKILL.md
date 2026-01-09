---
name: gtd-process-inbox
description: Process Things 3 inbox using GTD methodology - fully autonomous
---

# GTD Process Inbox

> **Reference:** See `things3` skill for task requirements, tag taxonomy, and MCP operations.

**AUTONOMOUS WORKFLOW** - Process inbox items directly without confirmation for fast GTD flow.

## Workflow

### 1. Get Inbox Items

```
mcp__things__get_inbox
```

If inbox is empty, report "Inbox is clear!" and stop.

### 2. Process Each Item

Apply the GTD decision tree:

```
Is it actionable?
├── NO →
│   ├── Trash (not useful) → Delete it
│   ├── Reference (might need later) → Move to Someday
│   └── Someday/Maybe (might do eventually) → Move to Someday
└── YES →
    ├── < 2 minutes? → Do it NOW or mark complete
    ├── Delegatable to person? → Add "Waiting for" tag + person in notes
    ├── Delegatable to agent? → Add "Agent/Queued" tag
    ├── Multi-step project? → Convert to Project with first next action
    └── Single action → Process as next action
```

### 3. For Each Actionable Item

**Apply all task requirements from `things3` skill:**

1. Rewrite title (verb-first, specific)
2. Add time estimate tag (2m, 5m, 25m, 1h+)
3. Add notes with context
4. Assign to Project or Area
5. Add native checklist items if multi-step (use `checklist_items` param)
6. Add context tag if relevant (Errand, etc.)
7. Move to Today or appropriate list

### 4. Report Summary

After processing all items:

```
Processed X inbox items:
- Y moved to Today
- Z moved to Someday
- N deleted
- M marked complete (2-min rule)
- P converted to projects

Inbox is now clear!
```

## Guidelines

- **Be decisive** - Make quick judgments, don't overthink
- **2-minute rule** - If < 2 minutes, suggest doing it now
- **Don't create projects for single actions** - Only if truly multi-step
- **Preserve user intent** - Don't change the meaning, just clarify it

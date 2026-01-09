---
name: gtd-next-action
description: Identify and execute/assist with the highest priority next action
---

# GTD Next Action

> **Reference:** See `things3` skill for task requirements, tag taxonomy, and MCP operations.

Identify and execute/assist with the highest priority next action from Today.

**Auto-Execute Scope:** Research tasks, email drafts, and code changes.

## Workflow

### 1. Get Today's Tasks

```
mcp__things__get_today
```

### 2. Check for Daily Review

If any task belongs to `Project: ☕️ Daily Review`:
- The Daily Review project is active
- Work through it using the `gtd-daily-review` skill workflow
- Process project tasks in order, not individual prioritization

### 3. Prioritize Tasks

For non-Daily Review tasks, sort by (highest priority first):

1. **Agent/Queued** - Tasks explicitly queued for agent work
2. **Calendar-related** - Tasks tied to today's meetings
3. **Quick wins (2m, 5m)** - Build momentum
4. **Time-blocked** - Scheduled for specific times
5. **Deep work (25m, 1h+)** - Focused tasks

### 4. Select and Analyze Top Action

```
Is it tagged "Agent/Queued"?
├── YES → Claim it and execute
└── NO → Continue analysis...

Is it part of a project with other tasks?
├── YES → Read project context, understand scope
└── NO → Treat as standalone task

Can Claude help directly?
├── Research → Execute: web search, summarize
├── Email → Execute: draft, present for review
├── Code → Execute: implement, test, report
├── Writing → Execute: draft content
└── Physical/human → Assist: provide context

Is it blocked?
├── YES → Tag "Agent/Blocked", pick next task
└── NO → Proceed

Needs human verification when done?
├── YES (code, important decisions) → Use Agent/Needs Review
└── NO (research, simple tasks) → Complete directly
```

### 5. Claim Agent Tasks

For tasks tagged `Agent/Queued`, claim before working:

```
mcp__things__update_todo(id, tags=["Agent", "Working"])
```

### 6. Execute or Assist

**For AI-automatable tasks:** Just do it - research, draft, implement.

**For human-required tasks:** Provide context, guidance, resources.

### 7. Track Progress

As you complete checklist items, report progress to the user:

```
Working on "Research competitor pricing":
- [x] Identify top 5 competitors (done)
- [x] Document pricing tiers (done)
- [ ] Create comparison spreadsheet (in progress)

Please check off completed items in Things.
```

Update task notes with findings and decisions (not checkboxes):

```
mcp__things__update_todo(id, notes="Context: [original context]

---
PROGRESS:
- Found 5 competitors: A, B, C, D, E
- Pricing ranges from $10-50/mo")
```

### 8. Handle Completion

**Blocked:**
```
mcp__things__update_todo(id, tags=["Agent", "Blocked"], notes="Blocked: [reason]")
```

**Needs Review:**
```
mcp__things__update_todo(id, tags=["Agent", "Needs Review"], notes="Done: [summary]")
```

**Complete:**
```
mcp__things__update_todo(id, completed=true, tags=[])
```

### 9. Report and Continue

```
Completed: "Research competitor pricing" [5m]

Results:
- [Summary of what was done]
- [Key findings]

Next up: "Draft proposal outline" [25m]
Continue? [Y/n]
```

## MCP Tools Reference

| Operation | MCP Tool |
|-----------|----------|
| Get today's tasks | `mcp__things__get_today` |
| Get project tasks | `mcp__things__get_todos(project_uuid=...)` |
| Claim task | `mcp__things__update_todo(id, tags=["Agent", "Working"])` |
| Update notes | `mcp__things__update_todo(id, notes=...)` |
| Mark blocked | `mcp__things__update_todo(id, tags=["Agent", "Blocked"])` |
| Mark for review | `mcp__things__update_todo(id, tags=["Agent", "Needs Review"])` |
| Complete task | `mcp__things__update_todo(id, completed=true)` |

## Guidelines

- **Check for Daily Review first** - If active, work through that project
- **Claim before working** - Always claim Agent/Queued tasks first
- **Execute directly** - For research, drafts, code - just do it
- **Track progress** - Report checklist completion to user, update notes with findings
- **Use Blocked when stuck** - Don't spin; mark blocked and explain
- **Use Needs Review for consequential work** - Code, important decisions
- **Continue momentum** - After completing, offer next task

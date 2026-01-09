---
name: gtd-project
description: Work through a Things 3 project - claim tasks, execute, track progress
args: project name or search term
---

# GTD Project

> **Reference:** See `things3` skill for task requirements, tag taxonomy, and MCP operations.

Work through a **Things 3 project** by claiming and completing its child tasks sequentially. Use the project as a work bucket for discovered items, review feedback, and follow-ups.

## Arguments

The skill receives a project name or search term as `$ARGUMENTS`. Example:
- `/gtd:project Retool around Things 3`
- `/gtd:project user authentication`

## Workflow

### 1. Find the Project

Search for the project:

```
mcp__things__search_items(query="$ARGUMENTS")
```

If multiple matches, list them and ask which one. If one match, proceed.

### 2. Get Project Tasks

Retrieve all tasks in the project:

```
mcp__things__get_todos(project_uuid="<project-uuid>", include_items=true)
```

Report the project overview:
```
Project: [name]
Tasks: [count] total, [incomplete] remaining

Tasks:
1. [ ] First task [tag]
2. [ ] Second task [tag]
3. [x] Completed task
```

### 3. Work Through Tasks In Order

**IMPORTANT:** Tasks are returned in the exact order the user arranged them in Things 3. Always work through tasks in this order - start with the first incomplete task, complete it, then move to the next. Never skip ahead or reorder based on your own judgment.

For each incomplete task (in order):

1. **Claim the task:**
   ```
   mcp__things__update_todo(id, tags=["Working"])
   ```

2. **Analyze the task:**
   - Read task notes for context
   - Check if it's Agent/Queued or human-required
   - Determine if Claude can execute

3. **Execute or assist:**
   - **AI-automatable:** Research, draft, implement - just do it
   - **Human-required:** Provide context, then wait for confirmation

4. **Report progress:**
   ```
   Working on "Task title":
   - [x] Step 1 (done)
   - [ ] Step 2 (in progress)
   ```

5. **Complete the task:**
   ```
   mcp__things__update_todo(id, completed=true, tags=[], notes="[existing + completion summary]")
   ```

6. **Re-fetch tasks and continue:**
   ```
   mcp__things__get_todos(project_uuid="<project-uuid>", include_items=true)
   ```
   Always re-fetch the task list after completing a task. The user may have reordered or added tasks while you were working. Start again from the first incomplete task in the fresh list.

### 4. Handle Discovered Work

When you discover new work while working on a task:

```
mcp__things__add_todo(
    title="New task discovered",
    notes="Context: Found while working on [original task]",
    tags=["25m"],
    list_id="<project-uuid>"
)
```

### 5. Update Project Notes

Track progress and decisions in the project description:

```
mcp__things__update_project(
    id="<project-uuid>",
    notes="[existing notes]

---
## Agent Progress
- Completed: [tasks done]
- Discovered: [new items added]
- Blocked: [any blockers]
- Notes: [key findings or decisions]"
)
```

### 6. Project Completion Rules

**NEVER mark the project complete.** Only the human decides when a project is truly done.

When all visible tasks are complete, **tag the project for review**:

```
mcp__things__update_project(
    id="<project-uuid>",
    tags=["Agent", "Needs Review"],
    notes="[existing notes]

---
## Ready for Review
- Completed: X tasks
- Added: Y new tasks discovered during work
- Summary: [brief description of what was accomplished]

Please review and either close the project or add follow-up tasks."
)
```

Then report to the user:
```
All current tasks in "[Project Name]" are complete.

Summary:
- Completed: X tasks
- Added: Y new tasks

Tagged project as "Agent/Needs Review" for your review.
Please add follow-up tasks or close the project when satisfied.
```

## MCP Tools Reference

| Operation | MCP Tool |
|-----------|----------|
| Search for project | `mcp__things__search_items(query=...)` |
| Get project tasks | `mcp__things__get_todos(project_uuid=...)` |
| Claim task | `mcp__things__update_todo(id, tags=["Working"])` |
| Complete task | `mcp__things__update_todo(id, completed=true, tags=[])` |
| Add discovered work | `mcp__things__add_todo(..., list_id="<project-uuid>")` |
| Update project notes | `mcp__things__update_project(id, notes=...)` |

## Guidelines

- **Respect task order** - Work tasks in the exact order returned by the API (this matches the user's arrangement in Things 3). Never skip or reorder tasks.
- **Re-fetch after each task** - Always get a fresh task list after completing a task. The user may reorder or add tasks while you work.
- **Claim before working** - Always update tags to "Working" first
- **Use project as bucket** - Add discovered work to the project, not elsewhere
- **Update project notes** - Document progress, decisions, and findings
- **NEVER close projects** - Only humans decide when projects are done
- **Be autonomous** - Execute AI-automatable tasks without asking
- **Report progress** - Keep the user informed of what you're doing
- **Ask when stuck** - If blocked, explain why and ask for guidance

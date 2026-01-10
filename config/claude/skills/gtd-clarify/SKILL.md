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

### 2. Quick Triage

Scan all tasks and categorize:

**Already Clear** - Tasks that meet all criteria:
- Verb-first, actionable title
- Time estimate present (2m, 5m, 15m, 25m, or 1h+)
- Next action is obvious
- No hidden blockers

**Needs Clarification** - Tasks missing any of the above

Present a brief overview to the user showing both categories before diving in.

### 3. One-by-One Clarification

Go through each unclear task individually using `AskUserQuestion`. This is the key workflow - don't batch questions, handle them one at a time.

**For missing time estimates:**
```
AskUserQuestion: "Task X is missing a time estimate. How long does this take?"
Options: 5m, 15m, 25m, 1h+
```

**For vague tasks:**
```
AskUserQuestion: "Task X seems vague. What's the actual next action here?"
Options: Rewrite title, Add details to notes, Convert to project, Delete task
```

**For potential blockers:**
```
AskUserQuestion: "Task X - can you actually do this today, or is something blocking it?"
Options: Ready to do, Blocked (waiting on someone), Needs more info, Move to later
```

**For multi-step tasks:**
```
AskUserQuestion: "Task X sounds like multiple steps. Should this be a project?"
Options: Convert to project, Keep as single task, Add checklist items
```

### 4. Apply Changes Immediately

After each answer, make the change right away:
- Update tags with `mcp__things__update_todo`
- Create projects with `mcp__things__add_project`
- Cancel old tasks when converting to projects
- Mark complete if user says it's done

Then move to the next unclear task.

### 5. Handle Projects on Today

For projects scheduled today, check if they have clear next actions:
- Get project tasks with `mcp__things__get_todos`
- If tasks are unclear or missing, clarify those too
- If project is stale (weeks old), ask about status

### 6. Report Summary

After all tasks are clarified:

```
Clarified X of Y tasks:

✓ "Task A" → added [25m]
✓ "Task B" → converted to project with 3 tasks
✓ "Task C" → marked complete
✓ "Task D" → confirmed ready

Your Today list is now clearer!
```

## Guidelines

- **One at a time** - Use AskUserQuestion for each unclear task, don't batch
- **Apply immediately** - Make changes right after each answer
- **Context matters** - The user might have info that changes everything (e.g., "I'm at the shop right now")
- **Projects vs tasks** - If 3+ steps, probably a project
- **Surface blockers early** - Better to know now than when you start
- **Keep it conversational** - This is collaborative clarification, not interrogation

---
name: gtd-daily-review
description: Morning briefing and assisted daily review with Things 3, Calendar, and Mail
---

# GTD Daily Review

> **Reference:** See `things3` skill for task requirements, tag taxonomy, and MCP operations.

Work through the **☕️ Daily Review** project in Things 3, completing each child task autonomously where possible.

## Workflow

### 1. Find the Daily Review Project

Use `get_today` to find tasks belonging to the Daily Review project:

```
mcp__things__get_today
```

Look for tasks where `Project: ☕️ Daily Review`. Extract the project UUID from any matching task.

Then get all tasks in that project:

```
mcp__things__get_todos(project_uuid="<project-id>")
```

### 2. Work Through Each Task

Process tasks in order. For each task:

1. **Read the task notes** for instructions
2. **Execute based on note markers:**
   - `AGENT:` - Execute autonomously, then mark complete
   - `HUMAN:` - Report what human needs to do, wait for confirmation
   - Both - Do agent part first, then wait for human
3. **Update progress** in task notes as you work
4. **Mark complete** using `update_todo(id, completed=true)`

### 3. Task-Specific Handling

**Check Calendar** - Agent task:
- Run: `icalBuddy -f -nc -nrd -df "" -tf "%H:%M" eventsToday`
- Report schedule summary, meetings needing prep
- Mark complete after reporting

**Clear Email Inbox** - Mixed:
- Report unread counts (agent)
- Human reviews and processes emails
- Wait for confirmation before completing

**Answer Text Messages** - Human only:
- Skip, report "Human task - respond to texts"
- Move to next task

**Check waiting for list** - Agent task:
- Use `get_tagged_items(tag="Waiting for")`
- Report any items needing follow-up
- Mark complete after reporting

**Clear Things Inbox** - Agent task:
- Use `get_inbox` to check count
- If items exist, run `/gtd:process-inbox`
- Mark complete when inbox is zero

**Now Visit Anytime List** - Mixed:
- Use `get_anytime` to surface relevant tasks
- Human decides what to move to Today
- Wait for confirmation

**Review Today List** - Agent task:
- Use `get_today` to get all tasks
- Check for: verb-first title, time estimate tag
- Report any quality issues
- Mark complete after reporting

**Journal** - Human only:
- Skip, report "Human task - journaling time"
- Move to next task

### 4. Complete the Review

After all tasks processed:
1. Mark the Daily Review project complete if all child tasks done
2. Report: "Daily review complete!"
3. Suggest first action based on calendar and priorities

## MCP Tools Reference

| Operation | MCP Tool |
|-----------|----------|
| Get today's tasks | `mcp__things__get_today` |
| Get project tasks | `mcp__things__get_todos(project_uuid=...)` |
| Get inbox | `mcp__things__get_inbox` |
| Get tagged items | `mcp__things__get_tagged_items(tag=...)` |
| Get anytime list | `mcp__things__get_anytime` |
| Update task | `mcp__things__update_todo(id, notes, completed, tags)` |
| Complete task | `mcp__things__update_todo(id, completed=true)` |

## Guidelines

- **Work through project tasks** - Daily Review is a project, not a single task
- **Track progress** - Report completion to user, update notes with findings
- **Things 3 is the tracker** - Do NOT use TodoWrite for this workflow
- **Be autonomous** - Complete agent tasks without asking, pause only for human tasks
- **Be concise** - Morning briefings should be scannable
- **End with action** - Always conclude with a clear first task

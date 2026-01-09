---
name: things3
description: Foundational reference for working with Things 3 - all GTD skills inherit from this
user_invocable: false
---

# Working with Things 3

This is the **foundational reference** for all Things 3 operations. All GTD skills follow these conventions.

## Core Principle

**Things 3 is the source of truth for task management.** Do NOT use Claude's internal TodoWrite tool for GTD workflows. All progress, status, and notes must be visible in Things 3.

---

## MCP Tools Available

The Things 3 MCP provides these tools:

| Tool | Purpose |
|------|---------|
| `mcp__things__get_inbox` | Get todos from Inbox |
| `mcp__things__get_today` | Get todos due today |
| `mcp__things__get_upcoming` | Get upcoming todos |
| `mcp__things__get_anytime` | Get todos from Anytime list |
| `mcp__things__get_someday` | Get todos from Someday list |
| `mcp__things__get_logbook` | Get completed todos (period, limit) |
| `mcp__things__get_todos` | Get todos, optionally by project_uuid |
| `mcp__things__get_projects` | Get all projects |
| `mcp__things__get_areas` | Get all areas |
| `mcp__things__get_tags` | Get all tags |
| `mcp__things__get_tagged_items` | Get items with a specific tag |
| `mcp__things__search_todos` | Search todos by title or notes |
| `mcp__things__search_advanced` | Advanced search with filters |
| `mcp__things__get_recent` | Get recently created items |
| `mcp__things__add_todo` | Create a new todo |
| `mcp__things__add_project` | Create a new project |
| `mcp__things__update_todo` | Update an existing todo |
| `mcp__things__update_project` | Update an existing project |
| `mcp__things__show_item` | Show item in Things app |

---

## Task Requirements

Every task MUST have these attributes before leaving the inbox or being created:

### 1. Verb-First Title
The title must start with an action verb and be specific enough to act on.

| Bad | Good |
|-----|------|
| "Mom's birthday" | "Buy birthday gift for Mom" |
| "Taxes" | "Gather W-2 forms for tax filing" |
| "Project X" | "Draft project X proposal outline" |
| "Meeting prep" | "Review agenda for standup meeting" |

### 2. Time Estimate Tag
Every task needs one of these tags:
- `2m` - Quick action (< 2 minutes)
- `5m` - Short task (2-5 minutes)
- `25m` - Focused work (one pomodoro)
- `1h+` - Deep work (requires significant time)

### 3. Description/Notes
Add context answering: *Why does this task exist? What's the background?*

```
mcp__things__update_todo(id, notes="Context: [why this matters, relevant background]")
```

### 4. Project or Area Assignment
Every task must belong to a Project or Area - no orphan tasks.

```
mcp__things__update_todo(id, list_id="<project-or-area-uuid>")
```

### 5. Checklist for Multi-Step Tasks
If a task has 2+ steps but isn't a full project, add a **native Things 3 checklist** (not markdown checkboxes):

```
# When creating a new task with known steps:
mcp__things__add_todo(
    title="Implement user authentication",
    notes="Context: [background]",
    checklist_items=["Set up auth provider", "Add login form", "Test login flow"],
    tags=["25m"],
    list_title="Engineering"
)
```

**Important:** Use `checklist_items` parameter, NOT markdown checkboxes in notes.

---

## Progress Tracking

### Using Things 3 Checklists

When creating tasks, define steps as native checklist items:

```
mcp__things__add_todo(
    title="Research competitor pricing",
    checklist_items=["Identify top 5 competitors", "Document pricing tiers", "Create comparison spreadsheet"],
    ...
)
```

### Checking Off Checklist Items

Things 3 checklist items are checked off in the app UI. As you complete steps, report progress to the user:

```
Working on "Research competitor pricing":
- [x] Identify top 5 competitors (done)
- [x] Document pricing tiers (done)
- [ ] Create comparison spreadsheet (in progress)

Please check off "Identify top 5 competitors" and "Document pricing tiers" in Things.
```

### When to Add Notes Instead

Use notes for:
- **Context and background** - Why this task exists
- **Links and references** - URLs, file paths, related docs
- **Decisions and findings** - What you discovered while working
- **Completion summary** - What was done when finished

Do NOT use markdown checkboxes (`- [ ]`) in notes for progress tracking.

### For Project Tasks
When working through a project, complete each task before moving to the next. Update task notes with findings and completion summary.

---

## Tag Taxonomy

### Time Estimate Tags (Required)
- `2m` - Under 2 minutes
- `5m` - 2-5 minutes
- `25m` - One pomodoro
- `1h+` - Deep work

### Agent Tags
Used for human-agent collaboration:

| Tag | Meaning | When to Use |
|-----|---------|-------------|
| `Agent/Queued` | Ready for agent to pick up | Human queues work for Claude |
| `Agent/Working` | Agent currently working | Agent claims task |
| `Agent/Blocked` | Agent hit a blocker | Agent can't proceed, needs human |
| `Agent/Needs Review` | Agent finished, wants verification | Before completing consequential work |

**Tag Flow:**
```
Queued → Working → Needs Review → (human completes)
                 → Blocked → (human unblocks) → Working
                 → (complete directly for simple tasks)
```

### Other Tags
- `Waiting for` - Blocked on external person/thing
- `Errand` - Requires leaving the house
- Context tags as needed for your workflow

---

## Common Operations

### Claiming Tasks

When an agent starts work on a task tagged `Agent/Queued`:

```
mcp__things__update_todo(id, tags=["Agent", "Working"])
```

### Completing Tasks

**Simple Completion (no review needed):**
For research, lookups, simple tasks:

```
mcp__things__update_todo(id, completed=true, tags=[])
```

**Needs Review (consequential work):**
For code changes, important decisions, anything the human should verify:

```
mcp__things__update_todo(id, tags=["Agent", "Needs Review"], notes="[existing notes]

---
READY FOR REVIEW:
- [What was done]
- [Files changed / outputs created]
- [How to verify]")
```

**Blocked (can't proceed):**
When agent hits a blocker:

```
mcp__things__update_todo(id, tags=["Agent", "Blocked"], notes="[existing notes]

---
BLOCKED: [Reason]
Need from human: [What's required to unblock]")
```

### Creating Tasks

```
mcp__things__add_todo(
    title="Verb-first title",
    notes="Context: [why this exists]",
    tags=["25m"],
    list_title="Project or Area Name",
    when="today"
)
```

### Creating Projects

```
mcp__things__add_project(
    title="Project Name",
    notes="Context: [project background]",
    area_title="Area Name",
    todos=["First next action", "Second action", "Third action"]
)
```

### Getting Tasks by Tag

```
mcp__things__get_tagged_items(tag="Waiting for")
mcp__things__get_tagged_items(tag="Agent/Queued")
```

### Searching

```
mcp__things__search_todos(query="keyword")
mcp__things__search_advanced(status="incomplete", tag="25m")
```

---

## Working with Projects

When assigned to work on a **project** (via `/gtd:next-action`, `/gtd:project`, or direct request), follow these guidelines:

### Navigating Project Tasks

1. **Get the project's children** using `mcp__things__get_todos(project_uuid="<uuid>")`
2. **Work through tasks sequentially** - claim one task, complete it, then claim the next
3. **Update task notes with progress** as you work through each item

```
# Get project tasks
mcp__things__get_todos(project_uuid="<project-uuid>")

# Claim first task
mcp__things__update_todo(id="<task-uuid>", tags=["Working"])

# Complete and move to next
mcp__things__update_todo(id="<task-uuid>", completed=true, tags=[])
```

### Project Rules

| Rule | Reason |
|------|--------|
| **NEVER close projects** | Projects are milestones - only humans decide when they're truly done |
| **Tag for review when done** | Use `Agent/Needs Review` on project when all tasks complete |
| **Update project notes** | Add useful context, discoveries, and status as you work |
| **Create follow-up tasks in the project** | Projects are buckets for related work |
| **Add review feedback to project** | When work needs review, capture feedback in the project |

### Completing Project Work

When all tasks in a project are complete, **tag the project for human review**:

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

The human will then:
- Review the work
- Add more tasks if needed
- Close the project when satisfied

### Using Projects as Work Buckets

Projects provide **isolated context** for tracking related work. Use them to:

- **Capture discovered work** - Found a bug while working? Add it to the project
- **Track review feedback** - Human reviewed your work? Add their notes as tasks
- **Group follow-ups** - Related items that come up go in the project
- **Document decisions** - Update project notes with key decisions made

```
# Add discovered work to project
mcp__things__add_todo(
    title="Fix edge case discovered during testing",
    notes="Context: Found this while working on main task",
    tags=["25m"],
    list_id="<project-uuid>"
)

# Update project notes with status
mcp__things__update_project(
    id="<project-uuid>",
    notes="[existing notes]

---
## Agent Progress Notes
- Completed tasks 1-3
- Discovered edge case, added as new task
- Waiting for human review on task 4"
)
```

### Converting Tasks to Projects

If a task **grows in scope** or needs to be broken into multiple steps:

1. Create a new project with the same title
2. Add the breakdown as tasks within the project
3. Complete the original task with a note pointing to the project
4. Continue working within the new project

```
# Create project from expanded task
mcp__things__add_project(
    title="Implement feature X",
    notes="Expanded from single task - scope grew during investigation",
    area_title="Engineering",
    todos=["Step 1", "Step 2", "Step 3", "Step 4"]
)

# Complete original task with pointer
mcp__things__update_todo(
    id="<original-task-uuid>",
    completed=true,
    notes="[existing notes]

---
Converted to project: Implement feature X (scope expanded)"
)
```

---

## Anti-Patterns

### DON'T use TodoWrite for GTD
Claude's internal todo list is for ephemeral session-only tracking. GTD work must be in Things 3.

### DON'T create tasks without required fields
Every task needs: verb-first title, time estimate, description, project/area.

### DON'T skip progress updates
Update task notes as you work - this is how humans see what you're doing.

### DON'T use markdown checkboxes for progress tracking
Use Things 3 native `checklist_items` when creating tasks. Notes are for context and findings, not checklists.

### DON'T leave tasks orphaned
Every task belongs to a Project or Area.

### DON'T guess at project/area assignment
If unsure which area a task belongs to, ask the user or list the areas first.

---

## External Tool Integration

### Calendar (use icalBuddy for speed)
```bash
# Today's events
icalBuddy -f -nc -nrd -df "" -tf "%H:%M" eventsToday

# This week's events
icalBuddy -f -nc -nrd eventsToday+7
```

### Mail (still uses AppleScript)
```applescript
tell application "Mail"
    set personal to unread count of mailbox "INBOX" of account "Personal"
    set work to unread count of mailbox "INBOX" of account "Kajabi"
    return "Personal: " & personal & ", Work: " & work
end tell
```

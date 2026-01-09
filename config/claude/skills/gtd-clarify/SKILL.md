---
name: gtd-clarify
description: Review today's tasks and resolve ambiguity or blockers
---

# GTD Clarify

Review today's tasks and resolve any ambiguity or blockers.

## Workflow

### 1. Get Today's Tasks

```applescript
tell application "Things3"
    set output to ""
    set todayTodos to to dos of list "Today"
    repeat with t in todayTodos
        set taskTags to tag names of t
        set taskNotes to notes of t
        set output to output & id of t & "|" & name of t & "|" & taskTags & "|" & taskNotes & linefeed
    end repeat
    return output
end tell
```

### 2. Evaluate Each Task

For each task, check:

1. **Is the title clear and actionable?**
   - Does it start with a verb?
   - Is it specific enough to act on?
   - Would someone else understand what to do?

2. **Is the very next physical action obvious?**
   - Can you start this task without thinking "but first..."?
   - If not, what's the actual next step?

3. **Are there hidden blockers?**
   - Does this depend on someone/something else?
   - Is there information you need first?
   - Are you waiting on anything?

4. **Does it have a time estimate?**
   - Every task should have 2m, 5m, 25m, or 1h+

### 3. Propose Clarifications

For unclear tasks, propose improvements:

**Example:**
```
Task: "Project X"
Issues:
- Not verb-first
- Too vague - what's the actual next step?

Suggested clarification:
- Title: "Draft project X proposal outline"
- Tag: 25m
- Or break into project with tasks:
  1. "Review project X requirements doc"
  2. "Draft initial proposal outline"
  3. "Send outline to stakeholders for feedback"

Apply this clarification? [Y/n]
```

### 4. Break Down Vague Tasks

For tasks that are actually projects, offer to break them down:

```applescript
-- Convert task to project with next actions
tell application "Things3"
    -- Create new project
    set p to make new project with properties {name:"Project Name"}

    -- Add tasks to project
    make new to do with properties {name:"First next action", tag names:"25m"} at end of p
    make new to do with properties {name:"Second action", tag names:"25m"} at end of p

    -- Delete original vague task
    set t to to do id "original-task-id"
    delete t
end tell
```

### 5. Add Checklists for Multi-Step Tasks

For tasks that have sub-steps but aren't full projects:

```applescript
-- Note: Things 3 AppleScript doesn't support checklists directly
-- Instead, add sub-steps to notes
tell application "Things3"
    set t to to do id "task-id"
    set notes of t to "Steps:
- [ ] Step 1
- [ ] Step 2
- [ ] Step 3"
end tell
```

### 6. Surface Blockers

For blocked tasks:

```applescript
-- Add Waiting for tag and note who/what
tell application "Things3"
    set t to to do id "task-id"
    set tag names of t to "Waiting for"
    set notes of t to "Waiting on: [person/thing] for [what]"
end tell
```

### 7. Report Summary

After reviewing all tasks:

```
Clarified X of Y tasks:

Improved:
- "Project X" → "Draft project X proposal outline" [25m]
- "Taxes" → Converted to project with 3 next actions

Added time estimates to:
- "Review doc" [5m]
- "Team sync prep" [25m]

Identified blockers:
- "Deploy feature" - waiting on QA approval

Skipped (already clear):
- "Send invoice to client" [5m]
- "Book flight" [25m]

Your Today list is now clearer!
```

## AppleScript Reference

```applescript
-- Update task title
tell application "Things3"
    set t to to do id "task-id"
    set name of t to "New clear title"
end tell

-- Update tags
tell application "Things3"
    set t to to do id "task-id"
    set tag names of t to "25m"
end tell

-- Update notes
tell application "Things3"
    set t to to do id "task-id"
    set notes of t to "Additional context"
end tell

-- Move to Waiting for
tell application "Things3"
    set t to to do id "task-id"
    set tag names of t to "Waiting for"
end tell
```

## Guidelines

- **Interactive process** - Ask before making changes (unlike process-inbox)
- **Verb-first always** - Titles must start with action verbs
- **Be specific** - "Review X" is clearer than "X"
- **Time estimates required** - Every task needs a time tag
- **Projects vs tasks** - If it has 3+ steps, it's probably a project
- **Surface blockers early** - Better to know now than when you start

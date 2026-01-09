---
name: gtd-process-inbox
description: Process Things 3 inbox using GTD methodology - fully autonomous
---

# GTD Process Inbox

**AUTONOMOUS WORKFLOW** - Process inbox items directly without confirmation for fast GTD flow.

## Workflow

### 1. Get Inbox Items

```applescript
tell application "Things3"
    set output to ""
    set inboxTodos to to dos of list "Inbox"
    repeat with t in inboxTodos
        set output to output & id of t & "|" & name of t & "|" & notes of t & linefeed
    end repeat
    return output
end tell
```

If inbox is empty, report "Inbox is clear!" and stop.

### 2. Process Each Item

For each inbox item, apply the GTD decision tree:

#### Decision Tree

```
Is it actionable?
├── NO →
│   ├── Trash (not useful) → Delete it
│   ├── Reference (might need later) → Move to Someday
│   └── Someday/Maybe (might do eventually) → Move to Someday
└── YES →
    ├── < 2 minutes? → Do it NOW or mark complete
    ├── Delegatable to person? → Add "Waiting for" tag + person in notes
    ├── Delegatable to agent? → Add "Agent/Queued" tag (research, drafts, code)
    ├── Multi-step project? → Convert to Project with first next action
    └── Single action → Process as next action
```

### 3. For Each Actionable Item

1. **Rewrite title** to be verb-first and specific:
   - Bad: "Mom's birthday"
   - Good: "Buy birthday gift for Mom"
   - Bad: "Taxes"
   - Good: "Gather W-2 forms for tax filing"

2. **Add time estimate tag** (2m, 5m, 25m, or 1h+):
   ```applescript
   tell application "Things3"
       set t to to do id "task-id"
       set tag names of t to "25m"
   end tell
   ```

3. **Add context tag** if relevant (Errand, etc.)

4. **Move to Today** or appropriate project:
   ```applescript
   tell application "Things3"
       set t to to do id "task-id"
       move t to list "Today"
   end tell
   ```

### 4. AppleScript Operations Reference

```applescript
-- Update task title
tell application "Things3"
    set t to to do id "task-id"
    set name of t to "New verb-first title"
end tell

-- Add/update tags
tell application "Things3"
    set t to to do id "task-id"
    set tag names of t to "25m, Errand"
end tell

-- Add notes
tell application "Things3"
    set t to to do id "task-id"
    set notes of t to "Additional context here"
end tell

-- Move to Today
tell application "Things3"
    set t to to do id "task-id"
    move t to list "Today"
end tell

-- Move to Someday
tell application "Things3"
    set t to to do id "task-id"
    move t to list "Someday"
end tell

-- Delete item
tell application "Things3"
    set t to to do id "task-id"
    delete t
end tell

-- Mark complete (for 2-min tasks done immediately)
tell application "Things3"
    set t to to do id "task-id"
    set status of t to completed
end tell

-- Convert to project
tell application "Things3"
    set p to make new project with properties {name:"Project Name"}
    make new to do with properties {name:"First next action"} at beginning of p
end tell
```

### 5. Report Summary

After processing all items, report:

> "Processed X inbox items:
> - Y moved to Today
> - Z moved to Someday
> - N deleted
> - M marked complete (2-min rule)
> - P converted to projects
>
> Inbox is now clear!"

## Guidelines

- **Be decisive** - Make quick judgments, don't overthink
- **Verb-first titles** - Always start with an action verb
- **Time estimates** - Every actionable item needs a time tag
- **2-minute rule** - If it takes less than 2 minutes, suggest doing it now
- **Don't create projects for single actions** - Only convert to project if truly multi-step
- **Preserve user intent** - Don't change the meaning, just clarify it

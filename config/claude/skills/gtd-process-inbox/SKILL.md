---
name: gtd-process-inbox
description: Process Things 3 inbox using GTD methodology - interactive clarification
---

# GTD Process Inbox

> **Reference:** See `things3` skill for task requirements, tag taxonomy, and MCP operations.

Process inbox items one-by-one with user input for clarity.

## Workflow

### 1. Get Inbox Items

```
mcp__things__get_inbox
```

If inbox is empty, report "Inbox is clear!" and stop.

### 2. Show Overview

List all inbox items briefly so the user sees what's coming:

```
You have X items in your inbox:
1. "Item A"
2. "Item B"
3. "Item C"

Let's process these one at a time.
```

### 3. Process Each Item One-by-One

For each item, use `AskUserQuestion` to clarify with the GTD decision tree as your guide:

**First, determine if actionable:**
```
AskUserQuestion: "What is 'Item X'?"
Options:
- Actionable task (I need to do something)
- Reference/Someday (might need later, not now)
- Delete (not useful)
```

**If actionable, clarify the action:**
```
AskUserQuestion: "What's the actual next action for 'Item X'?"
Options:
- [Suggest a verb-first rewrite based on context]
- [Another interpretation]
- Let me type it (Other)
```

**Get time estimate:**
```
AskUserQuestion: "How long will this take?"
Options: 2m, 5m, 15m, 25m, 1h+
```

**Determine where it belongs:**
```
AskUserQuestion: "Where does this belong?"
Options:
- Today (do it today)
- Upcoming (schedule for later)
- Someday (no commitment yet)
- [Relevant project name if one exists]
```

**Check if it's multi-step:**
```
AskUserQuestion: "Is this a single action or multiple steps?"
Options:
- Single action
- Multiple steps (convert to project)
- Add checklist items
```

### 4. Apply Changes Immediately

After each set of answers, update the task right away:
- Rewrite title with `mcp__things__update_todo`
- Add tags (time estimate, context)
- Assign to project/area
- Move to appropriate list (today, someday, etc.)
- Convert to project if needed with `mcp__things__add_project`

Then move to the next inbox item.

### 5. Handle Special Cases

**2-minute rule:**
If estimated at 2m, ask: "This is quick - want to just do it now and mark complete?"

**Waiting on someone:**
If blocked on a person, add "Waiting for" tag and note who.

**Agent-delegatable:**
If it's something an agent could do, offer: "Should I tag this for an agent to pick up?"

### 6. Report Summary

After all items processed:

```
Processed X inbox items:

✓ "Raw item" → "Clarified task" [25m] → Today
✓ "Vague note" → Converted to project with 3 tasks
✓ "Old idea" → Moved to Someday
✓ "Quick thing" → Marked complete (2-min rule)

Inbox is now clear!
```

## Guidelines

- **One at a time** - Process each item fully before moving to next
- **Ask, don't assume** - User knows what they meant by cryptic notes
- **Apply immediately** - Make changes right after each answer
- **2-minute rule** - Offer to mark complete if truly quick
- **Preserve intent** - Help clarify, don't change the meaning
- **Keep it moving** - Don't over-discuss, just clarify and move on

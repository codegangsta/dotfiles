---
name: gtd-weekly-review
description: Comprehensive weekly GTD review - "Daily Review on steroids"
---

# GTD Weekly Review

> **Reference:** See `things3` skill for task requirements, tag taxonomy, and MCP operations.

Comprehensive weekly review following GTD methodology. "Daily Review on steroids."

## Workflow

Three phases: **Get Clear**, **Get Current**, **Get Creative**.

---

## Phase 1: Get Clear

Collect all loose ends and process to zero.

### 1.1 Process Things Inbox

```
mcp__things__get_inbox
```

If inbox has items, run `/gtd:process-inbox` first.

### 1.2 Process Email Inboxes

```applescript
tell application "Mail"
    set personal to unread count of mailbox "INBOX" of account "Personal"
    set work to unread count of mailbox "INBOX" of account "Kajabi"
    return "Personal: " & personal & ", Work: " & work
end tell
```

### 1.3 Review Past Week's Calendar

```bash
icalBuddy -f -nc -nrd eventsFrom:"7 days ago" to:"today"
```

Ask: "Any follow-ups from these past events?"

### 1.4 Capture Stray Items

Prompt: "Any notes, papers, or thoughts needing capture?"

---

## Phase 2: Get Current

Review all active lists and projects.

### 2.1 Review Projects

```
mcp__things__get_projects(include_items=true)
```

For each: Still relevant? Has next action? Stuck?

### 2.2 Review Today/Upcoming

```
mcp__things__get_today
mcp__things__get_upcoming
```

### 2.3 Review Waiting For

```
mcp__things__get_tagged_items(tag="Waiting for")
```

Still waiting? Follow up needed?

### 2.4 Review Someday/Maybe

```
mcp__things__get_someday
```

Ask: "Anything here ready to activate?"

### 2.5 Review Next Two Weeks

```bash
icalBuddy -f -nc -nrd eventsToday+14
```

Flag events needing preparation.

---

## Phase 3: Get Creative

Step back and look at bigger picture.

### 3.1 Review Areas of Focus

```
mcp__things__get_areas(include_items=true)
```

Any new projects needed? Any to complete or drop?

### 3.2 Brain Dump

Prompt: "What's on your mind? Any new ideas?"

Capture to Things inbox.

### 3.3 Set Intentions

- "What are your Big 3 for this week?"
- "Any tasks to delegate to agents?" (Tag Agent/Queued)

---

## Summary Report

```
Weekly Review Complete!

Get Clear:
- Inbox: 0 (was 12)
- Email: 0, 0 (was 15, 8)

Get Current:
- Active projects: 8
- Waiting for: 3 items
- Promoted from Someday: 2

Get Creative:
- New projects: 1
- Delegated to agents: 2

Big 3 for This Week:
1. [First priority]
2. [Second priority]
3. [Third priority]
```

## Guidelines

- **Block time** - Weekly review takes 30-60 minutes
- **Be thorough** - This is THE maintenance ritual
- **Process to zero** - Inboxes empty when done
- **Update Someday** - Keep it fresh, not a graveyard
- **Delegate to agents** - Use Agent/Queued for automatable work

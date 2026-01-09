---
name: gtd-next-action
description: Identify and execute/assist with the highest priority next action
---

# GTD Next Action

Identify and execute/assist with the highest priority next action from Today.

**Auto-Execute Scope:** Research tasks, email drafts, and code changes.

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

### 2. Prioritize Tasks

Sort by these heuristics (highest priority first):

1. **Agent/Queued** - Tasks explicitly queued for agent work
2. **Calendar-related** - Tasks tied to today's meetings/events
3. **Quick wins (2m, 5m)** - Build momentum with fast completions
4. **Time-blocked** - Tasks scheduled for specific times
5. **High-focus (25m, 1h+)** - Deep work tasks

### 3. Select and Analyze Top Action

For the highest priority task, determine:

```
Task Type Decision Tree:

Is it tagged "Agent/Queued"?
├── YES → Claim it and execute
└── NO → Continue analysis...

Can Claude help directly?
├── Research task → Execute: web search, summarize findings
├── Email task → Execute: draft email, present for review
├── Code task → Execute: implement, test, report results
├── Writing task → Execute: draft content
└── Physical/human task → Assist: provide context, next steps

Is it blocked?
├── YES → Tag "Agent/Blocked", add note explaining why, pick next task
└── NO → Proceed with execution/assistance

Does it need human verification when done?
├── YES (code changes, important decisions) → Will use Agent/Needs Review
└── NO (research, simple tasks) → Will complete directly
```

### 4. Claim Agent Tasks

For tasks tagged `Agent/Queued`:

```applescript
-- Claim the task
tell application "Things3"
    set t to to do id "task-id"
    if tag names of t contains "Queued" then
        set tag names of t to "Agent, Working"
        return "claimed"
    else
        return "already claimed"
    end if
end tell
```

### 5. Execute or Assist

#### For AI-Automatable Tasks:

**Research:**
- Perform web searches
- Summarize findings
- Add results to task notes
- Mark complete when done

**Email drafts:**
- Draft email based on task
- Present draft for approval
- If approved, can create draft in Mail:
```applescript
tell application "Mail"
    set newMessage to make new outgoing message with properties {subject:"Subject", content:"Body", visible:true}
    tell newMessage
        make new to recipient at end of to recipients with properties {address:"email@example.com"}
    end tell
end tell
```

**Code tasks:**
- Read relevant files
- Implement changes
- Run tests
- Report results

#### For Human-Required Tasks:

Provide assistance:
- Context and background
- Step-by-step guidance
- Links and resources
- Time estimates

### 6. Track Progress

Add checklist items for multi-step work:

```applescript
tell application "Things3"
    set t to to do id "task-id"
    set notes of t to notes of t & linefeed & "
Progress:
- [x] Step 1 complete
- [x] Step 2 complete
- [ ] Step 3 in progress"
end tell
```

### 7. Handle Completion

#### If Blocked (can't proceed):

```applescript
-- Mark as blocked with explanation
tell application "Things3"
    set t to to do id "task-id"
    set tag names of t to "Agent, Blocked"
    set notes of t to notes of t & linefeed & "
BLOCKED: [Reason agent cannot proceed]
Need from human: [What's required to unblock]"
end tell
```

Report: "Blocked on [task] - need [what's required]. Moving to next task."

#### If Needs Review (want human verification):

```applescript
-- Mark for human review
tell application "Things3"
    set t to to do id "task-id"
    set tag names of t to "Agent, Needs Review"
    set notes of t to notes of t & linefeed & "
READY FOR REVIEW:
- [What was done]
- [Files changed / outputs created]
- [How to verify]"
end tell
```

Report: "Completed [task] - marked for your review. Please verify and complete when satisfied."

#### If Complete (no review needed):

```applescript
-- Remove agent tags and complete
tell application "Things3"
    set t to to do id "task-id"
    set tag names of t to ""  -- Clear agent tags
    set status of t to completed
end tell
```

### 8. Report and Continue

After completing a task:

```
Completed: "Research competitor pricing" [5m]

Results:
- [Summary of what was done]
- [Key findings/outputs]

Next up: "Draft proposal outline" [25m]
Continue? [Y/n]
```

## AppleScript Reference

```applescript
-- Get task by ID
tell application "Things3"
    set t to to do id "task-id"
end tell

-- Claim task (Agent/Queued → Agent/Working)
tell application "Things3"
    set t to to do id "task-id"
    set tag names of t to "Agent, Working"
end tell

-- Mark blocked (Agent/Working → Agent/Blocked)
tell application "Things3"
    set t to to do id "task-id"
    set tag names of t to "Agent, Blocked"
end tell

-- Mark for review (Agent/Working → Agent/Needs Review)
tell application "Things3"
    set t to to do id "task-id"
    set tag names of t to "Agent, Needs Review"
end tell

-- Update notes with progress
tell application "Things3"
    set t to to do id "task-id"
    set notes of t to "Progress notes here"
end tell

-- Complete task (clear tags first)
tell application "Things3"
    set t to to do id "task-id"
    set tag names of t to ""
    set status of t to completed
end tell

-- Create email draft
tell application "Mail"
    set newMessage to make new outgoing message with properties {subject:"Subject", content:"Body", visible:true}
end tell
```

## Guidelines

- **Claim before working** - Always claim Agent/Queued tasks first
- **Execute directly** - For research, drafts, and code - just do it
- **Use Blocked when stuck** - Don't spin; mark blocked and explain what's needed
- **Use Needs Review for consequential work** - Code changes, important decisions
- **Complete simple tasks directly** - Research, quick lookups don't need review
- **Report results** - Always show what was accomplished
- **Continue momentum** - After completing, offer the next task
- **Track progress** - Update notes for visibility

---
name: gtd-daily-review
description: Morning briefing and assisted daily review with Things 3, Calendar, and Mail
---

# GTD Daily Review

Assist with the daily review by working through the existing **☕️ Daily Review** task in Things 3.

## Workflow

### 1. Find and Claim the Daily Review Task

```applescript
tell application "Things3"
    set todayTodos to to dos of list "Today"
    repeat with t in todayTodos
        if name of t contains "Daily Review" then
            return id of t & "|" & name of t & "|" & notes of t
        end if
    end repeat
    return "not found"
end tell
```

If not found in Today, report that and offer to help anyway.

### 2. Work Through Each Step

The Daily Review task has checkboxes in its notes. Work through each:

#### Step 1: Gather Context

**Calendar - Today's Events:**
```applescript
tell application "Calendar"
    set today to current date
    set todayStart to today - (time of today)
    set todayEnd to todayStart + (1 * days)
    set output to ""
    repeat with cal in calendars
        try
            set evts to (every event of cal whose start date ≥ todayStart and start date < todayEnd)
            repeat with e in evts
                set output to output & "- " & (summary of e) & " at " & time string of (start date of e) & linefeed
            end repeat
        end try
    end repeat
    return output
end tell
```

**Mail - Unread Counts:**
```applescript
tell application "Mail"
    set personal to unread count of mailbox "INBOX" of account "Personal"
    set work to unread count of mailbox "INBOX" of account "Kajabi"
    return "Personal: " & personal & ", Work: " & work
end tell
```

Present findings concisely:
```
## Today's Calendar
- Team standup at 9:00 AM
- 1:1 with Sarah at 2:00 PM

## Email
- Personal: 5 unread
- Work: 12 unread
```

#### Step 2: Process Inbox

**Check Things Inbox:**
```applescript
tell application "Things3"
    return count of to dos of list "Inbox"
end tell
```

If inbox > 0, offer: "You have X items in your inbox. Run `/gtd:process-inbox`?"

#### Step 3: Review Today List

**Get Today's Tasks:**
```applescript
tell application "Things3"
    set output to ""
    set todayTodos to to dos of list "Today"
    repeat with t in todayTodos
        if name of t does not contain "Daily Review" then
            set taskTags to tag names of t
            set output to output & "- " & name of t
            if taskTags is not "" then
                set output to output & " [" & taskTags & "]"
            end if
            set output to output & linefeed
        end if
    end repeat
    return output
end tell
```

Check each task:
- Is it clear and actionable? (verb-first)
- Does it have a time estimate tag?
- Any obvious blockers?

If issues found, offer: "Some tasks need clarification. Run `/gtd:clarify`?"

#### Step 4: Set Intentions

Ask the user:
- "What are your top 3 Must Dos for today?"
- "Any tasks to delegate to agents?" (will tag Agent/Queued)

#### Step 5: First Action

Based on calendar and priorities, suggest the first task to start with:
- Consider meeting prep needs
- Quick wins build momentum
- High-priority items when energy is fresh

### 3. Complete the Daily Review

When all steps are done:

```applescript
tell application "Things3"
    set t to to do id "task-id"
    set status of t to completed
end tell
```

Report: "Daily review complete! Your focus for this morning: [suggested first task]"

---

## Guidelines

- **Use the existing task** - Don't create a new Daily Review, find and use the recurring one
- **Track progress in notes** - Check off steps as you go through them
- **Be concise** - Morning briefings should be scannable, not verbose
- **Offer sub-commands** - Let `/gtd:process-inbox` and `/gtd:clarify` handle details
- **Suggest, don't dictate** - User decides priorities, you provide information
- **End with action** - Always conclude with a clear first task to start

## AppleScript Reference

```applescript
-- Find Daily Review task
tell application "Things3"
    repeat with t in (to dos of list "Today")
        if name of t contains "Daily Review" then
            return t
        end if
    end repeat
end tell

-- Update notes (check off a step)
tell application "Things3"
    set t to to do id "task-id"
    -- Replace "- [ ]" with "- [x]" for completed steps
    set notes of t to "[updated notes with checked items]"
end tell

-- Complete the review
tell application "Things3"
    set t to to do id "task-id"
    set status of t to completed
end tell
```

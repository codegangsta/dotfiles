---
name: gtd-weekly-review
description: Comprehensive weekly GTD review - "Daily Review on steroids"
---

# GTD Weekly Review

Comprehensive weekly review following GTD methodology. "Daily Review on steroids."

## Workflow

The weekly review has three phases: **Get Clear**, **Get Current**, and **Get Creative**.

---

## Phase 1: Get Clear

Collect all loose ends and process to zero.

### 1.1 Process Things Inbox

```applescript
tell application "Things3"
    return count of to dos of list "Inbox"
end tell
```

If inbox > 0, run `/gtd:process-inbox` first.

### 1.2 Process Email Inboxes

```applescript
tell application "Mail"
    set personal to unread count of mailbox "INBOX" of account "Personal"
    set work to unread count of mailbox "INBOX" of account "Kajabi"
    return "Personal: " & personal & ", Work: " & work
end tell
```

For each inbox with significant unread, offer to triage.

### 1.3 Review Past Week's Calendar

Look for items to capture:

```applescript
tell application "Calendar"
    set today to current date
    set weekAgo to today - (7 * days)
    set todayStart to today - (time of today)
    set output to ""
    repeat with cal in calendars
        try
            set evts to (every event of cal whose start date ≥ weekAgo and start date < todayStart)
            repeat with e in evts
                set output to output & (summary of e) & " - " & date string of (start date of e) & linefeed
            end repeat
        end try
    end repeat
    return output
end tell
```

Ask: "Any follow-ups or tasks from these past events?"

### 1.4 Capture Stray Items

Prompt: "Any notes, papers, or thoughts floating around that need capturing?"

---

## Phase 2: Get Current

Review all active lists and projects.

### 2.1 Review Projects

```applescript
tell application "Things3"
    set output to ""
    set allProjects to projects
    repeat with p in allProjects
        set projectStatus to status of p
        if projectStatus is open then
            set todoCount to count of to dos of p
            set output to output & name of p & " (" & todoCount & " tasks)" & linefeed
        end if
    end repeat
    return output
end tell
```

For each project, ask:
- Is this still relevant?
- Does it have a clear next action?
- Is it stuck? Blocked?

### 2.2 Review Today/Upcoming

```applescript
tell application "Things3"
    set todayCount to count of to dos of list "Today"
    set upcomingCount to count of to dos of list "Upcoming"
    return "Today: " & todayCount & ", Upcoming: " & upcomingCount
end tell
```

### 2.3 Review Waiting For

```applescript
tell application "Things3"
    set output to ""
    repeat with t in to dos
        if tag names of t contains "Waiting for" then
            set output to output & "- " & name of t & linefeed
        end if
    end repeat
    return output
end tell
```

For each waiting item:
- Still waiting? Follow up needed?
- Has it been resolved?

### 2.4 Review Someday/Maybe

```applescript
tell application "Things3"
    set output to ""
    set somedayTodos to to dos of list "Someday"
    set foundCount to 0
    repeat with t in somedayTodos
        if foundCount < 20 then
            set output to output & "- " & name of t & linefeed
            set foundCount to foundCount + 1
        end if
    end repeat
    return output
end tell
```

Ask: "Anything here ready to activate?"

### 2.5 Review Next Two Weeks Calendar

```applescript
tell application "Calendar"
    set today to current date
    set todayStart to today - (time of today)
    set twoWeeks to todayStart + (14 * days)
    set output to ""
    repeat with cal in calendars
        try
            set evts to (every event of cal whose start date ≥ todayStart and start date < twoWeeks)
            repeat with e in evts
                set output to output & (summary of e) & " - " & date string of (start date of e) & linefeed
            end repeat
        end try
    end repeat
    return output
end tell
```

Flag any events needing preparation.

---

## Phase 3: Get Creative

Step back and look at the bigger picture.

### 3.1 Review Areas of Focus

```applescript
tell application "Things3"
    set output to ""
    set allAreas to areas
    repeat with a in allAreas
        set projectCount to count of projects of a
        set output to output & name of a & " (" & projectCount & " projects)" & linefeed
    end repeat
    return output
end tell
```

For each area:
- Any new projects needed?
- Any projects to complete or drop?
- Balance across areas good?

### 3.2 Brain Dump

Prompt: "What's on your mind? Any new ideas, projects, or tasks?"

Capture anything mentioned to Things inbox.

### 3.3 Set Intentions

Ask:
- "What are your Big 3 for this week?"
- "Any tasks to delegate to agents?" (Tag with Agent/Queued)

---

## Phase 4: Report Summary

```
Weekly Review Complete!

Get Clear:
- Inbox: 0 items (was 12)
- Email: Personal 0, Work 0 (was 15, 8)

Get Current:
- Active projects: 8
- Waiting for: 3 items
- Promoted from Someday: 2 items

Get Creative:
- New projects created: 1
- Tasks delegated to agents: 2

Big 3 for This Week:
1. [First priority]
2. [Second priority]
3. [Third priority]

You're ready for the week!
```

## Guidelines

- **Block time** - Weekly review takes 30-60 minutes; protect this time
- **Be thorough** - This is THE maintenance ritual; don't rush
- **Process to zero** - Inboxes should be empty when done
- **Update Someday** - Keep it fresh, not a graveyard
- **Set intentions** - Big 3 provides focus for the week
- **Delegate to agents** - Use Agent/Queued for automatable work

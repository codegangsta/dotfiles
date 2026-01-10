---
name: calendar
description: Reading and creating calendar events on macOS
user_invocable: false
---

# Calendar Integration

Reference for reading and creating calendar events on macOS.

---

## Reading Events (icalBuddy)

Use `icalBuddy` for fast calendar queries:

```bash
# Today's events
icalBuddy -f -nc -nrd -df "" -tf "%H:%M" eventsToday

# This week's events
icalBuddy -f -nc -nrd eventsToday+7

# Tomorrow's events
icalBuddy -f -nc -nrd -df "" -tf "%H:%M" eventsFrom:tomorrow to:tomorrow

# Specific date range
icalBuddy -f -nc -nrd eventsFrom:"2026-01-15" to:"2026-01-20"
```

**Flags:**
- `-f` - Format output
- `-nc` - No calendar names in output
- `-nrd` - No relative dates ("today", "tomorrow")
- `-df ""` - Date format (empty = no date prefix)
- `-tf "%H:%M"` - Time format (24h)

---

## Creating Events (AppleScript)

**IMPORTANT:** Always list calendars first before creating events. Calendar names vary by user.

### Step 1: List Available Calendars

```applescript
tell application "Calendar" to get name of every calendar
-- Returns: {"Calendar", "Personal", "Work", "Birthdays", ...}
```

**Common calendar names:** "Personal", "Home", "Work", "Calendar" (default)

### Step 2: Create Event

```applescript
tell application "Calendar"
    tell calendar "Personal"  -- Use actual calendar name from step 1
        make new event with properties {
            summary:"Event Title",
            start date:date "Saturday, January 17, 2026 at 9:15:00 AM",
            end date:date "Saturday, January 17, 2026 at 10:15:00 AM",
            location:"Address here",
            description:"Notes here"
        }
    end tell
end tell
```

### All-Day Events

```applescript
tell application "Calendar"
    tell calendar "Personal"
        make new event with properties {
            summary:"Day Off",
            start date:date "Monday, January 20, 2026 at 12:00:00 AM",
            allday event:true
        }
    end tell
end tell
```

---

## Querying Specific Calendars

```bash
# Events from specific calendar
icalBuddy -ic "Work" eventsToday

# Exclude specific calendars
icalBuddy -ec "Birthdays" -ec "Holidays" eventsToday
```

---

## Date Format for AppleScript

AppleScript requires dates in this format:
```
"Weekday, Month Day, Year at Hour:Minute:Second AM/PM"
```

Examples:
- `"Saturday, January 17, 2026 at 9:15:00 AM"`
- `"Monday, February 3, 2026 at 2:30:00 PM"`

---

## Anti-Patterns

### DON'T assume calendar names
Always list calendars first - names vary by user and iCloud setup.

### DON'T use icalBuddy for creating events
It's read-only. Use AppleScript to create events.

### DON'T forget time zones
AppleScript uses the system time zone. Be explicit if the user mentions a different zone.

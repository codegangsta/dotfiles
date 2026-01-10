---
name: mail
description: Reading and managing email via Apple Mail on macOS
user_invocable: false
---

# Mail Integration

Reference for reading and managing email via Apple Mail on macOS.

---

## Reading Unread Counts

```applescript
tell application "Mail"
    set personal to unread count of mailbox "INBOX" of account "Personal"
    set work to unread count of mailbox "INBOX" of account "Kajabi"
    return "Personal: " & personal & ", Work: " & work
end tell
```

**Note:** Account names vary by user. List accounts first if unsure.

---

## Listing Accounts

```applescript
tell application "Mail"
    get name of every account
end tell
-- Returns: {"Personal", "Kajabi", "iCloud", ...}
```

---

## Reading Messages

### Get Recent Unread Messages

```applescript
tell application "Mail"
    set msgs to (messages of mailbox "INBOX" of account "Personal" whose read status is false)
    set result to {}
    repeat with m in (items 1 thru (min of {10, count of msgs}) of msgs)
        set end of result to {subject of m, sender of m, date received of m}
    end repeat
    return result
end tell
```

### Get Message Details

```applescript
tell application "Mail"
    set m to message 1 of mailbox "INBOX" of account "Personal"
    return {subject:subject of m, sender:sender of m, content:content of m}
end tell
```

---

## Sending Email

```applescript
tell application "Mail"
    set newMessage to make new outgoing message with properties {
        subject:"Subject Line",
        content:"Email body text here",
        visible:true
    }
    tell newMessage
        make new to recipient at end of to recipients with properties {
            address:"recipient@example.com"
        }
    end tell
    send newMessage
end tell
```

**Note:** Set `visible:true` to review before sending, or `visible:false` to send immediately.

---

## Searching Mail

```applescript
tell application "Mail"
    set results to (messages of mailbox "INBOX" of account "Personal" whose subject contains "invoice")
    return count of results
end tell
```

---

## Moving Messages

```applescript
tell application "Mail"
    set m to message 1 of mailbox "INBOX" of account "Personal"
    move m to mailbox "Archive" of account "Personal"
end tell
```

---

## Anti-Patterns

### DON'T assume account names
Always list accounts first - names vary by user's email setup.

### DON'T send without user confirmation
Draft emails should be shown to the user before sending. Set `visible:true`.

### DON'T delete messages without explicit permission
Moving to Archive is safer than permanent deletion.

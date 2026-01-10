---
name: browser
description: Best practices for browser automation with Claude in Chrome
user_invocable: false
---

# Browser Automation Best Practices

Reference documentation for browser automation using the Claude in Chrome MCP tools.

---

## Core Principles

1. **User drives, agent assists** - User often completes actions faster than agent navigation
2. **Capture confirmations** - Always screenshot after user completes bookings/forms
3. **Extract data proactively** - Pull addresses, phone numbers, confirmation numbers from pages
4. **Enrich tasks** - Add captured details to Things tasks for future reference

---

## Confirmation Capture

When the user says they completed something in the browser (booking, form submission, purchase):

**Immediately screenshot to capture details:**

```
mcp__claude-in-chrome__computer(action="screenshot", tabId=<id>)
```

**Then extract key information:**
- Confirmation/reservation numbers
- Dates and times
- Addresses and phone numbers
- Reference links or order IDs

**Add to relevant task notes:**
```
mcp__things__update_todo(id, notes="[existing]

---
Booked: [date/time]
Confirmation #: [number]
Location: [address]
Phone: [phone]")
```

### Trigger Phrases

Screenshot when user says:
- "I booked it"
- "Done"
- "I submitted it"
- "Order placed"
- "Signed up"
- "Scheduled"

---

## Tab Management

### Session Start

Always get tab context first:

```
mcp__claude-in-chrome__tabs_context_mcp(createIfEmpty=true)
```

### Creating Tabs

Create new tabs for new tasks instead of reusing:

```
mcp__claude-in-chrome__tabs_create_mcp()
```

### Tab ID Errors

If a tool returns "tab doesn't exist":
1. Call `tabs_context_mcp` to get fresh tab IDs
2. Use a valid tab ID from the response

---

## Navigation Patterns

### Waiting for Page Load

After navigation, wait before interacting:

```
mcp__claude-in-chrome__computer(action="wait", duration=2, tabId=<id>)
mcp__claude-in-chrome__computer(action="screenshot", tabId=<id>)
```

### Cookie Banners

Dismiss cookie banners for privacy (click "Deny" or "Reject"):

```
mcp__claude-in-chrome__find(query="reject cookies button", tabId=<id>)
mcp__claude-in-chrome__computer(action="left_click", ref="<ref_id>", tabId=<id>)
```

### Form Filling

Use `form_input` for form fields:

```
mcp__claude-in-chrome__form_input(ref="<ref_id>", value="text", tabId=<id>)
```

---

## Handoff Patterns

### User Takes Over

When user can complete faster (login, complex forms):

1. Navigate to the right page
2. Screenshot and explain what's needed
3. Say: "I've navigated to [page]. You can [complete action] - let me know when done and I'll capture the confirmation."
4. When user confirms, screenshot and extract details

### Portal/Login Walls

If a site requires login:

1. Navigate to the login page
2. Screenshot
3. Ask: "This requires login. Want me to continue after you sign in, or take it from here?"

---

## Data Extraction

### Reading Page Content

For text-heavy pages:

```
mcp__claude-in-chrome__get_page_text(tabId=<id>)
```

### Finding Elements

For specific elements:

```
mcp__claude-in-chrome__find(query="confirmation number", tabId=<id>)
mcp__claude-in-chrome__read_page(tabId=<id>, ref_id="<ref>")
```

---

## Error Handling

### When Things Go Wrong

If browser tools fail 2-3 times:
1. Stop attempting
2. Report what happened
3. Offer alternatives (user takes over, try different approach)

### Common Issues

| Issue | Solution |
|-------|----------|
| Page not loading | Wait longer, refresh, check URL |
| Element not found | Try different query, screenshot to verify |
| Click not working | Verify coordinates with screenshot, try `ref` instead |
| Tab ID invalid | Call `tabs_context_mcp` for fresh IDs |

---

## Anti-Patterns

### DON'T guess at page state
Always screenshot before making assumptions about what's on screen.

### DON'T rapid-fire actions
Wait between actions for page to respond.

### DON'T fight with complex forms
If a form is complex or requires login, hand off to user.

### DON'T forget to capture
After user completes actions, always screenshot to extract confirmation details.

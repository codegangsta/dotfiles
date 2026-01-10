---
name: ask-questions
description: Use AskUserQuestion tool with prefilled options for clearer communication
user_invocable: false
---

# Asking Questions

When Claude needs user input, use the `AskUserQuestion` tool with thoughtful prefilled options.

---

## When to Use AskUserQuestion

Use this tool when:
- Clarifying user intent or requirements
- Offering implementation choices
- Confirming before consequential actions
- Gathering preferences

**Don't use for:**
- Simple yes/no confirmations (just ask in text)
- Open-ended creative questions
- Situations where options can't reasonably be anticipated

---

## Best Practices

### Anticipate Likely Answers

Before asking, think: "What would the user most likely answer?"

**Good options:**
- Common choices in the domain
- Options that match context clues from the conversation
- A recommended option (mark as first with "(Recommended)")

**Bad options:**
- Options that are too similar
- Overly technical when user is non-technical
- Missing obvious choices

### Structure Questions Clearly

| Field | Guidance |
|-------|----------|
| `header` | Short label (max 12 chars): "Approach", "Format", "Target" |
| `question` | Complete, specific question ending with `?` |
| `options` | 2-4 distinct choices with clear descriptions |
| `multiSelect` | `true` when choices aren't mutually exclusive |

### Example Patterns

**Clarifying approach:**
```json
{
  "questions": [{
    "header": "Approach",
    "question": "How should I structure the new API endpoint?",
    "multiSelect": false,
    "options": [
      {"label": "REST (Recommended)", "description": "Standard REST endpoint matching existing patterns"},
      {"label": "GraphQL", "description": "Add to existing GraphQL schema"},
      {"label": "Both", "description": "Support both REST and GraphQL"}
    ]
  }]
}
```

**Gathering preferences:**
```json
{
  "questions": [{
    "header": "Output",
    "question": "What format would you like for the report?",
    "multiSelect": false,
    "options": [
      {"label": "Markdown", "description": "Easy to read and share"},
      {"label": "JSON", "description": "Machine-readable for further processing"},
      {"label": "CSV", "description": "Import into spreadsheets"}
    ]
  }]
}
```

**Multiple selections:**
```json
{
  "questions": [{
    "header": "Features",
    "question": "Which features should the component include?",
    "multiSelect": true,
    "options": [
      {"label": "Pagination", "description": "Navigate through large datasets"},
      {"label": "Sorting", "description": "Click columns to sort"},
      {"label": "Filtering", "description": "Search/filter rows"},
      {"label": "Export", "description": "Download as CSV"}
    ]
  }]
}
```

---

## Anti-Patterns

### DON'T ask in plain text when options are clear

```
Bad:  "Should I use TypeScript or JavaScript?"
Good: AskUserQuestion with TS/JS options and descriptions
```

### DON'T provide vague option descriptions

```
Bad:  {"label": "Option A", "description": "One approach"}
Good: {"label": "Inline styles", "description": "Quick to implement, harder to maintain"}
```

### DON'T forget the recommended option

If there's a clearly better choice, put it first with "(Recommended)".

### DON'T overuse for simple questions

For quick confirmations, plain text is fine:
```
"I'll delete the old migration files. Sound good?"
```

---

## Remember

Users can always select "Other" to provide custom input, so don't stress about covering every edge case. Focus on the 2-4 most likely answers.

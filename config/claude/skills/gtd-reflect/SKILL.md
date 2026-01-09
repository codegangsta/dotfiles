---
name: gtd-reflect
description: End-of-day reflection - review completed tasks and identify automation opportunities
---

# GTD Reflect

> **Reference:** See `things3` skill for task requirements, tag taxonomy, and MCP operations.

Review completed tasks and identify opportunities to improve workflows and automation.

## Workflow

### 1. Gather Completed Tasks

Get today's completed tasks from logbook:

```
mcp__things__get_logbook(period="1d")
```

### 2. Categorize Completions

Group by type:
- **Agent-completed** - Tasks Claude helped with
- **Human-completed** - Done manually
- **Quick wins** - 2m/5m tasks
- **Deep work** - 25m/1h+ tasks

### 3. Analyze Patterns

Look for:

- **Recurring tasks** - Could be templated/automated?
- **Time estimate accuracy** - Tasks that took longer/shorter?
- **Agent effectiveness** - What worked? What didn't?
- **Automation opportunities** - Repetitive steps? Research Claude could do?

### 4. Identify Improvements

Categories:
- New skills to create
- Existing skills to enhance
- AppleScript automations
- Tag/project structure changes

### 5. Propose Improvements

For each identified improvement:

```
Improvement: [Description]
Type: [New skill / Enhance existing / AppleScript / Structure]
Effort: [Quick / Medium / Significant]
Impact: [High / Medium / Low]

Suggested implementation:
[Details]

Add to inbox? [Y/n]
```

### 6. Create Improvement Tasks

For approved improvements, create tasks in Things (following `things3` skill requirements).

### 7. Report Summary

```
Daily Reflection Complete!

Completed Today: X tasks
- Agent-assisted: Y
- Human only: Z
- Quick wins: N
- Deep work: M

Patterns Identified:
- [Pattern 1]
- [Pattern 2]

Improvements Proposed:
1. [Improvement 1] - Added to inbox
2. [Improvement 2] - Added to inbox

Great day! X tasks completed, Y improvements identified.
```

## Guidelines

- **Be honest** - Acknowledge what didn't work
- **Look for patterns** - Single occurrences aren't trends
- **Prioritize impact** - Focus on high-value improvements
- **Keep it brief** - 5-10 minutes, not a deep dive
- **Create actionable tasks** - Vague "improve X" isn't helpful

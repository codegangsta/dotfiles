---
name: gtd-reflect
description: End-of-day reflection - review completed tasks and identify automation opportunities
---

# GTD Reflect

Review completed tasks and identify opportunities to improve workflows and automation.

## Workflow

### 1. Gather Completed Tasks

Get today's completed tasks from the logbook:

```applescript
tell application "Things3"
    set output to ""
    set today to current date
    set todayStart to today - (time of today)
    repeat with t in (to dos of list "Logbook")
        try
            if completion date of t ≥ todayStart then
                set output to output & name of t & "|" & tag names of t & linefeed
            end if
        end try
    end repeat
    return output
end tell
```

### 2. Categorize Completions

Group tasks by type:
- **Agent-completed** - Tasks Claude helped with
- **Human-completed** - Tasks done manually
- **Quick wins** - 2m/5m tasks
- **Deep work** - 25m/1h+ tasks

### 3. Analyze Patterns

Look for:

#### Recurring Task Types
- Are there tasks that repeat daily/weekly?
- Could these be templated or automated?

#### Time Estimate Accuracy
- Tasks that took longer than estimated?
- Tasks that were faster than expected?
- Should time estimates be adjusted?

#### Agent Effectiveness
- What did Claude help with effectively?
- What tasks were better left to human?
- Any failed agent attempts?

#### Automation Opportunities
- Tasks with repetitive steps?
- Tasks that required research Claude could do?
- Tasks that could be scripted?

### 4. Identify Improvements

Categories of improvements:

#### New Skills to Create
- Identify patterns that could be new `/gtd:` commands
- Draft skill specifications

#### Existing Skills to Enhance
- What's missing from current skills?
- What workflows are clunky?

#### AppleScript Automations
- Repetitive Things 3 operations
- Calendar/Mail integrations
- Cross-app workflows

#### Tag/Project Structure Changes
- Missing tags?
- Underused tags to remove?
- Project organization improvements?

### 5. Propose Improvements

For each identified improvement:

```
Improvement: [Description]
Type: [New skill / Enhance existing / AppleScript / Structure]
Effort: [Quick / Medium / Significant]
Impact: [High / Medium / Low]

Suggested implementation:
[Details]

Add to inbox for later? [Y/n]
```

### 6. Create Improvement Tasks

For approved improvements:

```applescript
tell application "Things3"
    make new to do with properties {name:"Create skill: [name]", tag names:"25m"} at end of list "Inbox"
end tell
```

### 7. Report Summary

```
Daily Reflection Complete!

Completed Today: X tasks
- Agent-assisted: Y
- Human only: Z
- Quick wins: N
- Deep work: M

Time Accuracy:
- Underestimated: 2 tasks (avg +15m)
- Overestimated: 1 task (-10m)

Patterns Identified:
- [Pattern 1]
- [Pattern 2]

Improvements Proposed:
1. [Improvement 1] - Added to inbox
2. [Improvement 2] - Added to inbox

Agent Effectiveness:
- Research tasks: Excellent
- Code tasks: Good
- Email drafts: Needs improvement (too formal)

Great day! X tasks completed, Y improvements identified.
```

## Guidelines

- **Be honest** - Acknowledge what didn't work
- **Look for patterns** - Single occurrences aren't trends
- **Prioritize impact** - Focus on high-value improvements
- **Keep it brief** - 5-10 minutes, not a deep dive
- **Create actionable tasks** - Vague "improve X" isn't helpful
- **Iterate** - Small improvements compound over time

## Example Improvement Proposals

### New Skill Example
```
Improvement: Create /gtd:email-triage skill
Type: New skill
Effort: Medium
Impact: High

Noticed: Processed 8 emails today, similar workflow each time
Proposed skill would:
- Fetch unread emails
- Categorize by urgency
- Draft quick responses
- Flag for human review

Add to inbox? [Y/n]
```

### AppleScript Example
```
Improvement: Auto-tag tasks from specific projects
Type: AppleScript automation
Effort: Quick
Impact: Medium

Noticed: Always adding "Kajabi" context to work tasks manually
Could script: When task added to "Work" area, auto-add work-related tags

Add to inbox? [Y/n]
```

### Structure Example
```
Improvement: Add "Energy" tags (High/Low)
Type: Tag structure
Effort: Quick
Impact: Medium

Noticed: Some tasks need high focus, others can be done tired
Tags like "High Energy" and "Low Energy" could help with task selection

Add to inbox? [Y/n]
```

---
name: plan-to-project
description: Convert a plan or specification into a Things 3 project with agent-ready tasks
args: project name or plan file path
---

# Plan to Project

> **Reference:** See `things3` skill for task requirements, tag taxonomy, and MCP operations.

Convert a **plan, specification, or research session** into a well-structured Things 3 project with tasks that agents can pick up and execute autonomously.

## When to Use

Use this skill when:
- You've completed research or planning and want to capture next steps
- You have a plan file (from plan mode) to convert
- The user describes a project and wants it tracked in Things 3
- Breaking down a large initiative into actionable tasks

## Arguments

The skill receives a project name or plan file path as `$ARGUMENTS`. Examples:
- `/plan-to-project Build things CLI` - Create from conversation context
- `/plan-to-project ~/.claude/plans/my-plan.md` - Create from plan file

## Workflow

### 1. Gather Context

If a plan file is provided, read it:
```
Read(file_path="$ARGUMENTS")
```

If creating from conversation, synthesize the key decisions, architecture, and tasks from the discussion.

### 2. Create Project with Rich Context

Create the project with comprehensive notes that give agents full context:

```
mcp__things__add_project(
    title="Project Title",
    notes="## Overview
[1-2 sentence summary of what this project accomplishes]

## Why This Matters
[Business/personal value - why is this worth doing?]

## Architecture/Approach
[Key technical or strategic decisions made]

## Key Resources
- [Links to docs, repos, references]
- [Related files or tools]

## Context from Planning
[Important decisions, constraints, or findings from research]",
    area_title="[Appropriate Area]",
    tags=["1h"]  # Estimated total time
)
```

### 3. Break Down Into Agent-Ready Tasks

For each task, create with:
1. **Verb-first title** - Action-oriented, specific
2. **Detailed notes** - Everything an agent needs to execute independently
3. **Time estimate tag** - 2m, 5m, 25m, or 1h+
4. **Agent/Queued tag** - Ready for agent pickup

#### Task Note Template

```
mcp__things__add_todo(
    title="Implement [specific thing]",
    notes="## Context
[Why this task exists, what problem it solves]

## Steps
1. [Specific step 1]
2. [Specific step 2]
3. [Specific step 3]

## Implementation Details
[Technical specifics, code patterns, file locations]

## Acceptance Criteria
- [How to know it's done]
- [What to verify]

## References
- [Links, docs, examples]",
    list_id="<project-uuid>",
    tags=["25m", "Agent/Queued"]
)
```

### 4. Task Ordering

Create tasks in logical execution order:
1. **Foundation first** - Setup, infrastructure, dependencies
2. **Core functionality** - Main features in order of dependency
3. **Polish last** - Tests, docs, distribution

Things 3 preserves creation order, so agents will work through tasks in the right sequence.

### 5. Task Sizing Guidelines

| Size | Tag | Description | Example |
|------|-----|-------------|---------|
| Tiny | `2m` | Single command or lookup | "Check if dependency exists" |
| Small | `5m` | Quick implementation | "Add import statement" |
| Medium | `25m` | Focused work session | "Implement database connection" |
| Large | `1h+` | Deep work, may need breaking down | "Design API interface" |

If a task is larger than 1h+, consider:
- Breaking into subtasks within the same project
- Creating a sub-project

### 6. Report Creation Summary

After creating the project, report:

```
Created project: [Project Name]

Tasks ([count] total):

Phase 1: [Phase Name]
1. [ ] Task 1 [25m]
2. [ ] Task 2 [25m]

Phase 2: [Phase Name]
3. [ ] Task 3 [1h]
...

All tasks tagged Agent/Queued and ready for pickup.
```

## Quality Checklist

Before finishing, verify each task has:

- [ ] **Verb-first title** - Starts with action verb
- [ ] **Context section** - Why this task exists
- [ ] **Steps or implementation details** - How to do it
- [ ] **Acceptance criteria** - How to know it's done
- [ ] **Time estimate tag** - 2m/5m/25m/1h+
- [ ] **Agent/Queued tag** - Ready for pickup
- [ ] **Project assignment** - Belongs to the created project

## Example: From Research to Project

**Input:** A conversation researching "how to build a Go CLI for Things 3"

**Output:**

```
Project: Build `things` Go CLI for Things 3
Notes:
## Overview
High-performance CLI using SQLite reads + URL scheme writes.

## Why This Matters
- 10-100x faster than AppleScript
- Enables field selection to reduce tokens for Claude
- No existing tool combines SQLite + URL writes

## Architecture
cmd/ - Cobra commands
internal/db/ - SQLite queries
internal/urlscheme/ - URL scheme writes
internal/output/ - JSON, table formatters

## Key Resources
- things.py: https://github.com/thingsapi/things.py
- URL Scheme: https://culturedcode.com/things/support/articles/2803573/

Tasks (20):
1. Initialize Go module and create repo structure [25m]
2. Implement database connection with auto-discovery [25m]
3. Port Things date format conversion [25m]
...
```

## Anti-Patterns

### DON'T create vague tasks
Bad: "Work on database stuff"
Good: "Implement database connection with auto-discovery"

### DON'T skip context in notes
Agents need full context to work autonomously. Include why, how, and acceptance criteria.

### DON'T create tasks without time estimates
Every task needs a time tag for prioritization.

### DON'T forget Agent/Queued tag
Tasks without this tag won't be picked up by agents.

### DON'T create orphan tasks
Every task must belong to the project you just created.

## MCP Tools Reference

| Operation | MCP Tool |
|-----------|----------|
| Create project | `mcp__things__add_project(title, notes, area_title, tags)` |
| Add task to project | `mcp__things__add_todo(..., list_id="<project-uuid>")` |
| Get project UUID | `mcp__things__get_projects()` then find by title |
| Show project in Things | `mcp__things__show_item(id="<project-uuid>")` |

---
name: commit
description: Stage and commit changes with a detailed message
---

# Commit

Stage all changes and create a well-structured commit.

## Workflow

### 1. Gather Context

Run these commands in parallel:

```bash
git status                    # See all changes
git diff                      # See unstaged changes
git diff --staged             # See already staged changes
git log --oneline -5          # See recent commit style
```

### 2. Analyze Changes

Review what changed:
- Which files were modified, added, or deleted?
- What's the nature of the change (feature, fix, refactor, docs, etc.)?
- Are there any files that should NOT be committed (secrets, generated files)?

### 3. Stage Changes

Stage all relevant changes:

```bash
git add <files>
```

**Do NOT stage:**
- `.env` files or credentials
- Generated files that shouldn't be tracked
- Unrelated changes (ask user if unsure)

### 4. Write Commit Message

Use this format:

```
<type>: <concise summary>

<detailed description if needed>
- Bullet points for multiple changes
- Explain the "why" not just the "what"

Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>
```

**Types:**
- `feat` - New feature
- `fix` - Bug fix
- `refactor` - Code restructuring
- `docs` - Documentation only
- `style` - Formatting, no code change
- `test` - Adding tests
- `chore` - Maintenance tasks

### 5. Commit

```bash
git commit -m "$(cat <<'EOF'
<commit message here>

Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>
EOF
)"
```

### 6. Verify

```bash
git status    # Should show clean tree or ahead of origin
```

Report the commit hash and summary to the user.

## Guidelines

- **Match repo style** - Look at recent commits for conventions
- **Atomic commits** - One logical change per commit
- **Descriptive messages** - Future you will thank present you
- **Never push** - Only commit, let user decide when to push
- **Ask if unsure** - If changes seem unrelated or risky, ask first

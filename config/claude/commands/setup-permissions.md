---
description: Set up liberal but safe Claude Code permissions for a project
---

Analyze this project and set up appropriate Claude Code permissions in `.claude/settings.local.json`.

## Steps

1. **Detect Project Type** by looking for:
   - `Gemfile` or `config/application.rb` → Ruby/Rails
   - `package.json` → Node.js
   - `Cargo.toml` → Rust
   - `go.mod` → Go
   - `requirements.txt` or `pyproject.toml` → Python
   - `pom.xml` or `build.gradle` → Java

2. **Check Existing Config** at `.claude/settings.local.json`

3. **Create/Update Permissions** based on project type

## Permission Templates

### Ruby/Rails
```json
{
  "permissions": {
    "allow": [
      "Bash(bin/rails:*)",
      "Bash(bin/rspec:*)",
      "Bash(bin/rake:*)",
      "Bash(bin/bundle:*)",
      "Bash(bin/setup:*)",
      "Bash(bin/dev:*)",
      "Bash(bundle exec:*)",
      "Bash(spring:*)",
      "Bash(docker-compose:*)",
      "Bash(docker compose:*)"
    ],
    "deny": [
      "Read(./.env)",
      "Read(./.env.*)",
      "Read(./config/credentials/*)",
      "Read(./config/master.key)",
      "Edit(./.env)",
      "Edit(./.env.*)",
      "Edit(./config/credentials/*)",
      "Edit(./config/master.key)"
    ]
  }
}
```

### Node.js
```json
{
  "permissions": {
    "allow": [
      "Bash(npm run:*)",
      "Bash(yarn:*)",
      "Bash(pnpm:*)",
      "Bash(npx:*)",
      "Bash(node:*)",
      "Bash(tsx:*)",
      "Bash(vite:*)",
      "Bash(next:*)",
      "Bash(docker-compose:*)",
      "Bash(docker compose:*)"
    ],
    "deny": [
      "Read(./.env)",
      "Read(./.env.*)",
      "Read(./.env.local)",
      "Edit(./.env)",
      "Edit(./.env.*)",
      "Edit(./.env.local)"
    ]
  }
}
```

### Python
```json
{
  "permissions": {
    "allow": [
      "Bash(python:*)",
      "Bash(pip:*)",
      "Bash(poetry:*)",
      "Bash(pdm:*)",
      "Bash(uv:*)",
      "Bash(pytest:*)",
      "Bash(ruff:*)",
      "Bash(black:*)",
      "Bash(mypy:*)",
      "Bash(docker-compose:*)",
      "Bash(docker compose:*)"
    ],
    "deny": [
      "Read(./.env)",
      "Read(./.env.*)",
      "Read(./secrets/*)",
      "Edit(./.env)",
      "Edit(./.env.*)",
      "Edit(./secrets/*)"
    ]
  }
}
```

### Go
```json
{
  "permissions": {
    "allow": [
      "Bash(go:*)",
      "Bash(docker-compose:*)",
      "Bash(docker compose:*)"
    ],
    "deny": [
      "Read(./.env)",
      "Read(./.env.*)",
      "Edit(./.env)",
      "Edit(./.env.*)"
    ]
  }
}
```

### Rust
```json
{
  "permissions": {
    "allow": [
      "Bash(cargo:*)",
      "Bash(rustc:*)",
      "Bash(docker-compose:*)",
      "Bash(docker compose:*)"
    ],
    "deny": [
      "Read(./.env)",
      "Read(./.env.*)",
      "Edit(./.env)",
      "Edit(./.env.*)"
    ]
  }
}
```

## Guidelines

- Preserve any existing custom permissions in the allow list
- Always deny access to `.env`, credentials, and secrets files
- Add project-specific bin scripts and test runners you discover
- Look for `bin/` scripts and add them to the allow list
- If multiple project types detected, merge their permissions

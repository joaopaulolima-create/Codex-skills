# Codex Skills

Reusable Codex skills packaged so they can be installed independently on
Windows, macOS, or Linux.

## Available skills

| Skill | Purpose | Extra dependency |
|---|---|---|
| `remove-ai-marks` | Remove AI provenance marks and metadata from content you own | Optional format-specific tools and rewrite backends |
| `local-seo-content-planner` | Research local search demand, request topic approval, and create location-based content | Ubersuggest MCP for live keyword data |
| `seo-local-clientes` | Run end-to-end local SEO projects from onboarding through Google Business Profile, website, measurement, deployment, and reporting | Optional Google, Ubersuggest, hosting, and browser tools |
| `seo-audit` | Diagnose technical, on-page, content, ranking, and local SEO issues | Optional SEO/browser tools |
| `schema` | Create and validate Schema.org/JSON-LD markup | None |
| `systematic-debugging` | Reproduce failures and trace root causes before fixing | Project test tools |
| `verification-before-completion` | Require fresh evidence before completion claims | None |
| `subagent-driven-development` | Execute an approved plan with focused implementation and review stages | A platform that permits subagents; falls back to inline execution |
| `ralph-loop-workflow` | Run a safe, resumable, long-running development loop | Project-specific tools discovered during preflight |

## Download

Use GitHub's **Code → Download ZIP** option, or clone the repository:

```bash
git clone https://github.com/joaopaulolima-create/Codex-skills.git
cd Codex-skills
```

## Install one skill

Each directory under `skills/` is self-contained. Copy the complete directory
to the `skills` directory inside your Codex home.

### Windows PowerShell

```powershell
$CodexSkills = Join-Path $env:USERPROFILE ".codex\skills"
New-Item -ItemType Directory -Force -Path $CodexSkills | Out-Null
Copy-Item -Recurse -Path ".\skills\seo-audit" -Destination $CodexSkills
```

### macOS or Linux

```bash
CODEX_SKILLS="${CODEX_HOME:-$HOME/.codex}/skills"
mkdir -p "$CODEX_SKILLS"
cp -R "./skills/seo-audit" "$CODEX_SKILLS/"
```

Replace `seo-audit` with the desired skill name. If that destination already
exists, review and remove or rename the old copy before installing; do not
silently overwrite local customizations.

## Install all skills

Copy every directory under `skills/` into your Codex skills directory using
your operating system's file manager or a reviewed copy command. Restart or
refresh Codex after installation, then invoke a skill by name, for example:

```text
Use $seo-audit to review example.com.
```

## Package standard

Every installable skill contains:

- `SKILL.md` with the trigger description and workflow;
- `agents/openai.yaml` with Codex display metadata and a default prompt;
- only relative links to files included with that skill;
- explicit notes for optional external tools or account connections.

Supporting files such as `references/`, `scripts/`, prompts, and evals must
remain inside the skill directory when it is copied.

## Safety and portability

Skills must inspect the current project before choosing commands or tools.
They must not assume a package manager, hosting provider, database, browser
driver, shell, port, or authentication state. External side effects such as
publishing, deploying, merging, or writing to production systems require the
user's authorization.

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
| `computer-use-workflows` | Operate desktop apps and browser interfaces with visual verification and explicit side-effect boundaries | A compatible native computer-control or browser-control tool |
| `agente-chefe` | Turn vague or multidisciplinary requests into a coordinated plan and orchestrate only the agents and skills that improve the result | Optional subagents and task-specific skills |

## Vendored third-party bundles

The repository also contains the requested upstream skill collections under
`vendor/<bundle>/skills/`. They are kept separate from the first-party `skills/`
directory so duplicate names do not overwrite your own skills.

| Bundle | Version | Skills | Main use |
|---|---:|---:|---|
| `anthropic-agent-skills` | snapshot 2026-10-27 | 14 | Design, development, communication, and creative workflows |
| `superpowers` | 7.0.1 | 15 | Planning, testing, debugging, review, and delivery discipline |
| `ponytail` | 5.3.2 | 6 | Small changes, repository audit, review, and technical-debt tracking |
| `ui-ux-pro-max` | 2.15.0 | 7 | UI/UX, design systems, branding, banners, and slides |
| `understand-anything` | 2.9.8 | 9 | Codebase maps, onboarding, architecture explanations, and diff analysis |
| `sales` | 2.1.0 | 36 | Account research, outreach, objections, pipeline, forecasting, and closing |
| `b2b-outreach-suite` | snapshot 2026-10-27 | 1 | Cold B2B prospecting, ICP definition, sequences, and personalization |
| `google-maps-scraper` | 1.12.1-hardened.1 | 1 | Small, targeted local-business discovery by niche and location |

See [VENDORED_SOURCES.md](VENDORED_SOURCES.md) for origins and licenses.

The Anthropic document skills (`docx`, `pdf`, `pptx`, and `xlsx`) are not
mirrored because their source-available terms prohibit redistribution. Install
those directly from Anthropic's official plugin marketplace as documented in
`vendor/anthropic-agent-skills/NOTICE.md`.

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

For a vendored skill, copy its complete directory from the selected bundle. For
example, on Windows:

```powershell
$CodexSkills = Join-Path $env:USERPROFILE ".codex\skills"
Copy-Item -Recurse ".\vendor\sales\skills\draft-outreach" $CodexSkills
Copy-Item -Recurse ".\vendor\b2b-outreach-suite\skills\b2b-outreach-suite" $CodexSkills
Copy-Item -Recurse ".\vendor\google-maps-scraper\skills\google-maps-scraper" $CodexSkills
```

On macOS or Linux:

```bash
CODEX_SKILLS="${CODEX_HOME:-$HOME/.codex}/skills"
cp -R "./vendor/sales/skills/draft-outreach" "$CODEX_SKILLS/"
cp -R "./vendor/b2b-outreach-suite/skills/b2b-outreach-suite" "$CODEX_SKILLS/"
cp -R "./vendor/google-maps-scraper/skills/google-maps-scraper" "$CODEX_SKILLS/"
```

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

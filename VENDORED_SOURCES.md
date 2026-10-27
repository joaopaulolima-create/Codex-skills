# Third-party skill bundles

This repository vendors the skill files below so they can be reviewed, versioned,
and installed independently. Copyright remains with each upstream author. The
license shipped with each bundle is preserved beside its files. Upstream
frontmatter is adapted only where required for Codex compatibility; operational
instructions and supporting assets otherwise remain unchanged.

| Bundle | Pinned version | Upstream | Included skills |
|---|---:|---|---:|
| Anthropic Agent Skills | snapshot installed 2026-10-27 | <https://github.com/anthropics/skills> | 14 |
| Superpowers | 7.0.1 | <https://github.com/obra/superpowers> | 15 |
| Ponytail | 5.3.2 | <https://github.com/DietrichGebert/ponytail> | 6 |
| UI UX Pro Max | 2.15.0 | <https://github.com/nextlevelbuilder/ui-ux-pro-max-skill> | 7 |
| Understand Anything | 2.9.8 | <https://github.com/Egonex-AI/Understand-Anything> | 9 |
| Anthropic Sales | 2.1.0 | <https://github.com/anthropics/knowledge-work-plugins> | 36 |
| B2B Outreach Suite | snapshot installed 2026-10-27 | <https://github.com/microsoft/cat-agent-skills/tree/main/submissions/b2b-outreach-suite> | 1 |

The local `computer-use-workflows` skill is original to this repository. It
does not copy the proprietary Computer Use bundle shipped with Codex; it routes
compatible environments to their native computer-control tools and preserves
authorization boundaries for external side effects.

## Layout

- `skills/`: first-party skills maintained in this repository.
- `vendor/<bundle>/skills/`: upstream skill directories with minimal Codex
  frontmatter compatibility edits where required.
- `vendor/<bundle>/LICENSE*`: the upstream license or notices for that bundle.

## Updating

Review upstream changes before replacing a vendored directory. Update the
version in this file, preserve the applicable license and notices, and validate
every directory that contains a `SKILL.md` before committing.

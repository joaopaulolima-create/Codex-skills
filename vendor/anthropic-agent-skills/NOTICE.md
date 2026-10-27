# Anthropic Agent Skills licensing

Only the skills carrying an Apache License 2.0 `LICENSE.txt` are vendored here.

The upstream `docx`, `pdf`, `pptx`, and `xlsx` skills are source-available under
terms that prohibit retaining and redistributing copies outside Anthropic's
services, so they are intentionally not mirrored in this public repository.
The upstream `doc-coauthoring` directory is also omitted because the installed
snapshot did not include an explicit license file.

Install the document plugin from the official marketplace instead:

```text
/plugin marketplace add anthropics/skills
/plugin install document-skills@anthropic-agent-skills
```

Upstream: <https://github.com/anthropics/skills>

---
name: ralph-loop-workflow
description: Use for a long-running, outcome-focused development loop that repeatedly plans, implements, verifies, and records progress. Run a project-specific preflight first and stop for missing authority, credentials, destructive actions, or external side effects.
---

# Ralph Loop Workflow

Run a durable development loop that turns a broad outcome into small verified
increments. The loop is autonomous only inside the scope the user authorized.

## Preconditions

Before starting:

1. Read the repository instructions and the user's outcome.
2. Inspect the project's own package manager, scripts, test framework, runtime,
   services, and deployment target. Do not assume a specific stack.
3. Identify which tools and credentials are actually required.
4. Verify each requirement with a non-destructive command.
5. Confirm that the work is isolated from production data and shared branches.

If the outcome is missing, ask for it. If a required credential, approval, or
tool is missing, report the exact blocker and stop. Never broaden permissions,
log in interactively, migrate production data, deploy, publish, or merge unless
the user explicitly authorized that action.

## The Loop

```text
outcome
  -> project-specific preflight
  -> prioritized task list
  -> smallest useful implementation
  -> tests and relevant checks
  -> progress record
  -> next task
```

For each iteration:

1. Read the current code, instructions, progress record, and recent diff.
2. Select the highest-priority unfinished task within the authorized scope.
3. Define observable acceptance criteria.
4. Implement the smallest coherent change.
5. Run the project's actual verification commands.
6. Reproduce and fix failures before continuing.
7. Update user-facing documentation and changelogs when the change requires it.
8. Record the result, evidence, decisions, and next task.
9. Commit only when commits are part of the requested workflow.

Keep a compact progress file in a repository-approved scratch location so the
loop can resume after interruption or context compaction. Do not rely on chat
memory alone.

## Verification

Infer checks from the repository instead of hardcoding commands. Typical
categories include:

- type checking or compilation;
- formatting and linting;
- unit, integration, and end-to-end tests;
- browser or API interaction at the project's configured local URL;
- database migration checks against an explicitly isolated test database;
- deployment and runtime logs, only when deployment is authorized.

A check is valid only when it matches the current project. Do not assume Bun,
Node.js, a localhost port, a browser driver, Vercel, Neon, or any other vendor.
Treat examples in project documentation as hints until confirmed.

Before any database migration, prove the target is disposable or explicitly
approved. Before any production check, confirm that reading logs or exercising
the deployed system is within scope.

## Preflight Report

Report a short checklist:

```text
Preflight
  [ok]   package manager     detected from lockfile and scripts
  [ok]   test command        runs without changing external state
  [fail] deployment access   authentication required

Blocked: authenticate with the project's documented method, then rerun preflight.
```

Use non-destructive version, status, or identity commands. Never expose tokens
or secrets in output. For interactive authentication, give the user the
official project-specific step and wait for them to complete it.

## Stop Conditions

Stop and ask before:

- destructive or irreversible actions;
- security-sensitive changes or secret handling;
- writes outside the authorized workspace;
- migrations against data that is not proven disposable;
- pushes, merges, releases, deployments, purchases, or publications not
  explicitly approved;
- a plan so ambiguous that proceeding would materially change the outcome.

Otherwise, continue until all in-scope tasks have fresh verification evidence
or a concrete blocker remains.

## Steering

Improve the loop by sharpening the outcome, acceptance criteria, tests, and
tool access. When repeated attempts fail, return to root-cause analysis,
reduce the task, and record what was tried instead of accumulating speculative
fixes.

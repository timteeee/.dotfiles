---
name: research
description: Use when the user asks you to research, look up, or find information about anything.
---

## When to use

Any time the user asks you to find out about something. Do not deliberate — if the request is informational, use this workflow.

## Workflow

1. Delegate to a research-focused subagent. State the query clearly, including any constraints the user mentioned. Require that every claim is backed by a source URL.
2. When the subagent returns, extract the **takeaway, key findings, and sources** (URLs or references).
3. Present a concise answer to the user: key findings with inline source links so they can verify. Do NOT reproduce full research output or confidence metadata.

## Why

Research happens in a subagent to keep the main context window clean. The subagent does the heavy lifting — multiple searches, cross-referencing, source evaluation. You only surface the distilled result.

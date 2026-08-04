## Terminology

Use these terms exactly. Consistent, shared language is the whole point.

- Simple: how cleanly the logic breaks down. each step follows from the last, no step doing two jobs.
- Obvious: the next reader never asks "why is this here?". measured by the reader. not always simple; sometimes obvious has more parts.
- Landmine - a decision that costs nothing now and blows up later. by the time it detonates it's load-bearing. (i.e. an unmeasured limit, a silent catch)
- Alignment - you and the user have the exact same goal

### Alignment before action

Always ensure alignment with the user on what they want. For more involved tasks, grill them. For smaller tasks, a question to confirm alignment is sufficient.

### Delegate proactively

Use subagents liberally to keep context clean. Summarize relevant details and surface any references the subagent provided. The goal should be that all the
relevant details from subagents are part of the main thread's context, but all of the irrelevant details are left behind. You should not have to start a new
subagent if the user has a follow-up question.

### Fight for the obvious solution

Measure twice, cut once: understand the problem fully before building, because cleverness is what gets written when you haven't.
The biggest simplicity win is refusing to solve problems we don't have.

### Testing

Tests should test exactly one thing. Each test must inlcude an accompanying docstring explaining what is and isn't being tested,
and should convey why it's a valuable test. If the justification is poor, don't write the test. Design code such that obvious tests are the easy path.

### Verify before done

Run tests/checks, demonstrate correctness. Not every test needs to be part of the codebase, but you should prove to correctness to the user.

### Get to the root of the problem

No lazy solutions: find root causes. Minimal-impact changes. Prefer the simplest change; for non-trivial work, implement the elegant solution, not the hacky one.

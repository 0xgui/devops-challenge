# Mid DevOps Docker Live Test

**Goal**: Verify the candidate can build, run, debug, and reason about containers — not just talk.

## The Scenario

You are given a small repo with a simple Flask app. The app fails to start or is unreachable.

## Task

> “This app is containerized but not reachable.  
> Please build it, run it, debug the issue, and fix it.  
> Explain what you’re doing and why.”

## Requirements

- Screen sharing ON
- Candidate drives
- No prepared repos
- Docs allowed, AI not allowed
- Think out loud

## Expected Candidate Flow (Strong Signal)

A mid-level DevOps Engineer should:

1. **Build and run**: `docker-compose up --build`
2. **Notice app is “running” but unreachable`
3. **Check logs**: `docker logs`
4. **Inspect app config**
5. **Recognize 127.0.0.1 issue**
6. **Fix to**: `app.run(host="0.0.0.0", port=port)`
7. **Rebuild and verify**
8. **Explain why this failed and how to prevent it**

## Red Flags (Immediate Reject)

- Random guessing
- Rebuilding repeatedly without inspecting logs
- Doesn’t understand `0.0.0.0`
- Can’t explain port mapping
- Freezes without AI

## Strong Hire Signals

- Checks logs first
- Explains container networking clearly
- Makes minimal, deliberate changes
- Talks about prevention:
    - Health checks
    - Documentation
    - Tests
    - Compose defaults

## Follow-Up Questions (Critical)

After they fix it, ask:

- “Why did this work locally but not in Docker?”
- “How would this behave in Kubernetes?”
- “How would you add health checks?”
- “How would you handle secrets here?”
- “How would you slim this image?”

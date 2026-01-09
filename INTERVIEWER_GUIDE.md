# Mid DevOps Docker Live Test

**Goal**: Verify the candidate can build, run, debug, and reason about containers — not just talk.

## The Scenario

You are given a broken repository with a Flask app. It crashes on startup due to improper dependency management and, once fixed, is unreachable due to networking misconfiguration.

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

1. **Run**: `docker-compose up --build`
2. **Observe Crash**: Container exits immediately with `ModuleNotFoundError: No module named 'requests'`.
3. **Fix 1**: Add `requests` to `requirements.txt`.
4. **Rebuild & Run**: App starts, but `curl localhost:8080` (or browser) fails.
5. **Debug Network**: Checks `docker logs`, sees `Running on http://127.0.0.1:5000`.
6. **Fix 2**: Edit `app.py` to change host to `"0.0.0.0"` (or use equivalent env var).
7. **Verify**: App is reachable and returns "Hello from Docker!".
8. **(Bonus) Security**: Notices the hardcoded `API_KEY` in `docker-compose.yml` and mentions it's unsafe.

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

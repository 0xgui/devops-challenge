# Mid DevOps high-signal Challenge

**Goal**: Verify debugging depth by troubleshooting a container restart loop.

## The Scenario

You are provided with a service that **looks** configured correctly but crashes in a loop when run in "production" mode.

## Task

> "The container starts but doesn't stay up. It keeps restarting. Please fix it."

## Expected Candidate Flow (Strong Signal)

1. **Run**: `docker-compose up --build`
2. **Observe**: Container enters a restart loop (`Up Less than a second` or continuous logs).
3. **Debug**: `docker logs <container>` to see the specific Python error:
   > `ERROR: Missing required configuration for prod`
4. **Analyze**: Reads `app.py` or `docker-compose.yml` to understand why `ENV=prod` triggers failure.
5. **Fix**:
   - Option A: Change `APP_ENV` to `dev`.
   - Option B: Add the missing functionality/config (if hypothetically requested).
   - Option C: Remove `restart: always` to see the crash clearly (good debugging step).
6. **Prevention**: Discusses health checks and better logging.

## Red Flags (Immediate Reject)

- **Blindly ignores logs**: Just keeps running `up` hoping it works.
- **Doesn't understand restart policies**: Thinks `restart: always` fixes crashes.
- **Blames Docker** without reading the application code.

## Follow-Up Questions

- "Why is `restart: always` dangerous without a health check?" (Answer: Infinite loops mask failures).
- "How would you detect this in Kubernetes?" (Answer: CrashLoopBackOff).
- "How would you implement a health check for this Python app?"

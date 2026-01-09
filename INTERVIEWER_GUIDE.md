# Mid DevOps high-signal Challenge

**Goal**: Verify debugging depth regarding Linux permissions, Users, and Docker Volumes.

## The Scenario

A simple shell script container tries to write to a volume but fails due to user/permission mismatch.

## Task

> "The container starts but keeps restarting. It's supposed to write a health file. Please fix it."

## Expected Candidate Flow (Strong Signal)

1. **Run**: `docker-compose up`
2. **Observe**: Container enters a restart loop.
3. **Debug**: `docker logs <container>` -> sees `can't create /data/health.txt: Permission denied`.
4. **Analyze**:
   - Checks `docker-compose.yml`: sees `user: "1001:1001"`.
   - Checks volume permissions: `ls -ld data` -> sees `drwx------ root root`.
5. **Fix**:
   - **Best Fix**: `chown 1001:1001 data` (aligns host dir with container user).
   - **Alternative**: Change `user` in compose (needs justification).
6. **Verify**: Container stays up.

## Red Flags (Immediate Reject)

- **`chmod 777 data`**: Dangerous "fix" that shows lack of security awareness.
- **Removing `user: 1001`**: Running as root without understanding why it was there.
- **Trial and error**: Randomly changing paths or flags.

## Follow-Up Questions

- "Why is `restart: always` dangerous here?" (Answer: Infinite log spam / resource usage).
- "How would you handle this in Kubernetes?" (Answer: `securityContext`, `initContainers` to chown volume, or CSI driver handling).
- "Why is running as user 1001 better than root?"

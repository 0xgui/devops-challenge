# The Task

A containerized service is expected to periodically write a health file to disk.
The container starts but keeps restarting and never becomes healthy.

The repository is cloned in `~/challenge`.

## Objectives

1.  **Run the service**: Attempt to start the application with `docker-compose`.
2.  **Diagnose**: Identify **why** the container keeps failing to write.
3.  **Fix**: Apply a fix so the service can write to the volume successfully.
4.  **Explain**: Briefly explain the root cause and how to prevent this in the future (e.g. valid fixes vs hacks).

**Think out loud while you work.**

## Notes

*   You have full `sudo` access.
*   You can edit files using `vim`, `nano`, or the IDE editor.
*   You make look up documentation, but please do not use AI assistants.

**Good luck!**

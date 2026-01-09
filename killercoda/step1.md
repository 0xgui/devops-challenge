# The Task

The repository has been cloned to `~/challenge`.

There are reports that the application is:
1. Crashing on startup.
2. Not reachable even when it runs.

## Goal

1.  Build and run the application using `docker-compose`.
2.  Debug why it is not reachable.
3.  Fix the issue so that you can curl it or access it via the mapped port.

## Instructions

Navigate to the challenge directory:

\`\`\`bash
cd challenge
\`\`\`

Try to bring up the stack:

\`\`\`bash
docker-compose up --build
\`\`\`

The app is supposed to be listening on port **8080** on the host.

Good luck!

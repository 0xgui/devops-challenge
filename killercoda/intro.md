# New Message from @backend-dev

**@backend-dev** 10:43 AM:
> Hey, the new health-check service is crashing in production.
> 
> It's supposed to write a heartbeat file to `/data/health.txt` every 5 seconds, but it keeps restarting.
> 
> It works fine on my laptop where I'm root... might be a permission thing?
> 
> Thanks!

⚠️ **Warning**: The previous engineer didn't test this with non-root users.

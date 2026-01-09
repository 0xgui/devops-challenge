import os
import time
import sys

ENV = os.getenv("APP_ENV", "dev")
TIMEOUT = int(os.getenv("STARTUP_TIMEOUT", "3"))

print("Starting application...")
time.sleep(TIMEOUT)

if ENV == "prod":
    print("ERROR: Missing required configuration for prod")
    sys.exit(1)

print("Application started successfully")

while True:
    time.sleep(10)

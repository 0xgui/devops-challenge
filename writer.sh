#!/bin/sh
set -eu

echo "Starting writer"
echo "Running as user: $(id)"
echo "Attempting to write health file..."

while true; do
  date > /data/health.txt
  echo "Wrote health check to /data/health.txt"
  sleep 5
done

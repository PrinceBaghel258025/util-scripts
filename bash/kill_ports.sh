#!/bin/bash

# Check if at least one port is provided
if [ $# -eq 0 ]; then
  echo "Usage: $0 port1 [port2 ... portN]"
  exit 1
fi

# Iterate over each provided port
for port in "$@"; do
  # Find the PID associated with the port
  pid=$(lsof -ti :"$port")

  # If no PID is found, continue to the next port
  if [ -z "$pid" ]; then
    echo "No process found on port $port"
    continue
  fi

  # Kill the process forcefully
  echo "Killing process $pid on port $port"
  kill -9 "$pid"

  # Check if the kill command was successful
  if [ $? -eq 0 ]; then
    echo "Process $pid on port $port has been killed successfully."
  else
    echo "Failed to kill process $pid on port $port."
  fi
done

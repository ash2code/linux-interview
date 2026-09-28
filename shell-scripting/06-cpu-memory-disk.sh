#!/usr/bin/env bash

# Quick system health summary.
echo "CPU load:"
uptime

echo
echo "Memory:"
free -h

echo
echo "Disk usage:"
df -h /

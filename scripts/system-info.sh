#!/bin/bash

PROJECT_NAME="Secure Traffic Intelligence Platform"
HOSTNAME=$(hostname)
ENVIRONMENT="$1"
SCRIPT_VERSION=1
NEXT_VERSION=$((SCRIPT_VERSION + 1))
CHECK_COUNT=0

CHECK_COUNT=$((CHECK_COUNT + 1))
CHECK_COUNT=$((CHECK_COUNT + 1))
CHECK_COUNT=$((CHECK_COUNT + 1))

echo "$PROJECT_NAME"
echo "======================"
echo "System Information"
echo "======================"

echo "Environment: $ENVIRONMENT"
echo "Hostname: $HOSTNAME"
echo "User:" 
whoami

echo "Current directory:" 
pwd

echo "Date:" 
date

echo "Uptime:" 
uptime

echo "Number of arguments: $#"
echo "$@"

echo "Script version: $SCRIPT_VERSION"
echo "Next version: $NEXT_VERSION"

echo "Checks performed: $CHECK_COUNT"

echo ""
echo "Disk Health Check"
echo "_________________"

DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')
MAX_DISK_USAGE=80

echo "Disk usage: $DISK_USAGE%"
echo "Maximum allowed: $MAX_DISK_USAGE%"

if [ "$DISK_USAGE" -lt 70 ]; then
echo "Status: OK"
elif [ "$DISK_USAGE" -le "$MAX_DISK_USAGE" ]; then
echo "Status: WARNING"
else
echo "Status: CRITICAL"
fi


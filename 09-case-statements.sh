#!/usr/bin/env bash

# Interview example: handle a service action.
action=${1:-status}

case "$action" in
    start)
        echo "Starting service"
        ;;
    stop)
        echo "Stopping service"
        ;;
    restart)
        echo "Restarting service"
        ;;
    status)
        echo "Checking service status"
        ;;
    *)
        echo "Usage: $0 {start|stop|restart|status}" >&2
        exit 1
        ;;
esac

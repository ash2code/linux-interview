#!/usr/bin/env bash

# Interview example: loop through a fixed list of servers.
servers=(web01 web02 db01)

for server in "${servers[@]}"; do
    echo "Checking $server"
done

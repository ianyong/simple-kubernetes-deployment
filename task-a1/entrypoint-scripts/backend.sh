#!/bin/bash
set -e

# Set up database
./createdb
./migratedb

# Then exec the container's main process (what's set as CMD in the Dockerfile)
exec "$@"

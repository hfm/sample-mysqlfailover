#!/bin/bash
# simple wait-for-it.sh for mysqld via mysqladmin

set -e

host="$1"
shift
cmd="$@"

until mysqladmin -h "$host" ping; do
    sleep 5
done

exec $cmd

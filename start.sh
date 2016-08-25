#!/bin/sh

service rabbitmq-server start
service redis-server start
service mongod start

# Execute all the rest.
exec "$@"

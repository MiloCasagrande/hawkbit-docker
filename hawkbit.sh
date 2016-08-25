#!/bin/sh
cd /srv/hawkbit/examples/hawkbit-example-app/target

java -jar hawkbit-example-app-0.2.0-SNAPSHOT.jar \
    --spring.config.location=file:/srv/application.properties

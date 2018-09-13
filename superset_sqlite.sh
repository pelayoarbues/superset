#!/bin/bash
cd sqliteback

# Start Redis service
docker-compose up -d redis
echo "Sleeping for 30s"
sleep 30
# Wait for services to come up fully...

# Touch SQLite db file
#mkdir -p superset
#touch superset/superset.db

# Start Superset
docker-compose up -d superset
echo "Sleeping for 30s"
sleep 30
# Wait for Superset to come up fully...

# Initialize demo
#docker-compose exec superset superset-demo
docker-compose exec superset superset-init

echo -n "Press RETURN to bring it down"
read down
# Bring everything down
docker-compose down

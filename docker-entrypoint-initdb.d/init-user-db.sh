#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE USER gogs;
    CREATE DATABASE gogs;
    GRANT ALL PRIVILEGES ON DATABASE gogs TO gogs;
EOSQL

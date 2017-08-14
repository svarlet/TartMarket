#!/usr/bin/env sh

echo "# Starting PGSQL for the dev environment..."
docker run --name tart-market-dev -e POSTGRES_PASSWORD=mysecretpassword -d -p 5432:5432 postgres

echo "# Starting PGSQL for the test environment"
docker run --name tart-market-test -e POSTGRES_PASSWORD=mysecretpassword -d -p 5433:5432 postgres

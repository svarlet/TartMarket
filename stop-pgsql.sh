#!/usr/bin/env sh

echo "Stopping PGSQL for the dev environment"
docker stop tart-market-dev

echo "Removing the associated docker image"
docker rm tart-market-dev

echo "Stopping PGSQL for the test environment"
docker stop tart-market-test

echo "Removing the associated docker image"
docker rm tart-market-test

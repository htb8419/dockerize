#!/usr/bin/env bash

clear
KEYCLOAK_VERSION=$1
KEYCLOAK_MODE="DEV"
echo "build image by tag ${KEYCLOAK_VERSION}"
if [ -z "$KEYCLOAK_VERSION" ]; then
  echo "version is required"
  exit
fi
if [ -z "$KEYCLOAK_MODE" ]; then
  KEYCLOAK_MODE="DEV"
fi
echo "build image by tag ${KEYCLOAK_VERSION}"
chmod u+x ./kc-start.sh
docker build \
-t dms-keycloak:"${KEYCLOAK_VERSION}" -t dms-keycloak:latest \
--build-arg KEYCLOAK_MODE="${KEYCLOAK_MODE}" \
./
#!/usr/bin/env bash

cd /opt/keycloak || exit

echo "KEYCLOAK_MODE= $KEYCLOAK_MODE"
test -n "$KEYCLOAK_CONFIG_FILE" && echo "env.KEYCLOAK_CONFIG_FILE=$KEYCLOAK_CONFIG_FILE" || echo "env.KEYCLOAK_CONFIG_FILE is empty"
test -n "$KEYCLOAK_MODE" && echo "env.KEYCLOAK_MODE=$KEYCLOAK_MODE" || echo "env.KEYCLOAK_MODE is empty"

KEYCLOAK_CONFIG_FILE_PATH=./conf/keycloak.conf

if [[ -n "$KEYCLOAK_CONFIG_FILE" ]]; then
  echo "update KEYCLOAK_CONFIG_FILE_PATH"
   KEYCLOAK_CONFIG_FILE_PATH="./conf/$KEYCLOAK_CONFIG_FILE"
fi

if [[ -z "$KEYCLOAK_MODE" ]]; then
  KEYCLOAK_MODE="DEV"
fi

echo "The keycloak server well start with config-file=$KEYCLOAK_CONFIG_FILE_PATH and mode=$KEYCLOAK_MODE"
if [ $KEYCLOAK_MODE = "DEV" ]; then
   /opt/keycloak/bin/kc.sh --config-file "${KEYCLOAK_CONFIG_FILE_PATH}" start-dev --log-level=org.keycloak:info;
else
   /opt/keycloak/bin/kc.sh --config-file "${KEYCLOAK_CONFIG_FILE_PATH}" start --optimized --log-level=org.keycloak:info;
fi
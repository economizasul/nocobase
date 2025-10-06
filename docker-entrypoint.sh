#!/bin/bash

# Inicializa o NocoBase no runtime
yarn nocobase init --non-interactive --db-type=postgres --db-host="${DB_HOST}" --db-port="${DB_PORT}" --db-database="${DB_DATABASE}" --db-username="${DB_USERNAME}" --db-password="${DB_PASSWORD}" --admin-user="${ADMIN_USER}" --admin-password="${ADMIN_PASSWORD}" --skip-license --license-type=community --skip-git || exit 1

# Inicia o servidor
yarn start

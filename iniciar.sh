#!/bin/sh
# Uso: sh iniciar.sh <url-del-repositorio>
set -e
cd "$(dirname "$0")"
if [ -z "$1" ]; then
  echo "Uso: sh iniciar.sh <url-del-repositorio>"
  exit 1
fi
git init -b main
chmod +x .githooks/*
git config core.hooksPath .githooks
git add -A
git commit -m "[sprint 1.0][meta] esquema raiz"
git remote add origin "$1"
git push -u origin main

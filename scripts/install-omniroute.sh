#!/usr/bin/env bash
# Instala y arranca OmniRoute (https://github.com/diegosouzapw/OmniRoute).
# Dashboard: http://localhost:20128  ·  API OpenAI-compatible: http://localhost:20128/v1
set -euo pipefail

if ! command -v omniroute >/dev/null 2>&1; then
  npm install -g omniroute
fi

omniroute --version

if [[ "${1:-}" == "--start" ]]; then
  nohup omniroute > "${OMNIROUTE_LOG:-$HOME/omniroute.log}" 2>&1 &
  echo "OmniRoute arrancando en http://localhost:20128 (log: ${OMNIROUTE_LOG:-$HOME/omniroute.log})"
fi

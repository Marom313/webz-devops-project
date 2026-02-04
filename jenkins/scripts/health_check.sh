#!/usr/bin/env bash
set -euo pipefail

ENDPOINT="${1:-http://<your-lb-dns-name>}"
LOG_DIR="${2:-jenkins/logs}"

mkdir -p "$LOG_DIR"
TS="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
OUTFILE="${LOG_DIR}/manual_health_${TS}.log"

{
  echo "[${TS}] Checking: ${ENDPOINT}"
  echo ""
  echo "----- / -----"
  curl -s -S -m 10 "${ENDPOINT}/" | head -n 50
  echo ""
  echo "----- /hostname -----"
  curl -s -S -m 10 "${ENDPOINT}/hostname"
  echo ""
  echo "[${TS}] Done."
} | tee -a "$OUTFILE"

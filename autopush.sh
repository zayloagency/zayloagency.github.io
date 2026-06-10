#!/bin/bash
# Autopush: detecta cambios y sube a GitHub automáticamente
DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$DIR"

echo "Autopush activo en: $DIR"
echo "Guardas un archivo → se sube solo a zaylo.site"
echo "Pulsa Ctrl+C para parar."
echo ""

LAST=""
while true; do
  CURRENT=$(git status --porcelain 2>/dev/null)
  if [ -n "$CURRENT" ] && [ "$CURRENT" != "$LAST" ]; then
    LAST="$CURRENT"
    sleep 3  # espera 3s por si sigues editando
    CURRENT2=$(git status --porcelain 2>/dev/null)
    if [ "$CURRENT" = "$CURRENT2" ]; then
      echo "[$(date '+%H:%M:%S')] Cambios detectados, subiendo..."
      git add -A
      git commit -m "Update $(date '+%d/%m %H:%M')"
      git push origin main && echo "Subido OK" || echo "Error al subir"
      LAST=""
    fi
  fi
  sleep 2
done

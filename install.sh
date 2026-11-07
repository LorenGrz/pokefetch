#!/usr/bin/env bash
# Instala pokefetch: links en ~/.local/bin, config de fastfetch y arte de pokemon-colorscripts.
# Idempotente. Requiere: fastfetch, jq, git, una Nerd Font en la terminal.
set -euo pipefail
ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
BIN="$HOME/.local/bin"; CFG="$HOME/.config/fastfetch"; ART="$HOME/.local/share/pokemon-colorscripts"

mkdir -p "$BIN" "$CFG"
ln -sfn "$ROOT/bin/pokefetch" "$BIN/pokefetch"
ln -sfn "$ROOT/bin/ai-usage" "$BIN/ai-usage"
if [[ -e "$CFG/config.jsonc" && ! -L "$CFG/config.jsonc" ]]; then
  mv "$CFG/config.jsonc" "$CFG/config.jsonc.bak.$(date +%s)"; echo "backup de tu config anterior"
fi
ln -sfn "$ROOT/config/fastfetch.jsonc" "$CFG/config.jsonc"
if [[ ! -d "$ART/.git" ]]; then
  git clone -q --depth 1 https://gitlab.com/phoneybadger/pokemon-colorscripts.git "$ART"
fi
echo "Listo. Agregá a tu .bashrc/.zshrc:"
echo '  [[ -t 1 ]] && command -v pokefetch >/dev/null 2>&1 && pokefetch'

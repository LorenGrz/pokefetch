# pokefetch

Un Pokémon al azar (en pixel art ANSI) a la izquierda y [fastfetch](https://github.com/fastfetch-cli/fastfetch) a la derecha, cada vez que abrís una terminal.

```
OS · Kernel · Uptime · Shell · Terminal · WM · Tema · CPU · Pokémon · Claude
● ● ● ● ● ● ● ●
```

## Qué hace

- El Pokémon **nunca es más alto que fastfetch** (12 líneas). Se elige solo entre los que entran.
- Si la terminal es muy chica (no entra el Pokémon + la info), **no muestra nada**.
- 1/32 de chance de Pokémon shiny. `pokefetch <nombre>` muestra uno puntual.
- La fila **Claude** (`ai-usage claude`) muestra tokens de hoy y del mes leyendo `~/.claude/projects` (sin red, con caché de 5 min en `~/.cache/pokefetch`). Con [`ccusage`](https://github.com/ryoppippi/ccusage) instalado agrega el costo de hoy.
- La fila **Tema** usa `omarchy-theme-current` (Omarchy) y queda vacía en otros sistemas: borrala de `config/fastfetch.jsonc` si no la necesitás.

## Instalación

Requisitos: `fastfetch`, `jq`, `git` y una Nerd Font en la terminal.

```bash
git clone https://github.com/LorenGrz/pokefetch ~/projects/pokefetch
~/projects/pokefetch/install.sh
```

Después agregá a tu `.bashrc` / `.zshrc`:

```bash
[[ -t 1 ]] && command -v pokefetch >/dev/null 2>&1 && pokefetch
```

## Créditos

El arte viene de [pokemon-colorscripts](https://gitlab.com/phoneybadger/pokemon-colorscripts) (no se incluye en este repo; `install.sh` lo clona). Pokémon es marca de Nintendo / Game Freak.

## Licencia

MIT para el código de este repo.

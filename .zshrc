# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

alias ls="eza -la --icons -F --group-directories-first --git"
alias vim="nvim"
alias utar="tar -xvzf "
alias t="tmux"
# Audio loopback controls
alias micloop-start='pactl load-module module-loopback latency_msec=100'
alias micloop-stop='pactl unload-module module-loopback'
# Record mic monitor to a WAV file
alias mic-rec="parec -d alsa_output.pci-0000_04_00.6.analog-stereo.monitor --file-format=wav"
alias c="code . --enable-features=WaylandWindowDecorations --ozone-platform-hint=auto"

alias saver='brightnessctl set 20% && powerprofilesctl set power-saver'
alias balanced='brightnessctl set 90% && powerprofilesctl set balanced'

# if [[ -z "$TMUX" ]]; then
#     rm $HOME/.cache/wal/* -r
#     "$HOME/.local/bin/wal" -i "$HOME/.config/background" -b '#000000' >/dev/null 2>&1
# fi

# Run pywal always, but reset cache if background changed
if [[ -z "$TMUX" ]]; then
    BG_FILE="$HOME/.config/background"
    CACHE_DIR="$HOME/.cache/bg-cache"
    CHECKSUM_FILE="$CACHE_DIR/bg_checksum"

    if [[ -f "$BG_FILE" ]]; then
        mkdir -p "$CACHE_DIR"
        NEW_SUM=$(sha256sum "$BG_FILE" | awk '{print $1}')
        OLD_SUM=$(cat "$CHECKSUM_FILE" 2>/dev/null)

        # If the background changed, clear wal config
        if [[ "$NEW_SUM" != "$OLD_SUM" ]]; then
            rm -rf $HOME/.cache/wal/*
            echo "$NEW_SUM" > "$CHECKSUM_FILE"
        fi

        # Always run wal
        "$HOME/.local/bin/wal" -i "$BG_FILE" -b '#000000' >/dev/null 2>&1
    fi
fi

# Wi-Fi management helper using nmcli
wifi() {
  case "$1" in
    on)
      nmcli radio wifi on
      ;;
    off)
      nmcli radio wifi off
      ;;
    up)
      nmcli con up "$2"
      ;;
    down)
      nmcli con down "$2"
      ;;
    show)
      nmcli con show
      ;;
    status)
      nmcli device status
      ;;
    *)
      echo "Usage:"
      echo "  wifi on                      → Enable Wi-Fi"
      echo "  wifi off                     → Disable Wi-Fi"
      echo "  wifi show                    → Show saved connections"
      echo "  wifi up '<connection_name>'  → Connect to network"
      echo "  wifi down '<connection_name>'→ Disconnect network"
      echo "  wifi status                  → Show device status"
      ;;
  esac
}

function todo() {
  # Find project root (fallback to current dir)
  local root
  root=$(git rev-parse --show-toplevel 2>/dev/null || echo ".")

  # Default context = 0, unless user specifies -C or --context
  local context_flag_set=false
  for arg in "$@"; do
    if [[ "$arg" == "-C" || "$arg" == "--context" ]]; then
      context_flag_set=true
      break
    fi
  done
  local context_args=()
  if ! $context_flag_set; then
    context_args=(-C 0)
  fi

  rg --hidden -n \
    "${context_args[@]}" \
    "TODO:|FIXME:|BUG:|HACK:|NOTE:|LEARN:" \
    --heading --color always \
    --glob '!node_modules/*' \
    --glob '!.nuxt/*' \
    --glob '!dist/*' \
    --glob '!.git/*' \
    --glob '!*.yaml' \
    --glob '!*.yml' \
    --glob '!*.json' \
    --type-add 'source:*.{vue,js,ts,jsx,tsx,css}' \
    -t source \
    "$root" \
    "$@"
}

function run-tmux-sessionizer { tmux-sessionizer; zle redisplay; }
zle -N run-tmux-sessionizer
bindkey '^f' run-tmux-sessionizer
bindkey "^U" backward-kill-line


eval "$(starship init zsh)"

# fnm
FNM_PATH="/home/lutia/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi

# pnpm
export PNPM_HOME="/home/lutia/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

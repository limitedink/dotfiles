# Path to your Oh My Zsh installation
export ZSH="$HOME/.oh-my-zsh"

# === Theme ===
# Pick one from $ZSH/themes/ or use "random"
ZSH_THEME="aussiegeek"

# === Plugins ===
plugins=(git)

# === Load Oh My Zsh ===
source $ZSH/oh-my-zsh.sh

# === User configuration ===

# Example editor setup
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# === Omarchy defaults ===
# Don’t source the Bash rc (causes shopt/bind errors)
# If there’s a Zsh version, load that instead:
[ -f ~/.local/share/omarchy/default/zsh/rc ] && source ~/.local/share/omarchy/default/zsh/rc

# === Extra envs ===
[ -f "$HOME/.local/share/../bin/env" ] && source "$HOME/.local/share/../bin/env"
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

# === API Key Import ===
[ -f ~/.zshrc.local ] && source ~/.zshrc.local


# PATH setup

export PATH="$HOME/bin:$HOME/.local/bin:$PATH"


# === Custom Prompt (optional, overrides theme) ===
# Comment this line if you prefer the aussiegeek theme
#PROMPT='[ %* ] [ %n@%m:%~ ] '

# === Runtime Tools ===
# Initialize mise (version/runtime manager)
if command -v mise &> /dev/null; then
  eval "$(mise activate zsh)"
fi


# Initialize zoxide (smart cd)
if command -v zoxide &> /dev/null; then
  eval "$(zoxide init zsh)"
fi

# Initialize fzf (fuzzy finder)
if command -v fzf &> /dev/null; then
  if [[ -f /usr/share/fzf/completion.zsh ]]; then
    source /usr/share/fzf/completion.zsh
  fi
  if [[ -f /usr/share/fzf/key-bindings.zsh ]]; then
    source /usr/share/fzf/key-bindings.zsh
  fi
fi


# === Functions ===
[ -f ~/.oh-my-zsh/custom/functions.zsh ] && source ~/.oh-my-zsh/custom/functions.zsh

#.inputrc
#
#### === Inputrc → Zsh equivalents === ###

# --- Meta / Unicode handling (input/output non-ASCII) ---
setopt COMBINING_CHARS

# --- Completion options ---
# Ignore case when completing
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Don’t autocomplete dotfiles unless you type "."
zstyle ':completion:*' special-dirs false

# Show all matches immediately (no paging unless huge list)
setopt AUTO_LIST
setopt LIST_PACKED

# If there are many results, ask before showing all
LISTMAX=200

# Show ls-style indicators on completion results (like -F)

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}


# --- History search with arrows ---
# Arrow up/down search history for commands starting with what you've typed
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# --- Smarter completion behavior ---
setopt COMPLETE_IN_WORD      # look at text after cursor
setopt MENU_COMPLETE         # menu-style completion cycling
setopt LIST_TYPES            # show file types when completing


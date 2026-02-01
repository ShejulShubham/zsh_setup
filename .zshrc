 # ========================
# Powerlevel10k Instant Prompt (keep at top)
# ========================
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ========================
# Zinit Installation Path
# ========================
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit if missing
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Load Zinit
source "${ZINIT_HOME}/zinit.zsh"

# ========================
# Zsh Completion System
# ========================
autoload -Uz compinit
compinit -u   # -u skips security check (faster if you trust your $fpath)

# ========================
# Plugins
# ========================
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Powerlevel10k theme
zinit ice depth=1
zinit light romkatv/powerlevel10k

# ========================
# Powerlevel10k Config
# ========================
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ========================
# History Settings
# ========================
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory sharehistory hist_ignore_space hist_ignore_all_dups \
       hist_save_no_dups hist_ignore_dups hist_find_no_dups

# ========================
# Completion Styling
# ========================
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no

# fzf-tab preview
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color=auto -- $realpath'

# ========================
# FZF Integration
# ========================
eval "$(fzf --zsh)"

# ========================
# copy .zshrc setup and history
# ========================
cp ~/.zshrc ~/Everything/Programming/Autostart
cp ~/.zsh_history ~/Everything/Programming/Autostart

# ========================
# Alias
# ========================
alias home="cd ~"
alias zshconfig="nano ~/.zshrc"
alias zshhistory="nano ~/.zsh_history"

# =======================
# Path
# =======================
export PATH="$HOME/.local/bin:$PATH"

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

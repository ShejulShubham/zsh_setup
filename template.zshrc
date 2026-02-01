# ========================
# Powerlevel10k Instant Prompt
# ========================
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ========================
# Zinit Bootstrapping
# ========================
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
   echo "🚀 Installing Zinit..."
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

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
# Zsh Settings & History
# ========================
autoload -Uz compinit && compinit -u

HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
setopt appendhistory sharehistory hist_ignore_space hist_ignore_all_dups \
       hist_save_no_dups hist_ignore_dups hist_find_no_dups

# ========================
# Completion & FZF Styling
# ========================
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
# Enable it for ALL commands that complete files/directories
zstyle ':fzf-tab:complete:*:*' fzf-preview 'ls --color=auto -- $realpath'

# Load FZF integration if installed
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
(( $+commands[fzf] )) && eval "$(fzf --zsh)"

# ========================
# Environment Managers (Lazy-ish Load)
# ========================
# Pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
if command -v pyenv >/dev/null; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# ========================
# Aliases & Personal Paths
# ========================
alias zshconfig="nano ~/.zshrc"
alias zshhistory="nano ~/.zsh_history"
alias reload="source ~/.zshrc"

# Only create project aliases if the base directory exists
if [ -d "$HOME/Everything" ]; then
    alias acciojob="cd ~/Everything/AccioJob"
    alias zeromoq="cd ~/Everything/Work/TrustAdditiveDjango"
    alias programming="cd ~/Everything/Programming"
    alias notes="cd ~/Everything/Notes"
    
    # Auto-backup config to your repo path if it exists
    BACKUP_PATH="$HOME/Everything/Programming/Autostart"
    if [ -d "$BACKUP_PATH" ]; then
        cp ~/.zshrc "$BACKUP_PATH/.zshrc"
    fi
fi

# ========================
# Final Touches
# ========================
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH="$HOME/.local/bin:$PATH"
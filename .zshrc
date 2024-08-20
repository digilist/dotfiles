# Path to your oh-my-zsh installation.
export ZSH="/home/markus/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=60

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(archlinux colored-man-pages common-aliases composer docker docker-compose encode64 git cp extract systemd z zsh-syntax-highlighting fzf-tab)

source $ZSH/oh-my-zsh.sh

# User configuration

# Disable history sharing
unsetopt share_history

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# Oh My Posh
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/config.yaml)"

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Disable automatic directory switching by just entering the name without cd
unsetopt AUTO_CD

# Load custom aliases
source ~/.alias
source ~/.alias2

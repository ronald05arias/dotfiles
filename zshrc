# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="rbenvgit"

# aliases
. ~/.zsh/aliases

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable weekly auto-update checks
#DISABLE_AUTO_UPDATE="true"

# Uncomment this to disable the update prompt and silently update
#DISABLE_UPDATE_PROMPT="true"

# Change this value to set how frequently ZSH updates¬
export UPDATE_ZSH_DAYS=7

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(bundler brew cake coffee fasd gem git git-extras gitfast heroku npm pow rails rbenv redis-cli vundle postgres)

# Use homebrew path for rbenv
export RBENV_ROOT=$(brew --prefix rbenv)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# autocorrect is more annoying than helpful
unsetopt correct_all

export EDITOR='vim'
export BUNDLER_EDITOR='vim'

### homebrew
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/share/npm/bin:$PATH"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Bundler 1.5.0
export BUNDLE_JOBS=4

# aws-cli command completion
source /usr/local/bin/aws_zsh_completer.sh

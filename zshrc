# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Custom themes may be added to ~/.oh-my-zsh/custom/
ZSH_THEME="chrubygit"

# Change this value to set how frequently ZSH updates
export UPDATE_ZSH_DAYS=7

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins+=(aws brew brew-cask cake chruby docker fasd git git-extras grunt heroku hero npm postgres rake-fast vundle zsh-completions)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# Fix chruby - https://github.com/postmodern/chruby/issues/191
precmd_functions+=("chruby_auto")

# autocorrect is more annoying than helpful
unsetopt correct_all

# preferred editor
export EDITOR='vim'
export BUNDLER_EDITOR='vim'

### homebrew
export PATH="/usr/local/share/npm/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Bundler > 1.5.0
export BUNDLE_JOBS=4

# gopath
export GOPATH=$HOME/gocode
export PATH=$PATH:/usr/local/Cellar/go/1.0.2/bin
export PATH=$PATH:$GOPATH/bin

#docker
eval "$(docker-machine env default)"

# aliases
. ~/.zsh/aliases

autoload -U compinit && compinit

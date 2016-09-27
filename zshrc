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
plugins+=(aws cake chruby fasd git git-extras grunt heroku hero npm postgres rake-fast vundle)

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
export PATH="/usr/local/sbin:$PATH"
#coreutils
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
# gopath
export PATH=$PATH:/usr/local/opt/go/libexec/bin
# zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)
fpath=(~/.zsh/completions $fpath)

# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Bundler > 1.5.0
export BUNDLE_JOBS=$(sysctl -n hw.ncpu)

# aliases
. ~/.zsh/aliases

autoload -U compinit && compinit

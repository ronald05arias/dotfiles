# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Custom themes may be added to ~/.oh-my-zsh/custom/
#ZSH_THEME="chrubygit"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Change this value to set how frequently ZSH updates
export UPDATE_ZSH_DAYS=3

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins+=(aws cake chruby fasd fzf git grunt heroku hero npm rake-fast vundle)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# Fix chruby - https://github.com/postmodern/chruby/issues/191
precmd_functions+=("chruby_auto")

# autocorrect is more annoying than helpful
unsetopt correct_all

# preferred editor
export EDITOR='code'
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
source /usr/local/opt/git-extras/share/git-extras/git-extras-completion.zsh

# Bundler > 1.5.0
export BUNDLE_JOBS=$(sysctl -n hw.ncpu)

# GPG
export GPG_TTY=$(tty)

# aliases
. ~/.zsh/aliases

# PowerLevel10k configuration
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

autoload -U compinit && compinit

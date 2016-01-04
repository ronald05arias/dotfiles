PROMPT='%{$fg_bold[green]%}%~%{$reset_color%} %{$fg[red]%}‹$(chruby_prompt_info)›%{$reset_color%}$(git_prompt_info) $ '
RPROMPT='%{$bg[black]%}%{$fg_bold[green]%}%n%{$reset_color%}%{$bg[black]%}%{$fg_bold[blue]%}@%m%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[yellow]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" %{$fg[green]%}?%{$reset_color%}"

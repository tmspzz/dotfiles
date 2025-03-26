# Put this in ~/.oh-my-zsh/themes/
#PROMPT="%(?:%{$fg_bold[green]%}:%{$fg_bold[red]%})"
PROMPT='$fg[yellow]%*$reset_color $fg[green]%n$reset_color@$fg[green]%m$reset_color $fg[yellow]%~$reset_color%$ $(git_prompt_info) 
$ '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}ᛅ(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%})%{$fg[red]%}*"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

export PROMPT_COMMAND='history -a'
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source $GITAWAREPROMPT/main.sh
export PS1="\[\e[33m\]\t \[$txtgrn\]\u\[$txtwht\]@\[$txtgrn\]\h \[$txtylw\]\w\[$txtrst\] \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "
export PATH="$PATH:~/Library/Python/2.7/bin:$HOME/Library/Haskell/bin"
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export EDITOR=vim
export RBENV_ROOT=/usr/local/var/rbenv

alias ls='ls -lAh'
alias gs='git status'

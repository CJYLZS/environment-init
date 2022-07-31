PROMPT=$'%{$fg[cyan]%}%n@%m %{$fg_bold[blue]%}[%~] %{$reset_color%}$(git_prompt_info) %{$fg[green]%}%D{[%y-%m-%d %K:%M:%S]} %{$fg_bold[green]%}%?\
%{$fg_bold[green]%}->%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}*%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

function prompt_char() {
	if [ $UID -eq 0 ]
	then
		echo '#'
	else
		echo '$'
	fi
}

function preprompt() {
	if [ -n "$PREPROMPT" ]
	then
		echo -n "$PREPROMPT "
	fi
	if [[ "$SESSION_ORIGIN" = 'ssh' ]]
	then
		# echo -n '≍ '
		echo -n '| '
	fi
}

#function precmd() {
#	echo
#}

#PROMPT='%(!.%{$fg_bold[red]%}.%{$fg_bold[green]%}%n@)%m %{$fg_bold[blue]%}%(!.%1~.%~) $(git_prompt_info)%_$(prompt_char)%{$reset_color%} '
#PROMPT='%(!.%{$fg_bold[red]%}.%{$fg_bold[green]%}%n%{$fg_bold[blue]%}@%{$fg_bold[green]%})%m%{$fg_bold[blue]%} %~ $(git_prompt_info)%_$(prompt_char)%{$reset_color%} '
PROMPT='%{$fg_bold[red]%}$(preprompt)%(!.%{$fg_bold[red]%}.%{$fg_bold[green]%}%n%{$fg_bold[blue]%}@%{$fg_bold[green]%})%m%{$fg_bold[blue]%} %{$reset_color%}%{$fg[yellow]%}[$SHELL_NAME]%{$fg_bold[blue]%} %~ $(git_prompt_info)%_$(prompt_char)%{$reset_color%} '
RPROMPT='(%*)'

ZSH_THEME_GIT_PROMPT_PREFIX='('
ZSH_THEME_GIT_PROMPT_SUFFIX=') '

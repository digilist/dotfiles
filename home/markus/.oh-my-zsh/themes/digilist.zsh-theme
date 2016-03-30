#!/bin/bash

BLUE="%{${fg[blue]}%}"
RED="%{${fg[red]}%}"
GREEN="%{${fg[green]}%}"
CYAN="%{${fg[cyan]}%}"
MAGENTA="%{${fg[magenta]}%}"
YELLOW="%{${fg[yellow]}%}"
WHITE="%{${fg[white]}%}"
NO_COLOR="%{${reset_color}%}"

GIT_CLEAN="${fg[green]}✓"
GIT_DIRTY="${fg[red]}✗"
GIT_AHEAD="${fg[yellow]}⚡"
GIT_UNTRACKED="${fg[white]}✭"
GIT_ADDED="${fg[blue]}✚"
GIT_STASHED="${fg[blue]}↑"

function curr_user() {
	if (( EUID == 0 )); then
		username_color="${RED}"
	else
		username_color="${BLUE}"
	fi

	echo "%B${username_color}%n%b${NO_COLOR}@${YELLOW}%m${NO_COLOR}"
}

function vcs_info() {
	# ensure this is a git repository
	# TODO other VCS (maybe..)
	$(git rev-parse --is-inside-work-tree 2> /dev/null) || return;
		
	git_status=$(git status --porcelain 2> /dev/null)
	git_status_icon=""
	if $(echo -n "$git_status" | grep -v "??" &> /dev/null); then
		git_status_color="${RED}"
		git_status_icon="${git_status_icon}${GIT_DIRTY}"
	else
		git_status_color="${GREEN}"
		git_status_icon="${git_status_icon}${GIT_CLEAN}"
	fi
#	if $(echo "$git_status" | grep '^A  ' &> /dev/null); then
#		git_status_icon="${git_status_icon}${GIT_ADDED}"
#	elif $(echo "$git_status" | grep '^M  ' &> /dev/null); then
#		git_status_icon="${git_status_icon}${GIT_ADDED}"
#	fi
	if $(echo "$git_status" | grep "??" &> /dev/null); then
		git_status_icon="${git_status_icon}${GIT_UNTRACKED}"
	fi

	unpushed_commits=$(git log origin/$(current_branch).. --pretty=oneline 2> /dev/null | wc -l)
	if [ $unpushed_commits -gt 0 ]; then
		git_status_icon="${git_status_icon}${GIT_AHEAD}"
	fi

	stashed=$(git stash show 2>&1 > /dev/null)
	if [ $? -eq 0 ]; then
		git_status_icon="${git_status_icon}${GIT_STASHED}"
	fi

	git_stat=$(git diff --numstat | awk -v magenta="${fg[magenta]}" \
										-v cyan="${fg[cyan]}" \
										-v red="${fg[red]}" \
										-v green="${fg[green]}" \
										'BEGIN { added = 0; deleted = 0}
										{ added += $1; deleted += $2 }
										END { if (NR > 0 || $added > 0 || $deleted > 0)  print magenta " | " cyan NR magenta " | " green added magenta " | " red deleted}')

	echo "(git)-${fg[magenta]}[${git_status_color}$(current_branch) ${git_status_icon}${git_stat}${fg[magenta]}]"
}

curr_dir="[${YELLOW}%40<...<%B%~%b]"
curr_status="${RED}%(?..%? ${NO_COLOR}- )"
curr_time="${YELLOW}%T ${NO_COLOR}-"

PROMPT='${curr_dir} $(vcs_info)
${YELLOW} %#${NO_COLOR} '
RPROMPT='${curr_status}${curr_time} $(curr_user)'

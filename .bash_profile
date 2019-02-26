alias ll='ls -lia'
alias l='ls -l'
alias yaml='yamllint'
alias cleands="find . -type f -name '*.DS_Store' -ls -delete"
alias h='history'
alias prettyjson='python -m json.tool'

# history
HISTSIZE=1000
HISTFILESIZE=2000
HISTCONTROL=ignoreboth:erasedups

# asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# z
. ~/.my_z/z/z.sh

# My Git aliases
alias gs='git status'
alias gco='git checkout'
alias gaa='git add .'
alias gcm='git commit -m'
alias gpull='git pull'
alias gpush='git push'

function format_git_alias() {
	awk '{$1=""; print " " $0 }'
}

function gh() {
	echo 'Git Help'
	alias gs | format_git_alias
	alias gs | format_git_alias
	alias gco | format_git_alias
	alias gaa | format_git_alias
	alias gcm | format_git_alias
	alias gpull | format_git_alias
	alias gpush | format_git_alias
}

# Docker
alias d=docker

# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

export PS1="\! \w\`parse_git_branch\` $ "

export ELIXIR_ERL_OPTIONS="-kernel shell_history enabled"
export EDITOR=/usr/bin/vim
export LC_CTYPE=en_US.UTF-8
export PATH="$PATH:/usr/local/bin/:/usr/bin/"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/nicolafiorillo/.sdkman"
[[ -s "/Users/nicolafiorillo/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/nicolafiorillo/.sdkman/bin/sdkman-init.sh"


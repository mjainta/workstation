# ls aliases
alias ll='ls -alh'
alias la='ls -A'
alias l='ls -CF'

# TB.One aliases
alias one='cd ~/Projects/tbone'

# Various folder aliases
alias p='cd ~/Projects'

# Python aliases
alias activate="source ./venv/bin/activate"

# git aliases
alias grhm="git reset --hard origin/master"
alias grhmain="git reset --hard origin/main"
alias grs="git reset --soft"
alias gpm="git pull origin master"
alias gpmain="git pull origin main"
alias gfo="git fetch origin"
alias gpush="git push origin HEAD:refs/for/master"
alias gpushmaster="git push origin master"
alias greset="git checkout master;grhm;gfo;gpm"
alias gresetmain="git checkout main;grhmain;gfo;gpmain"

# Projects folder

repo() {
	REPO_PATH="$HOME/Projects"

	if hash fzf 2>/dev/null; then
		# Give to option to provide a search query from the start like this: repo <search> (...or not)
		if [ -z ${1+x} ]; then
			# Make sure the ghq root path is $HOME/Projects, otherwise the "ghq list" will be empty
			GOTO_PATH=$(ghq list | fzf --border)
		else
			GOTO_PATH=$(ghq list | fzf --border --query="$1")
		fi

		# If we haven't select anything we don't need to cd
		if [ -n "$GOTO_PATH" ]; then
			cd $REPO_PATH/$GOTO_PATH || exit
		fi
	else
		cd "$REPO_PATH" || exit
	fi
}

aws() {
  docker run --rm -it -v ~/.aws:/root/.aws amazon/aws-cli:latest $@
}

alias aws-cli=/usr/local/aws-cli/v2/current/bin/aws

# Build opts and OS opts
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LANG="en_US.UTF-8"
export LDFLAGS="-arch x86_64"
export ARCHFLAGS="-Os -arch x86_64 -fno-common"
export MANPATH=$HOME/local/share/man:/opt/local/share/man:$MANPATH
export DYLD_LIBRARY_PATH=$HOME/local/lib:$DYLD_LIBRARY_PATH
export RRD_LIB=/usr/local/lib/librrd.dylib
export PATH="$HOME/local/bin:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH"

# Command line and command tweaks
alias ls='ls -G'
alias cp='cp -v'
alias mv='mv -v'
alias grep='grep --color=auto'
export RI="--format ansi --width 130 --no-pager"
export LESS='-X -e -R'
export PAGER=less
export EDITOR=/usr/bin/vim
export PS1="\u@\h:\w$ "

# Rubygems local setup
export GEM_HOME="$HOME/.gems"
export GEM_PATH="$GEM_HOME"
export PATH="$HOME/.gems/bin:$PATH"

# rvm (ruby version manager)
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

[ -f ~/git-completion.bash ] && source ~/git-completion.bash

function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}

function parse_git_branch {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

export PS1='\w$(__git_ps1 "[\[\e[0;32m\]%s\[\e[0m\]\[\e[0;33m\]$(parse_git_dirty)\[\e[0m\]]")$ '

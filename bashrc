parse_git_dirty() {
  if [ $(git diff --shortstat | wc -l) == 1 ]; then
      echo "*"
  fi
}
parse_git_branch() {
  git rev-parse --abbrev-ref HEAD
}

get_git_hint() {
  if [[ $(git rev-parse --git-dir) == "fatal"* ]]; then
    ( $(parse_git_branch) $(parse_git_dirty))
  fi
}

export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\]\w\[\033[01;33m\]$(__git_ps1)\[\033[01;34m\]\$\[\033[00m\] '
#export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\]\w\[\033[01;33m\]$(get_git_hint)\[\033[01;34m\]\$\[\033[00m\] '
export TERMINFO=/lib/terminfo

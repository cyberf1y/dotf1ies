HISTSIZE=10000
HISTFILESIZE=20000
HISTCONTROL=ignoreboth
shopt -s histappend

shopt -s checkwinsize
shopt -s globstar
shopt -s autocd

if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

PS1='[${debian_chroot:+($debian_chroot) }\
\[\033[1;34m\]\u@\h\
 \[\033[1;32m\]\w\
\[\033[1;37m\]$(git rev-parse --abbrev-ref HEAD 2> /dev/null | sed -E "s/(.)+/ (\0)/")\
\[\033[0m\]]\$ '

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

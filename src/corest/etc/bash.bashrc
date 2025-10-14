#
# /etc/bash.bashrc
# copyright almuhdilkarim@2025

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Prevent doublesourcing
if [[ -z "${BASHRCSOURCED}" ]] ; then
    BASHRCSOURCED="Y"
 
    # the check is bash's default value
    [[ "$PS1" = '\s-\v\$ ' ]] && PS1='[\u@\h \W]\$ '
    case ${TERM} in
        Eterm*|alacritty*|aterm*|foot*|gnome*|konsole*|kterm*|putty*|rxvt*|tmux*|xterm*)
          PROMPT_COMMAND+=('printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"')
          ;;
        screen*)
          PROMPT_COMMAND+=('printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"')
          ;;
    esac
fi

if [[ -r /usr/share/bash-completion/bash_completion ]]; then
    . /usr/share/bash-completion/bash_completion
fi

# enable bash extended source
if test -d /usr/local/bash/; then
  	for loader in /usr/local/bash/*.sh; do
  		test -r "$loader" && . "$loader"
  	done
  	unset loader
fi

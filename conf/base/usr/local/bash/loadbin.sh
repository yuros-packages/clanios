#!/bin/bash
## clanios system base
## copyright@almuhdilkarim 2025


# config source
source /etc/config


# Load bash themes
if [[ ! -e  "/usr/local/bash/themes/$bash_theme" ]];then
    . "/usr/local/bash/themes/$bash_theme";
else
    . "/usr/local/bash/themes/default";
fi


# Load alias command
if test -d /usr/local/bash/aliases; then
	for alias in /usr/local/bash/aliases/*.sh; do
		test -r "$alias" && . "$alias"
	done
	unset alias
fi
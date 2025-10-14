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
	. "/usr/local/bash/aliases/package.sh";
fi
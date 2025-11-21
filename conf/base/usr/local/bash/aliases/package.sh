#!/bin/bash
## clanios pacman aliases
## copyright@almuhdilkarim 2025

# config source
source /etc/config



## server optimization
function repo-opti-daemon() {

    if [[ -e /etc/pacman.d/mirrororigin ]];then
        reflector --save /etc/pacman.d/mirrorlist --counrty $repo_server --protocol https --latest 5
    else
        cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrororigin &&
        reflector --save /etc/pacman.d/mirrorlist --counrty $repo_server --protocol https --latest 5
    fi 
}


function repo-add() {

}


# daemoned processing
function app-opti-daemon() {
    /usr/bin/pacman --sync --clean --noconfirm
}


function app-sync-daemon() {
    repo-opti-daemon && /usr/bin/pacman --sync --refresh --refresh --noconfirm && app-opti-daemon
}


function app-late-daemon() {
    repo-opti-daemon && /usr/bin/pacman --sync --refresh --sysupgrade --noconfirm && app-opti-daemon
}


function app-temp-daemon() {
    /usr/bin/pacman --sync --clean --clean --noconfirm && repo-opti-daemon
}


function app-add-daemon() {
    repo-opti-daemon & /usr/bin/pacman --sync $1 --noconfirm
}


function app-del-daemon() {
    /usr/bin/pacman --remove $1 --noconfirm && repo-opti-daemon && app-opti-daemon
}


function app-pure-daemon() {
    /usr/bin/pacman --remove --recursive $1 --noconfirm && repo-opti-daemon && app-opti-daemon
}


## userspace alias
alias app-add="sudo repo-opti && sudo /usr/bin/pacman --sync $1 && sudo app-opti-daemon"
alias app-del="sudo /usr/bin/pacman --remove $1 && sudo repo-opti-daemon && sudo app-opti-daemon"
alias app-pure="sudo /usr/bin/pacman --remove --recursive $1 && sudo app-opti-daemon"
alias app-opti="sudo /usr/bin/pacman --sync --clean"
alias app-sync="sudo /usr/bin/pacman --sync --refresh --refresh"
alias app-late="sudo /usr/bin/pacman --sync --refresh --sysupgrade && sudo app-opti-daemon"

## repository alias
alias repo-opti="sudo repo-opti-daemon"
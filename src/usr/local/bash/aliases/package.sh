#!/bin/bash
## clanios pacman aliases
## copyright@almuhdilkarim 2025

# config source
source /etc/config



## server optimization
function repo-opti() {

    if [[ -e /etc/pacman.d/mirrororigin ]];then
        reflector --save /etc/pacman.d/mirrorlist --counrty $repo_server --protocol https --latest 5
    else
        cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrororigin &&
        reflector --save /etc/pacman.d/mirrorlist --counrty $repo_server --protocol https --latest 5
    fi 
}


function repo-make() {
    $name=$1
    $link=$2

    if [[ -e "/etc/pacman.d/$name.conf" ]];then
        echo "server repository is existed" &&
        exit
    fi

    touch "/etc/pacman.d/$name.conf" &&
    echo "[$name]\nServer = $link" > "/etc/pacman.d/$name.conf" &&
    /usr/bin/pacman --sync --refresh --refresh --noconfirm
}


# daemoned processing
function app-opti() {
    /usr/bin/sudo /usr/bin/pacman --sync --clean --noconfirm
}


function app-sync() {
    /usr/bin/sudo repo-opti-daemon && /usr/bin/pacman --sync --refresh --refresh --noconfirm && app-opti-daemon
}


function app-late() {
    repo-opti-daemon && /usr/bin/sudo /usr/bin/pacman --sync --refresh --sysupgrade --noconfirm && app-opti-daemon
}


function app-temp() {
    /usr/bin/sudo /usr/bin/pacman --sync --clean --clean --noconfirm && repo-opti-daemon
}


function app-add() {
    repo-opti-daemon & /usr/bin/pacman --sync $1 --noconfirm
}


function app-del() {
    /usr/bin/sudo /usr/bin/pacman --remove $1 --noconfirm && repo-opti-daemon && app-opti-daemon
}


function app-pure() {
    /usr/bin/sudo /usr/bin/pacman --remove --recursive $1 --noconfirm && repo-opti-daemon && app-opti-daemon
}


## userspace alias
alias app-add="sudo pacman --sync $1"
alias app-del="sudo pacman --remove $1"
alias app-must="sudo pacman --sync $1 --overwrite '*'"
alias app-pure="sudo pacman --remove --recursive $1"
alias app-opti="sudo pacman --sync --clean"
alias app-sync="sudo pacman --sync --refresh --refresh"
alias app-late="sudo pacman --sync --refresh --sysupgrade"


## repository alias
alias repo-opti="sudo repo-opti-daemon"
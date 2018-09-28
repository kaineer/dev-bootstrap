#!/usr/bin/zsh

blueBold="\\e[34m\\e[1m"
yellowBold="\\e[33m\\e[1m"
reset="\\e[0m"

info() {
    echo -e "[${blueBold}INFO $reset] $1"
}

alert() {
    echo -e "[${yellowBold}ALERT$reset] $1"
}

title() {
    echo -e "\\e[1m----- $1 -----$reset"
}

aptInstalled() {
    local count=$(dpkg -s $1 2&>/dev/null | wc -l)
    if [[ $count = "0" ]]; then
        echo "no";
    else
        echo "yes"
    fi
}

aptInstall() {
    local installed=$(aptInstalled $1)
    if [[ $installed = "no" ]]; then
        echo "A > $1 - not found. Trying to install...";
        sudo apt install $1;
    else
        info "$1 - already installed."
    fi
}

nvmInstalled() {
    if [[ -d "$HOME/.nvm" ]]; then
        echo "yes";
    else
        echo "no"
    fi
}

nvmInstall() {
    local installed=$(nvmInstalled)
    if [[ $installed = "no" ]]; then
        alert "nvm - not found. Trying to install...";
        curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
    else
        info "nvm - already installed"
    fi
}

title "Bootstrap"
info "in case you can't install something, do ${yellowBold}sudo apt update$reset"
echo

for pkg in "git" "gcc" "g++" "python" "curl" "make"; do
    aptInstall $pkg;
done

nvmInstall

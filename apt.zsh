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

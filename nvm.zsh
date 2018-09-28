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

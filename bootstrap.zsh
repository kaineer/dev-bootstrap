#!/usr/bin/zsh

source ./ansi.zsh
source ./messages.zsh
source ./apt.zsh
source ./nvm.zsh

title "Bootstrap"
info "in case you can't install something, do ${ansiYellowBold}sudo apt update$ansiReset"
echo

for pkg in "git" "gcc" "g++" "python" "curl" "make"; do
    aptInstall $pkg;
done

nvmInstall

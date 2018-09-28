info() {
    echo -e "[${ansiBlueBold}INFO $ansiReset] $1"
}

alert() {
    echo -e "[${ansiYellowBold}ALERT$ansiReset] $1"
}

title() {
    echo -e "\\e[1m----- $1 -----$ansiReset"
}

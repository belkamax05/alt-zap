function stsRunBin() {
    case "$1" in
    # "fzf")
    #     stsSystem "modules/install-fzf.sh"
    #     load
    #     "$@"
    #     exit 0
    #     ;;
    "yazi")
        stsSystem "modules/install-yazi.sh"
        load
        "$@"
        exit 0
        ;;
    "pipx")
        stsSystem "modules/install-pipx.sh"
        load
        "$@"
        exit 0
        ;;
    "tte")
        stsSystem "modules/install-tte.sh"
        load
        "$@"
        exit 0
        ;;
    "mvn")
        stsSystem "modules/install-mvn.sh"
        load
        "$@"
        exit 0
        ;;
    "nvm")
        stsSystem "modules/install-nvm.sh"
        load
        "$@"
        exit 0
        ;;
    "ts-node")
        stsSystem "modules/install-ts-node.sh"
        load
        "$@"
        exit 0
        ;;
    "lsd")
        stsSystem "modules/install-lsd.sh"
        load
        "$@"
        exit 0
        ;;
    *) ;;
    esac
}

function azRunModule() {
    print -v AZ_GUARD_VALUE -- "${(P)AZ_INCLUDE_GUARD}" #? Comment temprorary to autoformat file
    if [ "$AZ_GUARD_VALUE" = "1" ]; then
        az-$command "${@:2}"
        return 0
    fi

    azError "[azRunModule] Runner for module '${AZ_C_YELLOW}$command${AZ_C_RESET}' was not found"
    return 1
}

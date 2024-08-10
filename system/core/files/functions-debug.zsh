function azIsDebug() {
    if [ "$AZ_DEBUG" = "true" ]; then
        return 0
    fi
    return 1
}
function azNoDebug() {
    if azIsDebug; then
        return 1
    else
        return 0
    fi
}
alias azIsNotDebug='azNoDebug'

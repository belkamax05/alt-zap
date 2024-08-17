function azRuntimeStart() {
    azDebugFunction "azRuntimeStart" "azRuntimeStart start."
    azConfigInit
    azLoadUserConfig
    azLoadUser
    azDebugFunction "azRuntimeStart" "azRuntimeStart END."
}

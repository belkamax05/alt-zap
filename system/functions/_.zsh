for module_name in az azDebug azError azInfo azInclude azRunModule azIncludeModule azFindCommand azRunFile azIncludePlugin azInstallPlugin azExtend azExtendNav azBuild azNav; do
    source "$AZ_DIR/system/functions/$module_name.zsh"
done

for module_name in az azDebug azError azInfo azInclude azRunModule azIncludeModule azFindCommand azRunFile azIncludePlugin azInstallPlugin azBuild; do
    source "$AZ_DIR/system/functions/$module_name.zsh"
done

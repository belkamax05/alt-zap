if [ "$OS" = "Linux" ]; then
    DEFAULT_FILE_FINDER=fdfind
fi

if [ "$OS" = "MacOS" ]; then
    DEFAULT_FILE_FINDER=fd
fi

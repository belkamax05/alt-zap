if [ ! -d "$MVN_DIR" ]; then
    az install mvn
fi
export PATH="$MVN_DIR/bin:$PATH"

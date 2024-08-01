function az-shutdown() {
    # Turn off computer at any OS (MacOS, Linux, WSL)
    if [[ "$OSTYPE" == "darwin"* ]]; then
        sudo shutdown -h now
    elif [[ "$OSTYPE" == "linux-gnu" ]]; then
        sudo shutdown -h now
    elif [[ "$OSTYPE" == "linux-android" ]]; then
        sudo shutdown -h now
    else
        echo "OS not supported"
    fi
}

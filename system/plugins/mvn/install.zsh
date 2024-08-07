# URL of the file to download
URL="https://dlcdn.apache.org/maven/maven-3/3.9.7/binaries/apache-maven-3.9.7-bin.tar.gz"

# Directory to download the file to
DOWNLOAD_DIR="$AZ_CONFIG_DIR/temp"

# Directory to extract the file to
EXTRACT_DIR="$AZ_CONFIG_DIR/bin"

# Create the directories if they don't exist
mkdir -p "$DOWNLOAD_DIR"
mkdir -p "$EXTRACT_DIR"

# Check if the directory exists
if [[ ! -d "$EXTRACT_DIR/apache-maven-3.9.7" ]]; then
    # Download the file
    curl -L "$URL" -o "$DOWNLOAD_DIR/apache-maven-3.9.7-bin.tar.gz"

    # Extract the file
    tar -xzf "$DOWNLOAD_DIR/apache-maven-3.9.7-bin.tar.gz" -C "$EXTRACT_DIR"

    # Remove the file
    rm "$DOWNLOAD_DIR/apache-maven-3.9.7-bin.tar.gz"
fi

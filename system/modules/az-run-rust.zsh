# echo "Lab: $(realpath $(dirname $0))"

# rustc ~/zsh/lab/hello_rust.rs -o ~/zsh/lab/hello_rust_bin
# ~/zsh/lab/hello_rust_bin

# Get the directory of the current script
# SCRIPT_DIR=$(dirname $(realpath $0))

# # Compile the Rust program
# rustc $SCRIPT_DIR/hello_rust.rs -o $SCRIPT_DIR/hello_rust

# # Run the resulting binary
# $SCRIPT_DIR/hello_rust

function az-run-rust() {
    # start_time=$(date +%s)
    local script_path="$1"
    # local script_dir=$(dirname $script_path)
    local bin_dir="$AZ_CONFIG_DIR/bin/rustc"
    local script_name=$(basename $script_path)
    local script_name_no_ext="${script_name%.*}"
    # local bin_path="$script_dir/$script_name_no_ext"
    local bin_path="$bin_dir/$script_name_no_ext"

    mkdir -p "$bin_dir"
    # echo "script_path: $script_path"
    # echo "script_dir: $script_dir"
    # echo "bin_dir: $bin_dir"
    # echo "script_name: $script_name"
    # echo "script_name_no_ext: $script_name_no_ext"
    # echo "bin_path: $bin_path"

    rustc $script_path -o $bin_path
    $bin_path
    # end_time=$(date +%s)
    # compilation_time=$(expr $end_time - $start_time)
    # echo "Compilation time: $compilation_time milliseconds"
}

# run-rust "$BASEDIR/lab/hello_rust.rs"

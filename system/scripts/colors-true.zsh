# 256 color example
echo "256 Colors Example:"
for i in {0..255}; do
    echo -ne "\e[38;5;${i}m${i} "
    if (((i + 1) % 16 == 0)); then
        echo -e "\e[0m"
    fi
done

echo -e "\e[0m" # Reset colors

# True color example
echo "True Color Example:"
for r in {0..255..51}; do
    for g in {0..255..51}; do
        for b in {0..255..51}; do
            echo -ne "\e[48;2;${r};${g};${b}m  "
        done
        echo -e "\e[0m"
    done
done

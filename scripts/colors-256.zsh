# Foreground colors
for i in {0..255}; do
    echo -e "\e[38;5;${i}mColor ${i}\e[0m"
done

# Background colors
for i in {0..255}; do
    echo -e "\e[48;5;${i}mColor ${i}\e[0m"
done

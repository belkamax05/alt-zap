package cli

import (
	"fmt"
)

func printColorGallery() {
	colors := []string{
		"\033[0m",  // Reset
		"\033[30m", // Black
		"\033[31m", // Red
		"\033[32m", // Green
		"\033[33m", // Yellow
		"\033[34m", // Blue
		"\033[35m", // Magenta
		"\033[36m", // Cyan
		"\033[37m", // White
	}

	for _, color := range colors {
		fmt.Println(color, "This is a colored text")
	}
	fmt.Println("\033[0m") // Reset color
}

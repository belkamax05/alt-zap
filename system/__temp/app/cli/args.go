package cli

import (
	"fmt"
	"log"
	"os"
)

func argsTest() {
    fmt.Println("Hello, world!")

    // Print command-line arguments
    fmt.Println("Command-line1 arguments:")
    for i, arg := range os.Args[1:] {
        fmt.Printf("Arg %d: %s\n", i+1, arg)
    }

    err := os.Chdir("..")
    if err != nil {
        log.Fatal(err)
    }
}
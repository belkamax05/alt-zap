package main

import (
	"flag"
	"fmt"
)


func nameAge() {
	

    // Define flags
    name := flag.String("name", "World", "a string")
    age := flag.String("age", "0", "an int")
    
    // Parse the flags
    flag.Parse()

    // Use the flag value
    fmt.Printf("Hello, %s! Age is %s\n", *name, *age)

	// argsTest()
	// dialogTest()

}

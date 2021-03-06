package main

import (
	"fmt"
	"log"
	"os"
	"strconv"
)

func main() {
	if len(os.Args) != 2 {
		log.Fatalf("Usage: %s <bin-number>", os.Args[0])
	}

	n, err := strconv.ParseInt(os.Args[1], 2, 64)
	if err != nil {
		log.Fatal(err)
	}
	fmt.Println(n)
}

package main

import (
	"fmt"
	"log"
	"os"
	"strconv"
)

func init() {
	log.SetFlags(0)
}

func main() {
	if len(os.Args) != 2 {
		log.Fatalf("Usage: %s <bin-number>", os.Args[0])
	}

	n, err := strconv.ParseInt(os.Args[1], 2, 64)
	if err != nil {
		log.Fatal(err)
	}
	fmt.Println(strconv.FormatInt(n, 16))
}

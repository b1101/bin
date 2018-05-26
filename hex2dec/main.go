package main

import (
	"fmt"
	"log"
	"os"
	"strconv"
	"strings"
)

func init() {
	log.SetFlags(0)
}

func main() {
	if len(os.Args) != 2 {
		log.Fatalf("Usage: %s <hex-number>", os.Args[0])
	}

	n, err := strconv.ParseInt(strings.TrimPrefix(os.Args[1], "0x"), 16, 64)
	if err != nil {
		log.Fatal(err)
	}
	fmt.Println(n)
}

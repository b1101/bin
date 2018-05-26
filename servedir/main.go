package main

import (
	"flag"
	"log"
	"net/http"
)

var (
	dir  = flag.String("dir", "", "dir to serve from")
	addr = flag.String("address", ":42001", "address to share on")
)

func init() {
	log.SetFlags(0)
}

func main() {
	flag.Parse()

	switch {
	case *dir == "":
		log.Fatal("`dir` must be set")
	case *addr == "":
		log.Fatal("`address` must be set")
	}

	log.Printf("Serving %s cotents on %s...", *dir, *addr)
	http.Handle("/", http.FileServer(http.Dir(*dir)))

	if err := http.ListenAndServe(*addr, nil); err != nil {
		log.Fatalln("Failed to serve:", err)
	}
}

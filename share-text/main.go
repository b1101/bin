package main

import (
	"flag"
	"log"
	"net/http"
	"strings"
)

func init() {
	log.SetFlags(0)
}

var (
	addr    = flag.String("http", ":42000", "address to share on")
	newline = flag.Bool("n", true, "output the trailing newline")
)

func main() {
	flag.Parse()

	b := []byte(strings.Join(flag.Args(), " "))
	if *newline {
		b = append(b, '\n')
	}

	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		n, err := w.Write(b)
		if err != nil {
			log.Printf("Failed to write text to %s", r.RemoteAddr)
			http.Error(w, "Failed to write", http.StatusInternalServerError)
			return
		}
		log.Printf("Wrote %d bytes to %s", n, r.RemoteAddr)
	})

	log.Printf("Sharing %d bytes on %s", len(b), *addr)
	if err := http.ListenAndServe(*addr, nil); err != nil {
		log.Fatalln("Failed to serve:", err)
	}
}

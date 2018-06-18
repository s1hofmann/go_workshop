package main

import (
	"fmt"
	"log"
	"net/http"
)

func main() {
	log.Print("The application is starting...")

	http.HandleFunc("/", rootHandler())
	log.Fatal(http.ListenAndServe(":8080", nil))
}

func rootHandler() http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Hello world!\n")
	}
}

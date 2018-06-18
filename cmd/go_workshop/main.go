package main

import (
	"fmt"
	"net/http"
)

func main() {

	http.HandleFunc("/", rootHandler())
	http.ListenAndServe(":8080", nil)
}

func rootHandler() http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Hello world!\n")
	}
}

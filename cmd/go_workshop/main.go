package main

import (
	"fmt"
	"log"
	"net/http"

	"github.com/gorilla/mux"
)

func main() {
	log.Print("The application is starting...")

	r := mux.NewRouter()
	r.HandleFunc("/home", rootHandler())

	log.Fatal(http.ListenAndServe(":8080", r))
}

func rootHandler() http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Hello world!\n")
	}
}

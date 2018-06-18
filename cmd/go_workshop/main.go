package main

import (
	"log"
	"net/http"

	"github.com/s1hofmann/go_workshop/internal/routing"
)

func main() {
	log.Print("The application is starting...")

	r := routing.NewBLRouter()

	log.Fatal(http.ListenAndServe(":8080", r))
}

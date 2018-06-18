package routing

import (
	"fmt"
	"net/http"

	"github.com/gorilla/mux"
)

func NewBLRouter() http.Handler {
	r := mux.NewRouter()
	r.HandleFunc("/home", rootHandler())
	return r
}

func rootHandler() http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Hello world!\n")
	}
}

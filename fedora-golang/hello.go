package main

import (
    "fmt"
    "net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
    fmt.Fprint(w, "Hello, world!")
}

func init() {
    http.HandleFunc("/", handler)
    http.ListenAndServe(":8080", nil)
}

func main() {}

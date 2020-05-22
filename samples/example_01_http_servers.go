package main

import "fmt"
import "net/http"

func hello(w http.ResponseWriter, req http.Request) {
  fmt.Fprintf(w, "hello")
}

func main() {
  http.HandleFunc("/hello", hello)
  http.ListenAndServe(":8090", nil)
}

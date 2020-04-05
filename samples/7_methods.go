package main

import "fmt"

type rect struct {
    width int

    height int

}

func (s *rect) area() int {
  return s.width * s.height
}

func (s *rect) perim() int {
  return 2 * s.width + 2 * s.height
}

func main() {
  var r = rect{width: 10, height: 5}

  fmt.Println("area: ", r.area())
  fmt.Println("perim: ", r.perim())
}

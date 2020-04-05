package main

import "fmt"

func plus(a int, b int) int {
  return a + b
}

func plus_plus(a int, b int, c int) int {
  return a + b + c
}

func main() {
  var res = plus(1, 2)

  fmt.Println(res)

  fmt.Println("1 + 2 + 3 = ", plus_plus(1, 2, 3))
}

package main

import "fmt"

const name = "constant"

func main() {
  fmt.Println(name)

  const number = 500000000

  const second_number = 200 / number

  fmt.Println(second_number)
}

# Rgo

Ruby like programming language, syntax by Ruby, Performance by Go

## Installation

    $ gem install rgo-lang

## Usage
```ruby
# hello_world.rgo
module Main
  include Fmt
  include Net::Http

  # type (ResponseWriter, *Request) -> nil
  def hello(w, req)
    fprintf(w, "hello")
  end

  def main
    handle_func("/hello", hello)
    listen_and_serve(":8090", nil)
  end
end
```
    $ rgo run hello_world.rgo

checkout [Samples](samples)

## TODO

* function call without parentheses

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

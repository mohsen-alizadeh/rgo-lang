
describe Rgo::Tokenizer do
  samples = [
    [
      :comments,
      [
        [:COMMENT, " first comment"],
        [:COMMENT, " second comment"],
        [:COMMENT, ""]
      ],
      <<-EOL
        # first comment
        # second comment
        #
      EOL
    ],
    [
      :string,
      [
        [:STRING, "simple string"]
      ],
      <<-EOL
        "simple string"
      EOL
    ],
    [
      :complex_code_1,
      [
        [:KEYWORD_CLASS, "class"],
        [:CONSTANT, "Student"],
        [:INSTANCE_VARIABLE, "name"],
        [:KEYWORD_ASSIGN, "="],
        [:STRING, "mohsen"],
        [:KEYWORD_END, "end"]
      ],
      <<-EOL
        class Student
          @name = "mohsen"
        end
      EOL
    ],
    [
      :sample_1,
      [
        [:KEYWORD_REQUIRE, "require"],
        [:BLANK_LINE, ""],
        [:STRING, "fmt"],
        [:KEYWORD_MODULE, "module"],
        [:CONSTANT, "Main"],
        [:IDENTIFIER, "println"],
        [:LPAREN, "("],
        [:STRING, "hello world"],
        [:RPAREN, ")"],
        [:KEYWORD_END, "end"],
        [:BLANK_LINE, ""]
      ],
      <<-EOL
        require "fmt"

        module Main
          println("hello world")
        end

      EOL
    ],
    [
      :assignment,
      [
        [:IDENTIFIER, "a"],
        [:KEYWORD_ASSIGN, "="],
        [:KEYWORD_TRUE, "true"],
        [:IDENTIFIER, "b"],
        [:KEYWORD_ASSIGN, "="],
        [:INTEGER, 1],
        [:IDENTIFIER, "c"],
        [:KEYWORD_ASSIGN, "="],
        [:STRING, "mohsen"]
      ],
      <<-EOL
        a = true
        b = 1
        c = "mohsen"
      EOL
    ],
    [
      :if_else,
      [
        [:KEYWORD_IF, "if"],
        [:IDENTIFIER, "num"],
        [:LESS, "<"],
        [:INTEGER, 8],
        [:IDENTIFIER, "println"],
        [:LPAREN, "("],
        [:STRING, "state 1"],
        [:RPAREN, ")"],
        [:KEYWORD_ELSIF, "elsif"],
        [:IDENTIFIER, "num"],
        [:GREATER, ">"],
        [:INTEGER, 1],
        [:IDENTIFIER, "println"],
        [:LPAREN, "("],
        [:STRING, "state 2"],
        [:RPAREN, ")"],
        [:KEYWORD_ELSE, "else"],
        [:IDENTIFIER, "println"],
        [:LPAREN, "("],
        [:STRING, "state 3"],
        [:RPAREN, ")"],
        [:KEYWORD_END, "end"]
      ],
      <<-EOL
        if num < 8
          println("state 1")
        elsif num > 1
          println("state 2")
        else
          println("state 3")
        end
      EOL
    ],
    [
      :number_operator,
      [
        [:INTEGER, 1],
        [:PLUS, "+"],
        [:INTEGER, 2],
        [:MINUS, "-"],
        [:INTEGER, 3],
        [:MULTIPLY, "*"],
        [:INTEGER, 4],
        [:DIVIDE, "/"],
        [:INTEGER, 5],
      ],
      <<-EOL
        1 + 2 - 3 * 4 / 5
      EOL
    ],
    [
      :interface,
      [
        [:KEYWORD_INTERFACE, "interface"],
        [:CONSTANT, "Geometry"],
        [:KEYWORD_END, "end"]
      ],
      <<-EOL
        interface Geometry
        end
      EOL
    ]
  ]

  it "tokenizes the string" do
    samples.each do |sample|
      tokens = described_class.new(sample[2]).tokens - [[false, false]]
      expect(tokens).to match_array(sample[1])
    end
  end
end

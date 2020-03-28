
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
        [:STRING, "fmt"],
        [:KEYWORD_MODULE, "module"],
        [:CONSTANT, "Main"],
        [:IDENTIFIER, "println"],
        [:LPAREN, "("],
        [:STRING, "hello world"],
        [:RPAREN, ")"],
        [:KEYWORD_END, "end"]
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
    ]
  ]

  it "tokenizes the string" do
    samples.each do |sample|
      tokens = described_class.new(sample[2]).tokens - [[false, false]]
      expect(tokens).to match_array(sample[1])
    end
  end
end

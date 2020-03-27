require 'strscan'

module Rgo
  class Tokenizer
    def initialize(source)
      @source = source
    end

    def tokens
      @q = []
      scanner = StringScanner.new(@source)

      until scanner.empty?
        case
          when scanner.scan(/\s+/)
          when m = scanner.scan(/\d+/)
            @q.push [:NUMBER, m.to_i]
          when m = scanner.scan(Expression::KEYWORDS)
            @q.push [:"KEYWORD_#{m.upcase}", m]
          when m = scanner.scan(Expression::COMMENT)
            @q.push [:COMMENT, m[1..-1]]
          when m = scanner.scan(Expression::STRING)
            @q.push [:STRING, m[1..-2]]
          when m = scanner.scan(Expression::CONSTANT)
            @q.push [:CONSTANT, m]
          when m = scanner.scan(Expression::IDENTIFIER)
            @q.push [:IDENTIFIER, m]
          when m = scanner.scan(/=/)
            @q.push [:KEYWORD_EQUAL, "="]
          when m = scanner.scan(/\(/)
            @q.push [:LPAREN, "("]
          when m = scanner.scan(/\)/)
            @q.push [:RPAREN, ")"]
          when m = scanner.scan(Expression::INSTANCE_VARIABLE)
            @q.push [:INSTANCE_VARIABLE, m[1..-1]]
          when m = scanner.scan(/.|\n/)
            @q.push [m, m]
        end
      end

      @q.push [false, false]

      @q
    end

    module Expression
      NEWLINE = /\r\n|\n\r|\r|\n/

      SPACE_1 = /[\t ]+/
      SPACE_2 = /\\[\t ]*#{NEWLINE}/
      #SPACE = %r(#{SPACE_1}|#{SPACE_2})

      IDENTIFIER = /[a-z]\w*/

      # scarry comment - bad style - beward of '\' at end of line...
      comment = /\#(?:\\[ \t]*#{NEWLINE}|[^\r\n])*/m
      COMMENT = %r(#{comment})m

      sym_1 = /\+=|\-=|\*=|\/=|%=|\&=|\^=|\|=|<<=|>>=|##|\.\.\./
      sym_2 = /==|!=|<=|>=|->|\&\&|\|\||<<|>>|\+\+|\-\-/
      sym_3 = /<:|:>|<%|%>|%:%:|%:/ # Digraph
      sym_4 = /[\(\)\[\]\{\}\|\&\+\-\/\*%<>\.,=!:;\?\^~#]/
      SYMBOL = %r(#{sym_1}|#{sym_2}|#{sym_3}|#{sym_4})

      STRING = /L?"(?:\\.|[^"])*"/m

      CONSTANT = /[A-Z]\w*/

      INSTANCE_VARIABLE = /\@\w+/

      KEYWORDS = /class|end|require|module|def|include/
    end # Expression
  end
end


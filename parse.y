class Rgo::Parser

rule
	target
		: statement_list
		;

	statement_list
		: statement
		| statement_list statement { result = val }
		;

	statement
    | comment_statement
		| module_statement
		| require_statement
		| func_call
    | func_def
    | include_statement
    | assignment_statement
		;

	if_statement
		: 'if' '(' expression ')' statement
			{ result = "<#{val[2]} implies #{val[4]}>\n" }
		| 'if' '(' expression ')' statement 'else' statement
			{ result = "<#{val[2]} implies #{val[4]} otherwise #{val[6]}>\n" }
		;

	require_statement: KEYWORD_REQUIRE STRING { result = Node.new(:require, val[1]) }

	module_statement: KEYWORD_MODULE CONSTANT statement_list KEYWORD_END {
			result = Node.new(:module, val[1], val[2])
		}
		;

	func_call: IDENTIFIER LPAREN args RPAREN { result = Node.new(:func_call, val[0], val[2]) }

  args: arg { result = Array(val[0]) } | args arg { result = val }

	arg: STRING { result = Node.new(:string, val[0]) }
      | IDENTIFIER { result = Node.new(:variable, val[0]) }
      ;


  func_def:
    KEYWORD_DEF IDENTIFIER LPAREN args RPAREN statement_list KEYWORD_END {
      result = Node.new(:func_def, val[1], [val[3], val[5]])
    }
    | KEYWORD_DEF IDENTIFIER LPAREN RPAREN statement_list KEYWORD_END {
      result = Node.new(:func_def, val[1], [nil, val[4]])
    }
    | KEYWORD_DEF IDENTIFIER statement_list KEYWORD_END {
      result = Node.new(:func_def, val[1], [nil, val[2]])
    }
    ;

  include_statement: KEYWORD_INCLUDE CONSTANT { result = Node.new(:include, val[1]) };

  comment_statement: COMMENT { result = Node.new(:comment, val[0]) };

  assignment_statement: IDENTIFIER KEYWORD_ASSIGN expression { result = Node.new(:assignment, val[0], [val[2]]) }

	expression
		: IDENTIFIER '(' ')' { result = val[0,3].join }
		| IDENTIFIER
    | STRING { result = Node.new(:string, val[0]) }
    | INTEGER { result = Node.new(:integer, val[0].to_i) }
    | boolean
		;

  boolean
    : KEYWORD_TRUE  { result = Node.new(:boolean, true) }
    | KEYWORD_FALSE { result = Node.new(:boolean, false) }
    ;
end

---- header ----

require 'strscan'
require_relative './tokenizer.rb'
require_relative './node.rb'

---- inner ----

def parse(str)
  @q = Tokenizer.new(str).tokens

  puts @q.inspect

  do_parse
end

def next_token
  @q.shift
end

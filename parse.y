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
		| module_statement
		| require_statement
		| func_call
    | func_def
    | include_statement
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
      ;


  func_def:
    KEYWORD_DEF IDENTIFIER LPAREN args RPAREN statement_list KEYWORD_END {
      result = Node.new(:func_def, val[1], [val[3], val[5]])
    }
    | KEYWORD_DEF IDENTIFIER LPAREN RPAREN statement_list KEYWORD_END {
      result = Node.new(:func_def, val[1], [nil, val[4]])
    }
    ;

  include_statement: KEYWORD_INCLUDE CONSTANT { result = Node.new(:include, val[1]) };

	expression
		: IDENTIFIER '(' ')' { result = val[0,3].join }
		| IDENTIFIER
		;
end

---- header ----

require 'strscan'
require_relative './tokenizer.rb'
require_relative './node.rb'

---- inner ----

def parse(str)
  @q = Tokenizer.new(str).tokens

  do_parse
end

def next_token
  @q.shift
end

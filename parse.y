class Rgo::Parser
  options no_result_var

	prechigh
		nonassoc UMINUS
		left '^'
		left '*' '/'
		left '+' '-'
	preclow

rule
	target
		: statement_list
		;

	statement_list
		: statement
		| statement_list statement { val }
		;

	statement
    : /* NONDE */
    | comment_statement
		| module_statement
		| require_statement
		| func_call
    | func_def
    | include_statement
    | assignment_statement
    | blank_line
    | if_statement
    | expression_statement
    | alias_statement
		;

  if_statement
    : KEYWORD_IF LPAREN expression RPAREN statement_list KEYWORD_END
      { Node.new(:if, val[2], val[4]) }

    | KEYWORD_IF LPAREN expression RPAREN statement_list KEYWORD_ELSE statement_list KEYWORD_END
      { Node.new(:if_else, val[2], [val[4], val[6]]) }
    ;

  else_statement
    : KEYWORD_ELSE statement_list

	require_statement: KEYWORD_REQUIRE STRING { Node.new(:require, val[1]) }

	module_statement
    : KEYWORD_MODULE CONSTANT statement_list KEYWORD_END
      { Node.new(:module, val[1], val[2]) }
		;

	func_call: IDENTIFIER LPAREN args RPAREN { Node.new(:func_call, val[0], val[2]) }

  args
    : arg       { Array(val[0]) }
    | args arg  { val           }

	arg
    : STRING      { Node.new(:string, val[0])    }
    | IDENTIFIER  { Node.new(:variable, val[0])  }
    ;


  func_def
    : KEYWORD_DEF IDENTIFIER LPAREN args RPAREN statement_list KEYWORD_END
      { Node.new(:func_def, val[1], [val[3], val[5]]) }

    | KEYWORD_DEF IDENTIFIER LPAREN RPAREN statement_list KEYWORD_END
      { Node.new(:func_def, val[1], [nil, val[4]]) }

    | KEYWORD_DEF IDENTIFIER statement_list KEYWORD_END
      { Node.new(:func_def, val[1], [nil, val[2]]) }

    ;

  include_statement: KEYWORD_INCLUDE CONSTANT { Node.new(:include, val[1]) };

  comment_statement: COMMENT { Node.new(:comment, val[0]) };

  assignment_statement: IDENTIFIER KEYWORD_ASSIGN expression { Node.new(:assignment, val[0], [val[2]]) }

  expression_statement
    : expression
    ;

  alias_statement
    : KEYWORD_ALIAS IDENTIFIER IDENTIFIER { Node.new(:alias, val[1], val[2]) }
    ;

	expression
		: IDENTIFIER '(' ')' { val[0,3].join }
		| IDENTIFIER
    | STRING      { Node.new(:string, val[0])        }
    | INTEGER     { Node.new(:integer, val[0].to_i)  }
    | boolean
    | expression number_operator expression { Node.new(val[1], nil, [val[0], val[2]]) }
		;

  number_operator
    : PLUS      { :plus      }
    | MINUS     { :minus     }
    | MULTIPLY  { :multiply  }
    | DIVIDE    { :divide    }
    | GREATER   { :greater   }
    | LESS      { :less      }
    | EQUAL     { :equal     }
    | MOD       { :mod       }
    ;

  boolean
    : KEYWORD_TRUE  { Node.new(:boolean, true) }
    | KEYWORD_FALSE { Node.new(:boolean, false) }
    ;

  blank_line: BLANK_LINE { Node.new(:blank_line, "") }
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

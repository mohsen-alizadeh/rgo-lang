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
    | interface_statement
    | require_statement
    | func_call
    | func_def
    | include_statement
    | assignment_statement
    | constant_assignment_statement
    | blank_line
    | if_statement
    | expression_statement
    | alias_statement
    | return_statement
    | class_statement
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

  interface_statement
    : KEYWORD_INTERFACE CONSTANT statement_list KEYWORD_END
      { Node.new(:interface, val[1], val[2]) }
    ;

  func_call: IDENTIFIER LPAREN args RPAREN { Node.new(:func_call, val[0], val[2]) }

  args
    : arg             { Array(val[0]).flatten     }
    | args COMMA arg  { [val[0], val[2]].flatten   }
    ;

  arg
    : none
    | STRING      { Node.new(:string, val[0])    }
    | IDENTIFIER  { Node.new(:variable, val[0])  }
    | expression  { val[0] }
    ;


  func_def
    : KEYWORD_DEF IDENTIFIER LPAREN func_def_args RPAREN statement_list KEYWORD_END
      { Node.new(:func_def, val[1], [val[3], val[5]]) }

    | KEYWORD_DEF IDENTIFIER LPAREN RPAREN statement_list KEYWORD_END
      { Node.new(:func_def, val[1], [nil, val[4]]) }

    | KEYWORD_DEF IDENTIFIER statement_list KEYWORD_END
      { Node.new(:func_def, val[1], [nil, val[2]]) }

    ;

  func_def_args
    : func_def_arg                      { val[0]                    }
    | func_def_args COMMA func_def_arg  { [val[0], val[2]].flatten  }
    ;

  func_def_arg
    : IDENTIFIER { Node.new(:variable, val[0]) }
    ;

  include_statement: KEYWORD_INCLUDE CONSTANT { Node.new(:include, val[1]) };

  comment_statement: COMMENT { Node.new(:comment, val[0]) };

  assignment_statement: IDENTIFIER KEYWORD_ASSIGN expression { Node.new(:assignment, val[0], [val[2]]) }

  constant_assignment_statement: CONSTANT KEYWORD_ASSIGN expression { Node.new(:constant_assignment, val[0], [val[2]]) }

  expression_statement
    : expression { Node.new(:return, nil, val[0])    }
    ;

  alias_statement
    : KEYWORD_ALIAS IDENTIFIER IDENTIFIER { Node.new(:alias, val[1], val[2]) }
    ;

  expression
    : IDENTIFIER '(' ')'                    { val[0,3].join                             }
    | IDENTIFIER                            { Node.new(:variable, val[0])               }
    | STRING                                { Node.new(:string, val[0])                 }
    | INTEGER                               { Node.new(:integer, val[0].to_i)           }
    | boolean
    | expression number_operator expression { Node.new(val[1], nil, [val[0], val[2]])   }
    | CONSTANT                              { Node.new(:constant, val[0])               }
    | func_call
    | INSTANCE_VARIABLE                     { Node.new(:instance_variable_get,  val[0]) }
    | class_new
    | class_instance_method_call
    ;


  return_statement
    : KEYWORD_RETURN expression { Node.new(:return, nil, val[1]) }
    ;

  class_statement
    : KEYWORD_CLASS CONSTANT instance_variables_def methods_def KEYWORD_END
      { Node.new(:class, val[1], [val[2], val[3]]) }
    ;

  instance_variables_def
    : instance_variable_def
    | instance_variables_def instance_variable_def
      { val.flatten }
    ;

  instance_variable_def
    : INSTANCE_VARIABLE { Node.new(:instance_variable_def, val[0]) }
    | blank_line
    | comment_statement
    ;

  methods_def
    : method_def
    | methods_def method_def
      { val.flatten }
    ;

  method_def
    : comment_statement
    | func_def
    | blank_line
    ;


  class_new
    : CONSTANT DOT IDENTIFIER LPAREN arg_options RPAREN { Node.new(:class_method_call, val[0], [val[2], val[4]]) }
    ;

  arg_options
    : arg_option
    | arg_options COMMA arg_option { [val[0], val[2]] }
    ;

  arg_option
    : none
    | IDENTIFIER COLON expression { [val[0], val[2]] }
    ;

  class_instance_method_call
    : IDENTIFIER DOT IDENTIFIER LPAREN args RPAREN { Node.new(:class_instance_method_call, val[0], [val[2], val[4]]) }

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

  none
    : /* NONE */
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

def on_error(error_token_id, error_value, value_stack)
  token_name = token_to_str(error_token_id)
  token = error_value.to_s.inspect

  str = 'parse error on '
  str << token_name << ' ' unless token_name == token
  str << token
  raise str
end

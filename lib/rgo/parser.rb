#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.4.16
# from Racc grammar file "".
#

require 'racc/parser.rb'


require 'strscan'
require_relative './tokenizer.rb'
require_relative './node.rb'

module Rgo
  class Parser < Racc::Parser

module_eval(<<'...end parse.y/module_eval...', 'parse.y', 124)

def parse(str)
  @q = Tokenizer.new(str).tokens

  puts @q.inspect

  do_parse
end

def next_token
  @q.shift
end
...end parse.y/module_eval...
##### State transition tables begin ###

racc_action_table = [
    15,    35,    30,    32,    33,    16,    24,    17,    34,    18,
    19,    20,    21,    36,    23,    37,    66,    25,    70,    38,
    56,    39,    56,    57,    15,    57,    27,    28,    29,    16,
    24,    17,    49,    18,    19,    20,    21,    56,    23,    72,
    57,    25,    50,    56,    59,    63,    57,    37,    15,   nil,
    27,    28,    29,    16,    24,    17,   nil,    18,    19,    20,
    21,   nil,    23,   nil,   nil,    25,   nil,   nil,   nil,   nil,
   nil,   nil,    15,    61,    27,    28,    29,    16,    24,    17,
   nil,    18,    19,    20,    21,   nil,    23,   nil,   nil,    25,
    41,    42,    43,    44,    45,    46,    47,    48,    27,    28,
    29,    15,   nil,    64,    65,   nil,    16,    24,    17,   nil,
    18,    19,    20,    21,   nil,    23,   nil,   nil,    25,    41,
    42,    43,    44,    45,    46,    47,    48,    27,    28,    29,
    15,   nil,   nil,    68,   nil,    16,    24,    17,   nil,    18,
    19,    20,    21,   nil,    23,   nil,   nil,    25,   nil,   nil,
   nil,   nil,   nil,   nil,    15,   nil,    27,    28,    29,    16,
    24,    17,   nil,    18,    19,    20,    21,   nil,    23,   nil,
   nil,    25,   nil,   nil,   nil,   nil,   nil,   nil,    15,   nil,
    27,    28,    29,    16,    24,    17,   nil,    18,    19,    20,
    21,   nil,    23,   nil,   nil,    25,    41,    42,    43,    44,
    45,    46,    47,    48,    27,    28,    29,    15,   nil,   nil,
    74,    75,    16,    24,    17,   nil,    18,    19,    20,    21,
   nil,    23,   nil,   nil,    25,   nil,   nil,   nil,   nil,   nil,
   nil,    15,   nil,    27,    28,    29,    16,    24,    17,   nil,
    18,    19,    20,    21,   nil,    23,   nil,   nil,    25,    41,
    42,    43,    44,    45,    46,    47,    48,    27,    28,    29,
    15,   nil,   nil,    77,   nil,    16,    24,    17,   nil,    18,
    19,    20,    21,   nil,    23,   nil,   nil,    25,   nil,   nil,
   nil,   nil,   nil,   nil,    15,   nil,    27,    28,    29,    16,
    24,    17,   nil,    18,    19,    20,    21,   nil,    23,   nil,
   nil,    25,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
    27,    28,    29,    15,   nil,   nil,    79,   nil,    16,    24,
    17,   nil,    18,    19,    20,    21,   nil,    23,   nil,   nil,
    25,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,    27,
    28,    29,    15,   nil,   nil,    80,   nil,    16,    24,    17,
   nil,    18,    19,    20,    21,    24,    23,   nil,    52,    25,
    24,   nil,    24,    52,   nil,    52,    25,   nil,    27,    28,
    29,    25,   nil,    25,   nil,    27,    28,   nil,   nil,   nil,
    27,    28,    27,    28 ]

racc_action_check = [
     0,    18,     1,    15,    16,     0,     0,     0,    17,     0,
     0,     0,     0,    18,     0,    18,    54,     0,    61,    19,
    54,    20,    61,    54,     2,    61,     0,     0,     0,     2,
     2,     2,    23,     2,     2,     2,     2,    35,     2,    69,
    35,     2,    30,    69,    37,    49,    69,    52,    34,   nil,
     2,     2,     2,    34,    34,    34,   nil,    34,    34,    34,
    34,   nil,    34,   nil,   nil,    34,   nil,   nil,   nil,   nil,
   nil,   nil,    38,    38,    34,    34,    34,    38,    38,    38,
   nil,    38,    38,    38,    38,   nil,    38,   nil,   nil,    38,
    22,    22,    22,    22,    22,    22,    22,    22,    38,    38,
    38,    53,   nil,    51,    53,   nil,    53,    53,    53,   nil,
    53,    53,    53,    53,   nil,    53,   nil,   nil,    53,    51,
    51,    51,    51,    51,    51,    51,    51,    53,    53,    53,
    60,   nil,   nil,    60,   nil,    60,    60,    60,   nil,    60,
    60,    60,    60,   nil,    60,   nil,   nil,    60,   nil,   nil,
   nil,   nil,   nil,   nil,    64,   nil,    60,    60,    60,    64,
    64,    64,   nil,    64,    64,    64,    64,   nil,    64,   nil,
   nil,    64,   nil,   nil,   nil,   nil,   nil,   nil,    70,   nil,
    64,    64,    64,    70,    70,    70,   nil,    70,    70,    70,
    70,   nil,    70,   nil,   nil,    70,    58,    58,    58,    58,
    58,    58,    58,    58,    70,    70,    70,    71,   nil,   nil,
    71,    71,    71,    71,    71,   nil,    71,    71,    71,    71,
   nil,    71,   nil,   nil,    71,   nil,   nil,   nil,   nil,   nil,
   nil,    72,   nil,    71,    71,    71,    72,    72,    72,   nil,
    72,    72,    72,    72,   nil,    72,   nil,   nil,    72,    62,
    62,    62,    62,    62,    62,    62,    62,    72,    72,    72,
    73,   nil,   nil,    73,   nil,    73,    73,    73,   nil,    73,
    73,    73,    73,   nil,    73,   nil,   nil,    73,   nil,   nil,
   nil,   nil,   nil,   nil,    75,   nil,    73,    73,    73,    75,
    75,    75,   nil,    75,    75,    75,    75,   nil,    75,   nil,
   nil,    75,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
    75,    75,    75,    76,   nil,   nil,    76,   nil,    76,    76,
    76,   nil,    76,    76,    76,    76,   nil,    76,   nil,   nil,
    76,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,    76,
    76,    76,    78,   nil,   nil,    78,   nil,    78,    78,    78,
   nil,    78,    78,    78,    78,    32,    78,   nil,    32,    78,
    36,   nil,    40,    36,   nil,    40,    32,   nil,    78,    78,
    78,    36,   nil,    40,   nil,    32,    32,   nil,   nil,   nil,
    36,    36,    40,    40 ]

racc_action_pointer = [
    -8,     2,    16,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,    -6,   -10,    -8,    -8,     2,
     5,   nil,    64,    15,   nil,   nil,   nil,   nil,   nil,   nil,
    42,   nil,   341,   nil,    40,    23,   346,    20,    64,   nil,
   348,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,    28,
   nil,    93,    24,    93,     6,   nil,   nil,   nil,   170,   nil,
   122,     8,   223,   nil,   146,   nil,   nil,   nil,   nil,    29,
   170,   199,   223,   252,   nil,   276,   305,   nil,   334,   nil,
   nil ]

racc_action_default = [
    -4,   -51,    -1,    -2,    -5,    -6,    -7,    -8,    -9,   -10,
   -11,   -12,   -13,   -14,   -15,   -51,   -51,   -51,   -35,   -51,
   -51,   -30,   -32,   -51,   -36,   -37,   -38,   -48,   -49,   -50,
   -51,    -3,   -51,   -19,    -4,   -51,   -51,   -51,    -4,   -29,
   -51,   -40,   -41,   -42,   -43,   -44,   -45,   -46,   -47,   -51,
    81,   -51,   -35,   -51,   -51,   -22,   -24,   -25,   -31,   -34,
   -51,   -51,   -39,   -33,    -4,   -20,   -21,   -23,   -28,   -51,
    -4,   -51,    -4,   -51,   -16,    -4,   -51,   -27,   -51,   -26,
   -17 ]

racc_goto_table = [
    31,    54,    67,     2,    51,     1,   nil,   nil,    58,   nil,
   nil,   nil,    62,   nil,   nil,   nil,   nil,    67,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,    69,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,    53,   nil,   nil,
   nil,    60,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,    31,   nil,   nil,   nil,   nil,   nil,   nil,    31,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,    71,   nil,    31,
   nil,    31,   nil,    73,    31,    76,    31,   nil,    78 ]

racc_goto_check = [
     3,    17,    18,     2,    15,     1,   nil,   nil,    15,   nil,
   nil,   nil,    15,   nil,   nil,   nil,   nil,    18,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,    17,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,     2,   nil,   nil,
   nil,     2,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,     3,   nil,   nil,   nil,   nil,   nil,   nil,     3,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,     2,   nil,     3,
   nil,     3,   nil,     2,     3,     2,     3,   nil,     2 ]

racc_goto_pointer = [
   nil,     5,     3,    -2,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   -28,   nil,   -34,   -52,   nil,
   nil ]

racc_goto_default = [
   nil,   nil,   nil,     3,     4,     5,     6,     7,     8,     9,
    10,    11,    12,    13,    14,    22,   nil,   nil,    55,    26,
    40 ]

racc_reduce_table = [
  0, 0, :racc_error,
  1, 38, :_reduce_none,
  1, 39, :_reduce_none,
  2, 39, :_reduce_3,
  0, 40, :_reduce_none,
  1, 40, :_reduce_none,
  1, 40, :_reduce_none,
  1, 40, :_reduce_none,
  1, 40, :_reduce_none,
  1, 40, :_reduce_none,
  1, 40, :_reduce_none,
  1, 40, :_reduce_none,
  1, 40, :_reduce_none,
  1, 40, :_reduce_none,
  1, 40, :_reduce_none,
  1, 40, :_reduce_none,
  6, 49, :_reduce_16,
  8, 49, :_reduce_17,
  2, 53, :_reduce_none,
  2, 43, :_reduce_19,
  4, 42, :_reduce_20,
  4, 44, :_reduce_21,
  1, 54, :_reduce_22,
  2, 54, :_reduce_23,
  1, 55, :_reduce_24,
  1, 55, :_reduce_25,
  7, 45, :_reduce_26,
  6, 45, :_reduce_27,
  4, 45, :_reduce_28,
  2, 46, :_reduce_29,
  1, 41, :_reduce_30,
  3, 47, :_reduce_31,
  1, 50, :_reduce_none,
  3, 51, :_reduce_33,
  3, 52, :_reduce_34,
  1, 52, :_reduce_none,
  1, 52, :_reduce_36,
  1, 52, :_reduce_37,
  1, 52, :_reduce_none,
  3, 52, :_reduce_39,
  1, 57, :_reduce_40,
  1, 57, :_reduce_41,
  1, 57, :_reduce_42,
  1, 57, :_reduce_43,
  1, 57, :_reduce_44,
  1, 57, :_reduce_45,
  1, 57, :_reduce_46,
  1, 57, :_reduce_47,
  1, 56, :_reduce_48,
  1, 56, :_reduce_49,
  1, 48, :_reduce_50 ]

racc_reduce_n = 51

racc_shift_n = 81

racc_token_table = {
  false => 0,
  :error => 1,
  :UMINUS => 2,
  "^" => 3,
  "*" => 4,
  "/" => 5,
  "+" => 6,
  "-" => 7,
  :KEYWORD_IF => 8,
  :LPAREN => 9,
  :RPAREN => 10,
  :KEYWORD_END => 11,
  :KEYWORD_ELSE => 12,
  :KEYWORD_REQUIRE => 13,
  :STRING => 14,
  :KEYWORD_MODULE => 15,
  :CONSTANT => 16,
  :IDENTIFIER => 17,
  :KEYWORD_DEF => 18,
  :KEYWORD_INCLUDE => 19,
  :COMMENT => 20,
  :KEYWORD_ASSIGN => 21,
  :KEYWORD_ALIAS => 22,
  "(" => 23,
  ")" => 24,
  :INTEGER => 25,
  :PLUS => 26,
  :MINUS => 27,
  :MULTIPLY => 28,
  :DIVIDE => 29,
  :GREATER => 30,
  :LESS => 31,
  :EQUAL => 32,
  :MOD => 33,
  :KEYWORD_TRUE => 34,
  :KEYWORD_FALSE => 35,
  :BLANK_LINE => 36 }

racc_nt_base = 37

racc_use_result_var = true

Racc_arg = [
  racc_action_table,
  racc_action_check,
  racc_action_default,
  racc_action_pointer,
  racc_goto_table,
  racc_goto_check,
  racc_goto_default,
  racc_goto_pointer,
  racc_nt_base,
  racc_reduce_table,
  racc_token_table,
  racc_shift_n,
  racc_reduce_n,
  racc_use_result_var ]

Racc_token_to_s_table = [
  "$end",
  "error",
  "UMINUS",
  "\"^\"",
  "\"*\"",
  "\"/\"",
  "\"+\"",
  "\"-\"",
  "KEYWORD_IF",
  "LPAREN",
  "RPAREN",
  "KEYWORD_END",
  "KEYWORD_ELSE",
  "KEYWORD_REQUIRE",
  "STRING",
  "KEYWORD_MODULE",
  "CONSTANT",
  "IDENTIFIER",
  "KEYWORD_DEF",
  "KEYWORD_INCLUDE",
  "COMMENT",
  "KEYWORD_ASSIGN",
  "KEYWORD_ALIAS",
  "\"(\"",
  "\")\"",
  "INTEGER",
  "PLUS",
  "MINUS",
  "MULTIPLY",
  "DIVIDE",
  "GREATER",
  "LESS",
  "EQUAL",
  "MOD",
  "KEYWORD_TRUE",
  "KEYWORD_FALSE",
  "BLANK_LINE",
  "$start",
  "target",
  "statement_list",
  "statement",
  "comment_statement",
  "module_statement",
  "require_statement",
  "func_call",
  "func_def",
  "include_statement",
  "assignment_statement",
  "blank_line",
  "if_statement",
  "expression_statement",
  "alias_statement",
  "expression",
  "else_statement",
  "args",
  "arg",
  "boolean",
  "number_operator" ]

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

# reduce 1 omitted

# reduce 2 omitted

module_eval(<<'.,.,', 'parse.y', 16)
  def _reduce_3(val, _values, result)
     result = val
    result
  end
.,.,

# reduce 4 omitted

# reduce 5 omitted

# reduce 6 omitted

# reduce 7 omitted

# reduce 8 omitted

# reduce 9 omitted

# reduce 10 omitted

# reduce 11 omitted

# reduce 12 omitted

# reduce 13 omitted

# reduce 14 omitted

# reduce 15 omitted

module_eval(<<'.,.,', 'parse.y', 36)
  def _reduce_16(val, _values, result)
     result = Node.new(:if, val[2], val[4])
    result
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 39)
  def _reduce_17(val, _values, result)
     result = Node.new(:if_else, val[2], [val[4], val[6]])
    result
  end
.,.,

# reduce 18 omitted

module_eval(<<'.,.,', 'parse.y', 45)
  def _reduce_19(val, _values, result)
     result = Node.new(:require, val[1])
    result
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 49)
  def _reduce_20(val, _values, result)
     result = Node.new(:module, val[1], val[2])
    result
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 52)
  def _reduce_21(val, _values, result)
     result = Node.new(:func_call, val[0], val[2])
    result
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 54)
  def _reduce_22(val, _values, result)
     result = Array(val[0])
    result
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 54)
  def _reduce_23(val, _values, result)
     result = val
    result
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 57)
  def _reduce_24(val, _values, result)
     result = Node.new(:string, val[0])
    result
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 58)
  def _reduce_25(val, _values, result)
     result = Node.new(:variable, val[0])
    result
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 64)
  def _reduce_26(val, _values, result)
     result = Node.new(:func_def, val[1], [val[3], val[5]])
    result
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 67)
  def _reduce_27(val, _values, result)
     result = Node.new(:func_def, val[1], [nil, val[4]])
    result
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 70)
  def _reduce_28(val, _values, result)
     result = Node.new(:func_def, val[1], [nil, val[2]])
    result
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 74)
  def _reduce_29(val, _values, result)
     result = Node.new(:include, val[1])
    result
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 76)
  def _reduce_30(val, _values, result)
     result = Node.new(:comment, val[0])
    result
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 78)
  def _reduce_31(val, _values, result)
     result = Node.new(:assignment, val[0], [val[2]])
    result
  end
.,.,

# reduce 32 omitted

module_eval(<<'.,.,', 'parse.y', 85)
  def _reduce_33(val, _values, result)
     result = Node.new(:alias, val[1], val[2])
    result
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 89)
  def _reduce_34(val, _values, result)
     result = val[0,3].join
    result
  end
.,.,

# reduce 35 omitted

module_eval(<<'.,.,', 'parse.y', 91)
  def _reduce_36(val, _values, result)
     result = Node.new(:string, val[0])
    result
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 92)
  def _reduce_37(val, _values, result)
     result = Node.new(:integer, val[0].to_i)
    result
  end
.,.,

# reduce 38 omitted

module_eval(<<'.,.,', 'parse.y', 94)
  def _reduce_39(val, _values, result)
     result = Node.new(val[1], nil, [val[0], val[2]])
    result
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 98)
  def _reduce_40(val, _values, result)
     result = :plus
    result
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 99)
  def _reduce_41(val, _values, result)
     result = :minus
    result
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 100)
  def _reduce_42(val, _values, result)
     result = :multiply
    result
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 101)
  def _reduce_43(val, _values, result)
     result = :divide
    result
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 102)
  def _reduce_44(val, _values, result)
     result = :greater
    result
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 103)
  def _reduce_45(val, _values, result)
     result = :less
    result
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 104)
  def _reduce_46(val, _values, result)
     result = :equal
    result
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 105)
  def _reduce_47(val, _values, result)
     result = :mod
    result
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 109)
  def _reduce_48(val, _values, result)
     result = Node.new(:boolean, true)
    result
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 110)
  def _reduce_49(val, _values, result)
     result = Node.new(:boolean, false)
    result
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 113)
  def _reduce_50(val, _values, result)
     result = Node.new(:blank_line, "")
    result
  end
.,.,

def _reduce_none(val, _values, result)
  val[0]
end

  end   # class Parser
end   # module Rgo

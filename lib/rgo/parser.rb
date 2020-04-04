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

module_eval(<<'...end parse.y/module_eval...', 'parse.y', 132)

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
    16,    37,    32,    34,    35,    17,    26,    18,    23,    19,
    20,    21,    22,    38,    25,    39,    36,    27,    40,    41,
    42,    52,    53,    64,    16,    69,    29,    30,    31,    17,
    26,    18,    23,    19,    20,    21,    22,    39,    25,   nil,
   nil,    27,   nil,   nil,   nil,   nil,   nil,   nil,    16,   nil,
    29,    30,    31,    17,    26,    18,    23,    19,    20,    21,
    22,   nil,    25,   nil,   nil,    27,   nil,   nil,   nil,   nil,
   nil,   nil,    16,    66,    29,    30,    31,    17,    26,    18,
    23,    19,    20,    21,    22,   nil,    25,   nil,   nil,    27,
    44,    45,    46,    47,    48,    49,    50,    51,    29,    30,
    31,    16,   nil,    70,    71,   nil,    17,    26,    18,    23,
    19,    20,    21,    22,   nil,    25,   nil,   nil,    27,    44,
    45,    46,    47,    48,    49,    50,    51,    29,    30,    31,
    16,   nil,   nil,    74,   nil,    17,    26,    18,    23,    19,
    20,    21,    22,   nil,    25,   nil,   nil,    27,   nil,   nil,
   nil,   nil,   nil,   nil,    16,   nil,    29,    30,    31,    17,
    26,    18,    23,    19,    20,    21,    22,   nil,    25,   nil,
   nil,    27,   nil,   nil,   nil,   nil,   nil,   nil,    16,   nil,
    29,    30,    31,    17,    26,    18,    23,    19,    20,    21,
    22,   nil,    25,   nil,   nil,    27,    44,    45,    46,    47,
    48,    49,    50,    51,    29,    30,    31,    16,   nil,   nil,
    80,    81,    17,    26,    18,    23,    19,    20,    21,    22,
   nil,    25,   nil,   nil,    27,   nil,   nil,   nil,   nil,   nil,
   nil,    16,   nil,    29,    30,    31,    17,    26,    18,    23,
    19,    20,    21,    22,   nil,    25,   nil,   nil,    27,    44,
    45,    46,    47,    48,    49,    50,    51,    29,    30,    31,
    16,   nil,   nil,    83,   nil,    17,    26,    18,    23,    19,
    20,    21,    22,   nil,    25,   nil,   nil,    27,   nil,   nil,
   nil,   nil,   nil,   nil,    16,   nil,    29,    30,    31,    17,
    26,    18,    23,    19,    20,    21,    22,   nil,    25,   nil,
   nil,    27,    44,    45,    46,    47,    48,    49,    50,    51,
    29,    30,    31,    16,   nil,   nil,    85,   nil,    17,    26,
    18,    23,    19,    20,    21,    22,   nil,    25,   nil,   nil,
    27,    44,    45,    46,    47,    48,    49,    50,    51,    29,
    30,    31,    16,   nil,   nil,    86,   nil,    17,    26,    18,
    23,    19,    20,    21,    22,   nil,    25,    72,   nil,    27,
   nil,    60,   nil,    56,    61,   nil,   nil,   nil,    29,    30,
    31,   -25,    27,   nil,   nil,   -25,   nil,   -25,   -25,   nil,
   nil,    29,    30,   nil,   -26,   nil,   -25,   nil,   -26,   nil,
   -26,   -26,   nil,   nil,   nil,   -25,   -25,    39,    76,   -26,
   nil,   nil,    60,   nil,    56,    61,   nil,   nil,   -26,   -26,
    78,   nil,   nil,    27,    60,   nil,    56,    61,    26,   nil,
    56,    55,    29,    30,   nil,    27,   nil,   nil,   nil,    27,
    60,   nil,    56,    61,    29,    30,   nil,   nil,    29,    30,
   nil,    27,    26,   nil,    56,    55,    26,   nil,    56,    55,
    29,    30,   nil,    27,   nil,   nil,   nil,    27,    26,   nil,
    56,    55,    29,    30,   nil,   nil,    29,    30,   nil,    27,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,    29,    30 ]

racc_action_check = [
     0,    19,     1,    16,    17,     0,     0,     0,     0,     0,
     0,     0,     0,    19,     0,    19,    18,     0,    20,    21,
    23,    25,    32,    39,     2,    52,     0,     0,     0,     2,
     2,     2,     2,     2,     2,     2,     2,    55,     2,   nil,
   nil,     2,   nil,   nil,   nil,   nil,   nil,   nil,    36,   nil,
     2,     2,     2,    36,    36,    36,    36,    36,    36,    36,
    36,   nil,    36,   nil,   nil,    36,   nil,   nil,   nil,   nil,
   nil,   nil,    40,    40,    36,    36,    36,    40,    40,    40,
    40,    40,    40,    40,    40,   nil,    40,   nil,   nil,    40,
    24,    24,    24,    24,    24,    24,    24,    24,    40,    40,
    40,    57,   nil,    54,    57,   nil,    57,    57,    57,    57,
    57,    57,    57,    57,   nil,    57,   nil,   nil,    57,    54,
    54,    54,    54,    54,    54,    54,    54,    57,    57,    57,
    65,   nil,   nil,    65,   nil,    65,    65,    65,    65,    65,
    65,    65,    65,   nil,    65,   nil,   nil,    65,   nil,   nil,
   nil,   nil,   nil,   nil,    70,   nil,    65,    65,    65,    70,
    70,    70,    70,    70,    70,    70,    70,   nil,    70,   nil,
   nil,    70,   nil,   nil,   nil,   nil,   nil,   nil,    76,   nil,
    70,    70,    70,    76,    76,    76,    76,    76,    76,    76,
    76,   nil,    76,   nil,   nil,    76,    62,    62,    62,    62,
    62,    62,    62,    62,    76,    76,    76,    77,   nil,   nil,
    77,    77,    77,    77,    77,    77,    77,    77,    77,    77,
   nil,    77,   nil,   nil,    77,   nil,   nil,   nil,   nil,   nil,
   nil,    78,   nil,    77,    77,    77,    78,    78,    78,    78,
    78,    78,    78,    78,   nil,    78,   nil,   nil,    78,    63,
    63,    63,    63,    63,    63,    63,    63,    78,    78,    78,
    79,   nil,   nil,    79,   nil,    79,    79,    79,    79,    79,
    79,    79,    79,   nil,    79,   nil,   nil,    79,   nil,   nil,
   nil,   nil,   nil,   nil,    81,   nil,    79,    79,    79,    81,
    81,    81,    81,    81,    81,    81,    81,   nil,    81,   nil,
   nil,    81,    67,    67,    67,    67,    67,    67,    67,    67,
    81,    81,    81,    82,   nil,   nil,    82,   nil,    82,    82,
    82,    82,    82,    82,    82,    82,   nil,    82,   nil,   nil,
    82,    68,    68,    68,    68,    68,    68,    68,    68,    82,
    82,    82,    84,   nil,   nil,    84,   nil,    84,    84,    84,
    84,    84,    84,    84,    84,   nil,    84,    58,   nil,    84,
   nil,    58,   nil,    58,    58,   nil,   nil,   nil,    84,    84,
    84,    60,    58,   nil,   nil,    60,   nil,    60,    60,   nil,
   nil,    58,    58,   nil,    61,   nil,    60,   nil,    61,   nil,
    61,    61,   nil,   nil,   nil,    60,    60,    61,    66,    61,
   nil,   nil,    66,   nil,    66,    66,   nil,   nil,    61,    61,
    75,   nil,   nil,    66,    75,   nil,    75,    75,    34,   nil,
    34,    34,    66,    66,   nil,    75,   nil,   nil,   nil,    34,
    37,   nil,    37,    37,    75,    75,   nil,   nil,    34,    34,
   nil,    37,    38,   nil,    38,    38,    42,   nil,    42,    42,
    37,    37,   nil,    38,   nil,   nil,   nil,    42,    43,   nil,
    43,    43,    38,    38,   nil,   nil,    42,    42,   nil,    43,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,    43,    43 ]

racc_action_pointer = [
    -8,     2,    16,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,    -6,   -10,     0,    -8,
     1,     3,   nil,    -1,    64,     4,   nil,   nil,   nil,   nil,
   nil,   nil,    22,   nil,   404,   nil,    40,   416,   428,    -1,
    64,   nil,   432,   444,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,     8,   nil,    93,    14,   nil,    93,   347,   nil,
   361,   374,   170,   223,   nil,   122,   388,   276,   305,   nil,
   146,   nil,   nil,   nil,   nil,   400,   170,   199,   223,   252,
   nil,   276,   305,   nil,   334,   nil,   nil ]

racc_action_default = [
    -4,   -55,    -1,    -2,    -5,    -6,    -7,    -8,    -9,   -10,
   -11,   -12,   -13,   -14,   -15,   -16,   -55,   -55,   -55,   -38,
   -55,   -55,   -32,   -43,   -35,   -55,   -39,   -40,   -41,   -52,
   -53,   -54,   -55,    -3,   -55,   -20,    -4,   -55,   -55,   -55,
    -4,   -31,   -55,   -55,   -44,   -45,   -46,   -47,   -48,   -49,
   -50,   -51,   -55,    87,   -55,   -38,   -43,   -55,   -55,   -23,
   -39,   -38,   -27,   -33,   -37,   -55,   -55,   -34,   -42,   -36,
    -4,   -21,   -22,   -24,   -30,   -55,    -4,   -55,    -4,   -55,
   -17,    -4,   -55,   -29,   -55,   -28,   -18 ]

racc_goto_table = [
    33,    54,    58,     2,    62,    63,    73,     1,   nil,    67,
    68,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,    73,   nil,    62,   nil,   nil,   nil,   nil,
   nil,    75,   nil,    62,   nil,   nil,   nil,   nil,   nil,    57,
   nil,   nil,    62,    65,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,    33,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,    33,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,    77,   nil,    33,   nil,    33,   nil,    79,
    33,    82,    33,   nil,    84 ]

racc_goto_check = [
     3,    16,    18,     2,    16,    16,    19,     1,   nil,    16,
    16,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,    19,   nil,    16,   nil,   nil,   nil,   nil,
   nil,    18,   nil,    16,   nil,   nil,   nil,   nil,   nil,     2,
   nil,   nil,    16,     2,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,     3,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,     3,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,     2,   nil,     3,   nil,     3,   nil,     2,
     3,     2,     3,   nil,     2 ]

racc_goto_pointer = [
   nil,     7,     3,    -2,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   -33,   nil,   -35,   -52,
   nil,   nil ]

racc_goto_default = [
   nil,   nil,   nil,     3,     4,     5,     6,     7,     8,     9,
    10,    11,    12,    13,    14,    15,    24,   nil,   nil,    59,
    28,    43 ]

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
  1, 40, :_reduce_none,
  6, 50, :_reduce_17,
  8, 50, :_reduce_18,
  2, 54, :_reduce_none,
  2, 43, :_reduce_20,
  4, 42, :_reduce_21,
  4, 44, :_reduce_22,
  1, 55, :_reduce_23,
  2, 55, :_reduce_24,
  1, 56, :_reduce_25,
  1, 56, :_reduce_26,
  1, 56, :_reduce_27,
  7, 45, :_reduce_28,
  6, 45, :_reduce_29,
  4, 45, :_reduce_30,
  2, 46, :_reduce_31,
  1, 41, :_reduce_32,
  3, 47, :_reduce_33,
  3, 48, :_reduce_34,
  1, 51, :_reduce_none,
  3, 52, :_reduce_36,
  3, 53, :_reduce_37,
  1, 53, :_reduce_none,
  1, 53, :_reduce_39,
  1, 53, :_reduce_40,
  1, 53, :_reduce_none,
  3, 53, :_reduce_42,
  1, 53, :_reduce_43,
  1, 58, :_reduce_44,
  1, 58, :_reduce_45,
  1, 58, :_reduce_46,
  1, 58, :_reduce_47,
  1, 58, :_reduce_48,
  1, 58, :_reduce_49,
  1, 58, :_reduce_50,
  1, 58, :_reduce_51,
  1, 57, :_reduce_52,
  1, 57, :_reduce_53,
  1, 49, :_reduce_54 ]

racc_reduce_n = 55

racc_shift_n = 87

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

racc_use_result_var = false

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
  "constant_assignment_statement",
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

module_eval(<<'.,.,', 'parse.y', 17)
  def _reduce_3(val, _values)
     val
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

# reduce 16 omitted

module_eval(<<'.,.,', 'parse.y', 38)
  def _reduce_17(val, _values)
     Node.new(:if, val[2], val[4])
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 41)
  def _reduce_18(val, _values)
     Node.new(:if_else, val[2], [val[4], val[6]])
  end
.,.,

# reduce 19 omitted

module_eval(<<'.,.,', 'parse.y', 47)
  def _reduce_20(val, _values)
     Node.new(:require, val[1])
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 51)
  def _reduce_21(val, _values)
     Node.new(:module, val[1], val[2])
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 54)
  def _reduce_22(val, _values)
     Node.new(:func_call, val[0], val[2])
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 57)
  def _reduce_23(val, _values)
     Array(val[0])
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 58)
  def _reduce_24(val, _values)
     val
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 61)
  def _reduce_25(val, _values)
     Node.new(:string, val[0])
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 62)
  def _reduce_26(val, _values)
     Node.new(:variable, val[0])
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 63)
  def _reduce_27(val, _values)
     val[0]
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 69)
  def _reduce_28(val, _values)
     Node.new(:func_def, val[1], [val[3], val[5]])
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 72)
  def _reduce_29(val, _values)
     Node.new(:func_def, val[1], [nil, val[4]])
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 75)
  def _reduce_30(val, _values)
     Node.new(:func_def, val[1], [nil, val[2]])
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 79)
  def _reduce_31(val, _values)
     Node.new(:include, val[1])
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 81)
  def _reduce_32(val, _values)
     Node.new(:comment, val[0])
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 83)
  def _reduce_33(val, _values)
     Node.new(:assignment, val[0], [val[2]])
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 85)
  def _reduce_34(val, _values)
     Node.new(:constant_assignment, val[0], [val[2]])
  end
.,.,

# reduce 35 omitted

module_eval(<<'.,.,', 'parse.y', 92)
  def _reduce_36(val, _values)
     Node.new(:alias, val[1], val[2])
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 96)
  def _reduce_37(val, _values)
     val[0,3].join
  end
.,.,

# reduce 38 omitted

module_eval(<<'.,.,', 'parse.y', 98)
  def _reduce_39(val, _values)
     Node.new(:string, val[0])
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 99)
  def _reduce_40(val, _values)
     Node.new(:integer, val[0].to_i)
  end
.,.,

# reduce 41 omitted

module_eval(<<'.,.,', 'parse.y', 101)
  def _reduce_42(val, _values)
     Node.new(val[1], nil, [val[0], val[2]])
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 102)
  def _reduce_43(val, _values)
     Node.new(:constant, val[0])
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 106)
  def _reduce_44(val, _values)
     :plus
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 107)
  def _reduce_45(val, _values)
     :minus
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 108)
  def _reduce_46(val, _values)
     :multiply
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 109)
  def _reduce_47(val, _values)
     :divide
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 110)
  def _reduce_48(val, _values)
     :greater
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 111)
  def _reduce_49(val, _values)
     :less
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 112)
  def _reduce_50(val, _values)
     :equal
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 113)
  def _reduce_51(val, _values)
     :mod
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 117)
  def _reduce_52(val, _values)
     Node.new(:boolean, true)
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 118)
  def _reduce_53(val, _values)
     Node.new(:boolean, false)
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 121)
  def _reduce_54(val, _values)
     Node.new(:blank_line, "")
  end
.,.,

def _reduce_none(val, _values)
  val[0]
end

  end   # class Parser
end   # module Rgo

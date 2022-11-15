module LESSON-05-C
  syntax Boolean ::= "true" | "false"
  syntax Boolean ::= "not" Boolean [function]
  rule not true => false
  rule not false => true
endmodule
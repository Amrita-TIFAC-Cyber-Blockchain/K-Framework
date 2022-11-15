module LESSON-05-E-1
  rule not true => false
  rule not false => true
endmodule

module LESSON-05-E-2
  syntax Boolean ::= "true" | "false"
  syntax Boolean ::= "not" Boolean [function]
endmodule
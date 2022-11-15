module LESSON-11-C
  imports INT

  syntax Exp ::= Int | Exp "+" Exp [exp]
  syntax Exp2 ::= Exp | Exp2 "+" Exp2 [exp2]
endmodule
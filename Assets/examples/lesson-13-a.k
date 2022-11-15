module LESSON-13-A
  imports INT

  syntax Exp ::= Int
               | Bool
               | Exp "+" Exp
               | Exp "&&" Exp
endmodule
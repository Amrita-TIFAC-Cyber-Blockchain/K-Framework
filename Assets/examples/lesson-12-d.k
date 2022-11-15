module LESSON-12-D
  imports INT-SYNTAX

  syntax Ints ::= #NonEmptyInts | #IntsTerminator
  syntax #NonEmptyInts ::= Int "," #NonEmptyInts
                         | Int #IntsTerminator
  syntax #IntsTerminator ::= ""
endmodule
module LESSON-12-B-SYNTAX
  imports INT-SYNTAX

  syntax Ints ::= Int "," Ints | ".Ints"
endmodule

module LESSON-12-B
  imports LESSON-12-B-SYNTAX
endmodule
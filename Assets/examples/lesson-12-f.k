module LESSON-12-F
  syntax Id ::= r"[a-zA-Z_][a-zA-Z0-9_]*" [token]
  syntax Exp ::= Id

  syntax EnumSpecifier ::= "enum" Id "{" Ids "}"
  syntax Ids ::= List{Id,","}
endmodule
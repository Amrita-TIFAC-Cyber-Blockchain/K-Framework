module LESSON-18
  imports INT
  imports BOOL
  imports K-EQUAL

  syntax Exp ::= Int | Bool | "if" "(" Exp ")" Exp "else" Exp [strict(1)]

  syntax Bool ::= isKResult(K) [function, symbol]
  rule isKResult(_:Int) => true
  rule isKResult(_:Bool) => true

  rule if (B:Bool) E1:Exp else E2:Exp => #if B #then E1 #else E2 #fi
endmodule
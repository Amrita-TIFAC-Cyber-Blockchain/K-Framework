module LESSON-14-B-SYNTAX
  imports UNSIGNED-INT-SYNTAX
  imports BOOL-SYNTAX

  syntax Exp ::= Int
               | Bool
               > left: Exp "+" Exp
               > left: Exp "&&" Exp
endmodule

module LESSON-14-B
  imports LESSON-14-B-SYNTAX
  imports INT
  imports BOOL

  rule <k> I1:Int + I2:Int => I1 +Int I2 ...</k>
  rule <k> B1:Bool && B2:Bool => B1 andBool B2 ...</k>

  context <k> E:Exp + HOLE:Exp ...</k>
    requires isKResult(E)
  context <k> HOLE:Exp + _:Exp ...</k>
  context <k> E:Exp && HOLE:Exp ...</k>
    requires isKResult(E)
  context <k> HOLE:Exp && _:Exp ...</k>

  syntax Bool ::= isKResult(K) [function, symbol]
  rule isKResult(_:Int) => true
  rule isKResult(_:Bool) => true
  rule isKResult(_) => false [owise]
endmodule
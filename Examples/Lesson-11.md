# K-Framework

```
module LESSON-11-A
  imports INT

  syntax Exp ::= Int | Exp "+" Exp
  syntax Stmt ::= "if" "(" Exp ")" Stmt | "{" "}"
endmodule
```

```
module LESSON-11-B
  imports LESSON-11-A
  imports BOOL

  syntax Term ::= Exp | Stmt
  syntax Bool ::= isExpression(Term) [function]

  rule isExpression(_E:Exp) => true
  rule isExpression(_) => false [owise]
endmodule
```

```
module LESSON-11-C
  imports INT

  syntax Exp ::= Int | Exp "+" Exp [exp]
  syntax Exp2 ::= Exp | Exp2 "+" Exp2 [exp2]
endmodule
```

```
module LESSON-11-D
  imports INT
  imports BOOL

  syntax Exp ::= Int | Bool | Exp "+" Exp | Exp "&&" Exp

  syntax Exp ::= eval(Exp) [function]
  rule eval(I:Int) => I
  rule eval(B:Bool) => B
  rule eval(E1 + E2) => {eval(E1)}:>Int +Int {eval(E2)}:>Int
  rule eval(E1 && E2) => {eval(E1)}:>Bool andBool {eval(E2)}:>Bool
endmodule
```

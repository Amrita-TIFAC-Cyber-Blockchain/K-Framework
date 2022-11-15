# K-Framework

```
module LESSON-16-A-SYNTAX
  imports INT-SYNTAX
  imports ID-SYNTAX

  syntax Exp ::= Id | Int
  syntax Decl ::= "int" Id "=" Exp ";" [strict(2)]
  syntax Pgm ::= List{Decl,""}
endmodule

module LESSON-16-A
  imports LESSON-16-A-SYNTAX
  imports BOOL

  configuration <T>
                  <k> $PGM:Pgm </k>
                  <state> .Map </state>
                </T>

  // declaration sequence
  rule <k> D:Decl P:Pgm => D ~> P ...</k>
  rule <k> .Pgm => . ...</k>

  // variable declaration
  rule <k> int X:Id = I:Int ; => . ...</k>
       <state> STATE => STATE [ X <- I ] </state>

  // variable lookup
  rule <k> X:Id => I ...</k>
       <state>... X |-> I ...</state>

  syntax Bool ::= isKResult(K) [symbol, function]
  rule isKResult(_:Int) => true
  rule isKResult(_) => false [owise]
endmodule
```

```
module LESSON-16-B-SYNTAX
  imports INT-SYNTAX
  imports ID-SYNTAX

  syntax Exp ::= Id "(" ")" | Int
  syntax Stmt ::= "return" Exp ";" [strict]
  syntax Decl ::= "fun" Id "(" ")" "{" Stmt "}"
  syntax Pgm ::= List{Decl,""}
  syntax Id ::= "main" [token]
endmodule

module LESSON-16-B
  imports LESSON-16-B-SYNTAX
  imports BOOL
  imports LIST

  configuration <T>
                  <k> $PGM:Pgm ~> main () </k>
                  <functions> .Map </functions>
                  <fstack> .List </fstack>
                </T>

  // declaration sequence
  rule <k> D:Decl P:Pgm => D ~> P ...</k>
  rule <k> .Pgm => . ...</k>

  // function definitions
  rule <k> fun X:Id () { S } => . ...</k>
       <functions>... .Map => X |-> S ...</functions>

  // function call
  syntax KItem ::= stackFrame(K)
  rule <k> X:Id () ~> K => S </k>
       <functions>... X |-> S ...</functions>
       <fstack> .List => ListItem(stackFrame(K)) ...</fstack>

  // return statement
  rule <k> return I:Int ; ~> _ => I ~> K </k>
       <fstack> ListItem(stackFrame(K)) => .List ...</fstack>

  syntax Bool ::= isKResult(K) [function, symbol]
  rule isKResult(_:Int) => true
  rule isKResult(_) => false [owise]
endmodule
```

```
module LESSON-16-C-SYNTAX
  imports LESSON-16-A-SYNTAX
endmodule

module LESSON-16-C
  imports LESSON-16-C-SYNTAX
  imports BOOL
  imports SET

  configuration <T>
                  <k> $PGM:Pgm </k>
                  <state> .Map </state>
                  <declared> .Set </declared>
                </T>

  // declaration sequence
  rule <k> D:Decl P:Pgm => D ~> P ...</k>
  rule <k> .Pgm => . ...</k>

  // variable declaration
  rule <k> int X:Id = I:Int ; => . ...</k>
       <state> STATE => STATE [ X <- I ] </state>
       <declared> D => D SetItem(X) </declared>
    requires notBool X in D

  // variable lookup
  rule <k> X:Id => I ...</k>
       <state>... X |-> I ...</state>
       <declared>... SetItem(X) ...</declared>

  syntax Bool ::= isKResult(K) [symbol, function]
  rule isKResult(_:Int) => true
  rule isKResult(_) => false [owise]
endmodule
```

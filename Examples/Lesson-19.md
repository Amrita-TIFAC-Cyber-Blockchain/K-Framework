# K-Framework

```
module LESSON-19-A
  imports INT

  rule I => I +Int 1
    requires I <Int 100
endmodule
```

```
module LESSON-19-B
  imports BOOL

  syntax Bool ::= isBlue(Fruit) [function]
  syntax Fruit ::= Blueberry() | Banana()
  rule isBlue(Blueberry()) => true
  rule isBlue(Banana()) => false

  rule F:Fruit => isBlue(F)
endmodule
```

```
module LESSON-19-C
  imports INT
  imports BOOL

  syntax Bool ::= isEven(Int) [function]
  rule [isEven]: isEven(I) => true requires I %Int 2 ==Int 0
  rule [isOdd]: isEven(I) => false requires I %Int 2 =/=Int 0

endmodule
```

```
module LESSON-19-D

  syntax Foo ::= foo(Bar)
  syntax Bar ::= bar(Baz) | bar2(Baz)
  syntax Baz ::= baz() | baz2()

  rule [baz]: foo(bar(baz())) => .K

endmodule
```

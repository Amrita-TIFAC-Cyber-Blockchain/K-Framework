# K-Framework

```
module LESSON-06-A
  imports BOOL

  syntax Fruit ::= Blueberry() | Banana()
  syntax Bool ::= isBlue(Fruit) [function]

  rule isBlue(Blueberry()) => true
  rule isBlue(Banana()) => false
endmodule
```

```
module LESSON-06-B
  imports BOOL

  syntax Fruit ::= Blueberry() | Banana()
  syntax Bool ::= isBlue(Fruit) [function]

  rule isBlue(Blueberry()) => true
  rule isBlue(Banana()) => false

  syntax Bool ::= isYellow(Fruit) [function]
                | isBlueOrYellow(Fruit) [function]

  rule isYellow(Banana()) => true
  rule isYellow(Blueberry()) => false

  rule isBlueOrYellow(F) => isBlue(F) orBool isYellow(F)
endmodule
```

```
module LESSON-06-C-SYNTAX
  imports BOOL-SYNTAX

  syntax Bool ::= "(" Bool ")" [bracket]
                > "!" Bool [function]
                > left:
                  Bool "&&" Bool [function]
                | Bool "^" Bool [function]
                | Bool "||" Bool [function]
endmodule

module LESSON-06-C
  imports LESSON-06-C-SYNTAX
  imports BOOL

  rule ! B => notBool B
  rule A && B => A andBool B
  rule A ^ B => A xorBool B
  rule A || B => A orBool B
endmodule
```

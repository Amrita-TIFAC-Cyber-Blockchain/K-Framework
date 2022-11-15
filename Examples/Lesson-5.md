# K-Framework

```
module LESSON-05-A

endmodule
```

```
module LESSON-05-B [attr1, attr2, attr3(value)]

endmodule
```

```
module LESSON-05-C
  syntax Boolean ::= "true" | "false"
  syntax Boolean ::= "not" Boolean [function]
  rule not true => false
  rule not false => true
endmodule
```

```
module LESSON-05-D-1
  syntax Boolean ::= "true" | "false"
  syntax Boolean ::= "not" Boolean [function]
endmodule

module LESSON-05-D
  imports LESSON-05-D-1

  rule not true => false
  rule not false => true
endmodule
```

```
module LESSON-05-E-1
  rule not true => false
  rule not false => true
endmodule

module LESSON-05-E-2
  syntax Boolean ::= "true" | "false"
  syntax Boolean ::= "not" Boolean [function]
endmodule
```

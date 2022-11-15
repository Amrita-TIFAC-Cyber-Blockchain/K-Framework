# K-Framework

```
module LESSON-04-A

  syntax Boolean ::= "true" | "false"
                   | "(" Boolean ")" [bracket]
                   > "!" Boolean [function]
                   > Boolean "&&" Boolean [function]
                   > Boolean "^" Boolean [function]
                   > Boolean "||" Boolean [function]

endmodule
```

```
module LESSON-04-B

  syntax Boolean ::= "true" | "false"
                   | "(" Boolean ")" [bracket]
                   > "!" Boolean [function]
                   > left: Boolean "&&" Boolean [function]
                   > left: Boolean "^" Boolean [function]
                   > left: Boolean "||" Boolean [function]

endmodule
```

```
module LESSON-04-C

  syntax Boolean ::= "true" | "false"
                   | "(" Boolean ")" [bracket]
                   > "!" Boolean [function]
                   > left: 
                     Boolean "&&" Boolean [function]
                   | Boolean "^" Boolean [function]
                   | Boolean "||" Boolean [function]

endmodule
```

```
module LESSON-04-D

  syntax Boolean ::= "true" [literal] | "false" [literal]
                   | "(" Boolean ")" [atom, bracket]
                   | "!" Boolean [not, function]
                   | Boolean "&&" Boolean [and, function]
                   | Boolean "^" Boolean [xor, function]
                   | Boolean "|" Boolean [or, function]

  syntax priorities literal atom > not > and > xor > or
  syntax left and
  syntax left xor
  syntax left or
  
endmodule
```

```
module LESSON-04-E

  syntax Exp ::= "true" | "false"
  syntax Stmt ::= "if" "(" Exp ")" Stmt
                | "if" "(" Exp ")" Stmt "else" Stmt
                | "{" "}"
endmodule
```

```
module LESSON-04-F

  syntax Exp ::= "true" | "false"
  syntax Stmt ::= "if" "(" Exp ")" Stmt
                | "if" "(" Exp ")" Stmt "else" Stmt [avoid]
                | "{" "}"
endmodule
```


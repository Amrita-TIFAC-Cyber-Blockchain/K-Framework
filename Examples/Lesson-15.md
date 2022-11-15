# K-Framework

```
module LESSON-15-A-SYNTAX
  imports INT-SYNTAX

  syntax Ints ::= List{Int,","}
endmodule

module LESSON-15-A
  imports LESSON-15-A-SYNTAX
  imports INT

  configuration <k> $PGM:Ints </k>
                <sum> 0 </sum>

  rule <k> I:Int, Is:Ints => Is ...</k>
       <sum> SUM:Int => SUM +Int I </sum>
endmodule
```

```
module LESSON-15-B-SYNTAX
  imports INT-SYNTAX
endmodule

module LESSON-15-B
  imports LESSON-15-B-SYNTAX
  imports INT
  imports BOOL

  configuration <k> . </k>
                <first> $FIRST:Int </first>
                <second> $SECOND:Int </second>

  rule <k> . => FIRST >Int SECOND </k>
       <first> FIRST </first>
       <second> SECOND </second>
endmodule
```

```
module LESSON-15-C-SYNTAX
  imports INT-SYNTAX
endmodule

module LESSON-15-C
  imports LESSON-15-C-SYNTAX
  imports INT
  imports BOOL

  configuration <T>
                  <k> . </k>
                  <state>
                    <first> $FIRST:Int </first>
                    <second> $SECOND:Int </second>
                  </state>
                </T>

  rule <k> . => FIRST >Int SECOND </k>
       <first> FIRST </first>
       <second> SECOND </second>
endmodule
```

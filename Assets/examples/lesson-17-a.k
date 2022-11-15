module LESSON-17-A
  imports INT

  configuration <k> $PGM:K </k>
                <optional multiplicity="?"> 0 </optional>

  syntax KItem ::= "init" | "destroy"

  rule <k> init => . ...</k>
       (.Bag => <optional> 0 </optional>)
  rule <k> destroy => . ...</k>
       (<optional> _ </optional> => .Bag)

endmodule
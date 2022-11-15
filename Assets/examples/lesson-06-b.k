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
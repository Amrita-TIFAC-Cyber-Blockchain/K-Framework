# K-Framework

##

```
module LESSON-02-A

  syntax Color ::= Yellow() | Blue()
  syntax Fruit ::= Banana() | Blueberry()
  syntax Color ::= colorOf(Fruit) [function]

  rule colorOf(Banana()) => Yellow()
  rule colorOf(Blueberry()) => Blue()

endmodule
```

```
module LESSON-02-B

  syntax Color ::= Yellow()
  syntax Color ::= Blue()
  syntax Fruit ::= Banana()
  syntax Fruit ::= Blueberry()
  syntax Color ::= colorOf(Fruit) [function]

  rule colorOf(Banana()) => Yellow()
  rule colorOf(Blueberry()) => Blue()

endmodule
```

```
module LESSON-02-C

  syntax Color ::= Yellow()
                 | Blue()
                 | colorOf(Fruit) [function]
  syntax Fruit ::= Banana()
                 | Blueberry()

  rule colorOf(Banana()) => Yellow()
  rule colorOf(Blueberry()) => Blue()

endmodule
```

```
module LESSON-02-D

  syntax Container ::= Jar(Fruit)
  syntax Fruit ::= Apple() | Pear()

  syntax Fruit ::= contentsOfJar(Container) [function]

  rule contentsOfJar(Jar(F)) => F

endmodule
```

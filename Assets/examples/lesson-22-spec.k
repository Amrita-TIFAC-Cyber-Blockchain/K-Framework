requires "lesson-22.k"
requires "domains.md"

module LESSON-22-SPEC-SYNTAX
    imports LESSON-22-SYNTAX

endmodule

module VERIFICATION
    imports K-EQUAL
    imports LESSON-22-SPEC-SYNTAX
    imports LESSON-22
    imports MAP-SYMBOLIC

endmodule

module LESSON-22-SPEC
    imports VERIFICATION

endmodule
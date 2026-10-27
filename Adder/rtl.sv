module adder(
    input  logic [31:0] a,  // Operand A
    input  logic [31:0] b,  // Operand B
    output logic [31:0] y   // Sum output
);

    assign y = a + b;

endmodule
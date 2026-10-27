module mux2 #(parameter WIDTH = 8)(
    input  logic [WIDTH-1:0] d0,   // Input 0
    input  logic [WIDTH-1:0] d1,   // Input 1
    input  logic             s,    // Select line
    output logic [WIDTH-1:0] y     // Output
);

    assign y = s ? d1 : d0;

endmodule
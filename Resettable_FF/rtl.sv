module flopr #(parameter WIDTH = 8)(
    input  logic [WIDTH-1:0] d,     // Data input
    input  logic             clk,   // Clock
    input  logic             reset, // Asynchronous reset
    output logic [WIDTH-1:0] q      // Data output
);

    always_ff @(posedge clk or posedge reset) begin
        if (reset)
            q <= '0;
        else
            q <= d;
    end

endmodule
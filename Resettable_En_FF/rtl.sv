module flopenr #(parameter WIDTH = 8)(
    input  logic             clk,   // Clock
    input  logic             reset, // Asynchronous reset
    input  logic             en,    // Enable signal
    input  logic [WIDTH-1:0] d,     // Data input
    output logic [WIDTH-1:0] q      // Data output
);

    always_ff @(posedge clk or posedge reset) begin
        if (reset)
            q <= '0;
        else if (en)
            q <= d;
    end

endmodule
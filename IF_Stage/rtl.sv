module if_stage (
    input  logic        clk,
    input  logic        reset,
    input  logic        stall,
    input  logic        and_out,
    input  logic [31:0] pc_signed_offset,
    output logic [31:0] address,
    output logic [31:0] pc_new
);

    logic [31:0] pc;
    logic [31:0] next_pc;

    assign address = pc;
    assign pc_new = pc + 32'd4;
    assign next_pc = and_out ? pc_signed_offset : pc_new;

    always_ff @(posedge clk or posedge reset) begin
        if (reset)
            pc <= 32'h8000_0000;
        else if (!stall)
            pc <= next_pc;
    end

endmodule

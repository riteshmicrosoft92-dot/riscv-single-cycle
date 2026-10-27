module imem(
    input  logic [31:0] a,   // Address (byte address)
    output logic [31:0] rd   // Instruction
);

    logic [31:0] RAM [0:63]; // 64 words of 32 bits

    initial begin
        $readmemh("memfile.txt", RAM);
    end

    // Byte address -> word index: a[7:2] is a/4 for 64 words
    assign rd = RAM[a[7:2]];

endmodule
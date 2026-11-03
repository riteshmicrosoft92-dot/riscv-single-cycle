module decoder(
    input  logic [31:0] instruction,
    output logic [4:0]  rs1,
    output logic [4:0]  rs2,
    output logic [4:0]  rd,
    output logic [6:0]  opcode,
    output logic [6:0]  imm11_5,
    output logic [2:0]  fn3,
    output logic [11:0] imm,
    output logic [19:0] imm_uj,
    output logic        fn7_5
);

    always_comb begin
        rs1 = '0;
        rs2 = '0;
        rd = '0;
        opcode = instruction[6:0];
        imm11_5 = '0;
        fn3 = '0;
        imm = '0;
        imm_uj = '0;
        fn7_5 = 1'b0;

        case (instruction[6:0])
            7'b0110011: begin // R-type
                rs1 = instruction[19:15];
                rs2 = instruction[24:20];
                rd = instruction[11:7];
                fn3 = instruction[14:12];
                fn7_5 = instruction[30];
            end
            7'b0010011: begin // I-type ALU
                rs1 = instruction[19:15];
                rd = instruction[11:7];
                fn3 = instruction[14:12];
                imm = instruction[31:20];
                imm11_5 = instruction[31:25];
            end
            7'b0000011: begin // Load
                rs1 = instruction[19:15];
                rd = instruction[11:7];
                fn3 = instruction[14:12];
                imm = instruction[31:20];
            end
            7'b0100011: begin // Store
                rs1 = instruction[19:15];
                rs2 = instruction[24:20];
                fn3 = instruction[14:12];
                imm = {instruction[31:25], instruction[11:7]};
            end
            7'b1100011: begin // Branch
                rs1 = instruction[19:15];
                rs2 = instruction[24:20];
                fn3 = instruction[14:12];
                imm = {instruction[31], instruction[7], instruction[30:25], instruction[11:8]};
            end
            7'b1101111: begin // JAL
                rd = instruction[11:7];
                imm_uj = {instruction[31], instruction[19:12], instruction[20], instruction[30:21]};
            end
            7'b1100111: begin // JALR
                rs1 = instruction[19:15];
                rd = instruction[11:7];
                fn3 = instruction[14:12];
                imm = instruction[31:20];
            end
            7'b0110111, 7'b0010111: begin // LUI, AUIPC
                rd = instruction[11:7];
                imm_uj = instruction[31:12];
            end
            default: begin
                // Unsupported opcodes leave all decoded fields at zero.
            end
        endcase
    end

endmodule

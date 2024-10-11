/****************************************************************
 - Project        : RISC-V Design
 - File name      : main_decoder.v
 - Description    : main decoder in control unit
 - Owner          : Hyuntaek.Jung
 - Revision History : 1) 2024.10.07 : Initial release
****************************************************************/
module main_decoder(
    input [6:0] op,
    output ResultSrc, MemWrite, ALUSrc, RegWrite, branch,
    output [1:0] ALUOp, ImmSrc
    );

    // RegWrite is enabled for lw, R-type (ADD), and ADDI
    assign RegWrite = (op == 7'b0000011 | op == 7'b0110011) ? 1'b1 : 1'b0 ;

    // ImmSrc is set based on lw, sw, ADDI, and beq instructions
    assign ImmSrc = (op == 7'b0100011) ? 2'b01 : 
                    (op == 7'b1100011) ? 2'b10 :    
                                         2'b00 ;

    // MemWrite is enabled only for sw
    assign MemWrite = (op == 7'b0100011) ? 1'b1 : 1'b0;

    // ResultSrc is 1 for lw (data comes from memory), otherwise 0
    assign ResultSrc = (op == 7'b0000011) ? 1'b1 : 1'b0;

    // ALUSrc is 1 for lw, sw, and ADDI (immediate value used as ALU operand), 0 otherwise
    assign ALUSrc = (op == 7'b0000011 | op == 7'b0100011) ? 1'b1 : 1'b0 ;

    // Branch is enabled only for beq
    assign branch = (op == 7'b1100011) ? 1'b1 : 1'b0;

    // ALUop is set for R-type (ADD), ADDI, and beq instructions
    assign ALUOp = (op == 7'b0110011) ? 2'b10 :  // R-type (ADD)
                   (op == 7'b1100011) ? 2'b01 :  // beq
                                        2'b00 ;

endmodule

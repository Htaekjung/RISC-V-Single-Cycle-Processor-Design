/****************************************************************
 - Project        : RISC-V Design
 - File name      : Control_Unit.v
 - Description    : Control Unit with main_decoder & ALU_Decoder
 - Owner          : Hyuntaek.Jung
 - Revision History : 1) 2024.10.07 : Initial release
****************************************************************/
module Control_Unit(
    input [6:0] op,funct7,
    input [2:0] funct3,
    output ResultSrc, MemWrite, ALUSrc, RegWrite, branch,
    output [1:0] ImmSrc, 
    output [2:0] ALUControl
    );
    wire [1:0] ALUOp;

    main_decoder main_decoder(
        .op(op),
        .RegWrite(RegWrite),
        .ImmSrc(ImmSrc),
        .MemWrite(MemWrite),
        .ResultSrc(ResultSrc),
        .branch(branch),
        .ALUSrc(ALUSrc),
        .ALUOp(ALUOp)
    );
    ALU_Decoder ALU_Decoder(
        .ALUOp(ALUOp),
        .funct3(funct3),
        .funct7(funct7),
        .op(op),
        .ALUControl(ALUControl)
    );
endmodule
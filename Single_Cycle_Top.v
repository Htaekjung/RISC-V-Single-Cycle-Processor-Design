/****************************************************************
 - Project        : RISC-V Design
 - File name      : Single_Cycle_Top.v
 - Description    : Single_Cycle_Top module design
 - Owner          : Hyuntaek.Jung
 - Revision History : 1) 2024.10.07 : Initial release
****************************************************************/
module Single_Cycle_Top #(
    parameter N = 32
    )(
    input clk, rst
    );
    wire [31:0] PC_Top,RD_Instr,RD1_Top,Imm_Ext_Top,ALUResult,ReadData,PcPlus4,RD2_Top,SrcB,Result;
    wire RegWrite,MemWrite,ALUSrc,ResultSrc;
    wire [1:0]ImmSrc;
    wire [2:0]ALUControl_Top;

    Program_Counter PC_module(
        .clk(clk),
        .rst(rst),
        .PC(PC_Top),
        .PC_NEXT(PcPlus4)
    );

    PC_Adder PC_Adder(
        .a(PC_Top),
        .b(32'd4),
        .c(PcPlus4)
    );

    Instr_Mem Instr_Memory(
        .A(PC_Top),
        .rst(rst),
        .RD(RD_Instr)
    );


    Reg_file Reg_file(
        .clk(clk),
        .rst(rst),
        .WE3(RegWrite),
        .WD3(Result),
        .A1(RD_Instr[19:15]),//ADDI : rs1 //ADD : rs1 //SW : rs1
        .A2(RD_Instr[24:20]),//ADDI : imm //ADD : rs2 //SW : rs2
        .A3(RD_Instr[11:7]), //ADDI : rd  //ADD : rd  //SW : imm
        .RD1(RD1_Top),
        .RD2(RD2_Top)
    );
    Sign_Extend Sign_Extend(
        .in(RD_Instr),
        .out(Imm_Ext_Top),
        .ImmSrc(ImmSrc[0])
    );
    ALU_2 ALU(
        .A(RD1_Top),
        .B(SrcB),
        .ALUControl(ALUControl_Top),
        .V(), 
        .C(), 
        .N(), 
        .Z(), 
        .Result(ALUResult)
    );
    Data_Memory Data_Memory(
        .A(ALUResult),
        .WD(RD2_Top),
        .RD(ReadData),
        .WE(MemWrite),
        .clk(clk),
        .rst(rst)
    );
    mux Mux_Register_to_ALU(
        .A(RD2_Top),
        .B(Imm_Ext_Top),
        .O(SrcB),
        .sel(ALUSrc)
    );
    mux Mux_Result(
        .A(ALUResult),
        .B(ReadData),
        .O(Result),
        .sel(ResultSrc)
    );
    Control_Unit Control_Unit(
        .op(RD_Instr[6:0]),
        .funct7(RD_Instr[31:25]),
        .funct3(RD_Instr[14:12]),
        .ResultSrc(ResultSrc), 
        .MemWrite(MemWrite), 
        .ALUSrc(ALUSrc), 
        .RegWrite(RegWrite),
        .ImmSrc(ImmSrc),
        .ALUControl(ALUControl_Top),
        .branch()
    );
endmodule

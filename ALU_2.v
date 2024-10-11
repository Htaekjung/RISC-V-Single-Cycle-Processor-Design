/****************************************************************
 - Project        : RISC-V Design
 - File name      : ALU_2.v
 - Description    : Building ALU with flags
 - Owner          : Hyuntaek.Jung
 - Revision History : 1) 2024.10.07 : Initial release
****************************************************************/
module ALU_2#(
    parameter P = 32
    )(
        input [P-1:0] A,
        input [P-1:0] B,
        input [2:0] ALUControl,
        output V, C, N, Z, 
        output [P-1:0] Result
    );
        wire Cout;
        wire [P-1:0] sum;

        // 2's complement subtraction for ALUControl == 1
        assign {Cout, sum} = (ALUControl[0] == 1'b0) ? A + B : (A + (~B + 1'b1));
        
        // Result MUX for different ALU operations
        assign Result =  (ALUControl[2:0] == 3'b000) ? sum :        // ADD
                         (ALUControl[2:0] == 3'b001) ? sum :        // SUB
                         (ALUControl[2:0] == 3'b010) ? A & B :      // AND
                         (ALUControl[2:0] == 3'b011) ? A | B :      // OR
                         (ALUControl[2:0] == 3'b101) ? {{31{1'b0}}, sum[31]} : // SLT
                         {32{1'b0}};                                // Default case: 0

        // Overflow detection
        assign V = ~(ALUControl[0] ^ A[31] ^ B[31]) & sum[31] ^ A[31] & ~ALUControl[1];
        
        // Carry-out (Cout is valid only for ADD/SUB)
        assign C = (~ALUControl[1] & Cout);
        
        // Negative flag: MSB of Result
        assign N = Result[31];
        
        // Zero flag: If all bits of Result are 0
        assign Z = &(~Result);

endmodule

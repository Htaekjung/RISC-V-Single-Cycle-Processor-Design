/****************************************************************
 - Project        : RISC-V Design
 - File name      : ALU_2.v
 - Description    : Building ALU with flags
 - Owner          : Hyuntaek.Jung
 - Revision History : 1) 2024.10.07 : Initial release
****************************************************************/
module ALU_2#(
    parameter N=32;
    )(
        input [N-1:0] A,
        input [N-1:0] B,
        input [2:0] ALUControl,
        output V, C, N, Z, 
        output [N-1:0] Result
    );

        wire A_xnor_B;
        wire A_xor_Sum;
        wire not_ALUControl;
        wire Cout;

        wire [N-1:0] not_B;
        wire [N-1:0] sum;
        wire [N-1:0] A_and_B;
        wire [N-1:0] A_or_B;
        wire [N-1:0] mux_1;
        wire [N-1:0] mux_2;
	
	wire [N-1:0] Slt;


        assign A_and_B = A & B;
        assign A_or_B = A | B;
        assign not_B = ~B;
        assign mux_1 = (ALUControl [0] == 1'b0) ? B : not_B;
        //근데 이 때 mux_1이 ~B인 경우에는 음수이므로 덧셈을 할 때 2's complement를 사용함
        //A + (~B) = A - B + 1
	assign Slt = {31'b0000000000000000000000000000000, sum[31]};
        assign mux_2 =  (ALUControl[1:0] == 3'b000) ? sum : 
                        (ALUControl[1:0] == 3'b001) ? sum : 
                        (ALUControl[1:0] == 3'b010) ? A_and_B :
			(ALUControl[1:0] == 3'b011) ? A_or_B :
			(ALUControl[1:0] == 3'b101) ? Slt : ;
        assign A_xnor_B = ~(ALUControl[0] ^ A[31] ^ B[31]);
        assign A_xor_Sum = sum[31] ^ A[31];
        assign not_ALUControl = ~ALUControl[1];
        assign {Cout, sum} = A + mux_1 + ALUControl[0];
        assign V = A_xnor_B & A_xor_Sum & not_ALUControl;
        assign C = not_ALUControl & Cout;
        assign N = Result[31];            // if Negative N=1, else N=0
        assign Result = mux_2;
        assign Z = &(~Result);
        
    );
endmodule

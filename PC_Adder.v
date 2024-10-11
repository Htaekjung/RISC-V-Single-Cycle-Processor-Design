/****************************************************************
 - Project        : RISC-V Design
 - File name      : PC_Adder.v
 - Description    : PC adder design
 - Owner          : Hyuntaek.Jung
 - Revision History : 1) 2024.10.07 : Initial release
****************************************************************/
module PC_Adder #(
    parameter N = 32
    )(
    input [N-1:0] a,b,
    output [N-1:0] c
    );

    assign c = a + b;

endmodule
/****************************************************************
 - Project        : RISC-V Design
 - File name      : mux.v
 - Description    : mux design
 - Owner          : Hyuntaek.Jung
 - Revision History : 1) 2024.10.07 : Initial release
****************************************************************/
module mux #(
    parameter N = 32
)(
    input [N-1:0] A, B,
    input sel,        
    output [N-1:0] O 
);
    assign O = (~sel) ? A : B ;

endmodule
/****************************************************************
 - Project        : RISC-V Design
 - File name      : Sign_Extend.v
 - Description    : Sign bits extension
 - Owner          : Hyuntaek.Jung
 - Revision History : 1) 2024.10.07 : Initial release
****************************************************************/
module Sign_Extend #(
    parameter N=32
    )(
    input [N-1:0] in,
    input ImmSrc,
    output [N-1:0] out
    );
    assign out = (ImmSrc == 1'b1) ? ({{20{in[31]}},in[31:25],in[11:7]}):// S - type (immediate value 사용할 때 사용)
                                        {{20{in[31]}},in[31:20]} ;      // I - type (load 명령어 or immediate value 사용할 때 사용)
endmodule
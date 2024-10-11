/****************************************************************
 - Project        : RISC-V Design
 - File name      : Reg_file.v
 - Description    : register file design
 - Owner          : Hyuntaek.Jung
 - Revision History : 1) 2024.10.07 : Initial release
****************************************************************/
module Reg_file #(
    parameter N = 32
)(
    input clk, rst, WE3,
    input [4:0] A1, A2, A3,
    input [N-1:0] WD3,
    output [N-1:0] RD1, RD2
);
    reg [N-1:0] Registers [31:0];

    always @(posedge clk) begin
        if (WE3)
            Registers[A3] <= WD3; // Store WD3 into Registers[A3]
    end

    assign RD1 = (~rst) ? 32'd0 : Registers[A1];
    assign RD2 = (~rst) ? 32'd0 : Registers[A2];

    initial begin
        Registers[9] = 32'h00000020;
    end

endmodule

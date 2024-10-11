/****************************************************************
 - Project        : RISC-V Design
 - File name      : Data_Memory.v
 - Description    : Data memory design
 - Owner          : Hyuntaek.Jung
 - Revision History : 1) 2024.10.07 : Initial release
****************************************************************/
module Data_Memory #(
    parameter N = 32
    )(
    input clk, WE,rst,
    input [N-1:0] A,WD,
    output [N-1:0] RD
);
    reg [N-1:0] Data_MEM [1023:0];

    //read
    assign RD = (WE == 1'b0) ? Data_MEM[A] : 32'h00000000;

    //write
    always @(posedge clk) begin
        if (WE)
        begin 
            Data_MEM[A] <= WD;
        end
    end
     initial begin
        Data_MEM[28] = 32'h00000020;
        Data_MEM[40] = 32'h00000002;
    end
endmodule


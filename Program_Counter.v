/****************************************************************
 - Project        : RISC-V Design
 - File name      : Program_Counter.v
 - Description    : Program counter design
 - Owner          : Hyuntaek.Jung
 - Revision History : 1) 2024.10.07 : Initial release
****************************************************************/
module Program_Counter #(
    parameter N = 32
)(
    input [N-1:0] PC_NEXT,   
    input rst, 
    input clk,
    output reg [N-1:0] PC    
);
    always @(posedge clk) begin
        if (!rst) begin
            PC <= 32'b0;    
        end else begin
            PC <= PC_NEXT;  
        end
    end

endmodule

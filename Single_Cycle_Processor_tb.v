/****************************************************************
 - Project        : RISC-V Design
 - File name      : Single_Cycle_Top_Tb.v
 - Description    : Testbench
 - Owner          : Hyuntaek.Jung
 - Revision History : 1) 2024.10.07 : Initial release
****************************************************************/
`timescale 1ns/10ps
module Single_Cycle_Top_Tb();

  reg clk;
  reg rst;

  // DUT (Device Under Test) connections
  wire [31:0] PC_Top, RD_Instr, ALUResult, Result;
  wire [31:0] WriteData;
  wire [31:0] ReadData;
  wire MemWrite;

  // Instantiate the DUT
  Single_Cycle_Top DUT (
      .clk(clk),
      .rst(rst)
  );

  // Clock generation
  always #5 clk = ~clk;

  initial begin
    // Simulation log initialization
    $dumpfile("Single_Cycle_Top_Tb.vcd");
    $dumpvars(0, Single_Cycle_Top_Tb);

    // Initialize the clock and reset signals
    clk = 0;
    rst = 0;

    // Reset deactivation
    #10 rst = 1;


    // End simulation
    #1000 $finish;
  end

endmodule

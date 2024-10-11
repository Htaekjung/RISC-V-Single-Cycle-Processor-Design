onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /Single_Cycle_Top_Tb/DUT/PC_module/clk
add wave -noupdate /Single_Cycle_Top_Tb/DUT/PC_module/rst
add wave -noupdate /Single_Cycle_Top_Tb/DUT/PC_module/PC_NEXT
add wave -noupdate /Single_Cycle_Top_Tb/DUT/PC_module/PC
add wave -noupdate /Single_Cycle_Top_Tb/DUT/PC_Adder/a
add wave -noupdate /Single_Cycle_Top_Tb/DUT/PC_Adder/b
add wave -noupdate /Single_Cycle_Top_Tb/DUT/PC_Adder/c
add wave -noupdate /Single_Cycle_Top_Tb/DUT/Instr_Memory/A
add wave -noupdate /Single_Cycle_Top_Tb/DUT/Instr_Memory/RD
add wave -noupdate /Single_Cycle_Top_Tb/DUT/Reg_file/WE3
add wave -noupdate /Single_Cycle_Top_Tb/DUT/Reg_file/A1
add wave -noupdate /Single_Cycle_Top_Tb/DUT/Reg_file/A2
add wave -noupdate /Single_Cycle_Top_Tb/DUT/Reg_file/A3
add wave -noupdate /Single_Cycle_Top_Tb/DUT/Reg_file/WD3
add wave -noupdate /Single_Cycle_Top_Tb/DUT/Reg_file/RD1
add wave -noupdate /Single_Cycle_Top_Tb/DUT/Reg_file/RD2
add wave -noupdate /Single_Cycle_Top_Tb/DUT/Sign_Extend/in
add wave -noupdate /Single_Cycle_Top_Tb/DUT/Sign_Extend/ImmSrc
add wave -noupdate /Single_Cycle_Top_Tb/DUT/Sign_Extend/out
add wave -noupdate /Single_Cycle_Top_Tb/DUT/ALU/A
add wave -noupdate /Single_Cycle_Top_Tb/DUT/ALU/B
add wave -noupdate /Single_Cycle_Top_Tb/DUT/ALU/Result
add wave -noupdate /Single_Cycle_Top_Tb/DUT/ALU/sum
add wave -noupdate /Single_Cycle_Top_Tb/DUT/Data_Memory/WE
add wave -noupdate /Single_Cycle_Top_Tb/DUT/Data_Memory/A
add wave -noupdate /Single_Cycle_Top_Tb/DUT/Data_Memory/WD
add wave -noupdate /Single_Cycle_Top_Tb/DUT/Data_Memory/RD
add wave -noupdate /Single_Cycle_Top_Tb/DUT/Mux_Register_to_ALU/A
add wave -noupdate /Single_Cycle_Top_Tb/DUT/Mux_Register_to_ALU/B
add wave -noupdate /Single_Cycle_Top_Tb/DUT/Mux_Register_to_ALU/sel
add wave -noupdate /Single_Cycle_Top_Tb/DUT/Mux_Register_to_ALU/O
add wave -noupdate /Single_Cycle_Top_Tb/DUT/Mux_Result/A
add wave -noupdate /Single_Cycle_Top_Tb/DUT/Mux_Result/B
add wave -noupdate /Single_Cycle_Top_Tb/DUT/Mux_Result/sel
add wave -noupdate /Single_Cycle_Top_Tb/DUT/Mux_Result/O
add wave -noupdate /Single_Cycle_Top_Tb/DUT/Control_Unit/op
add wave -noupdate /Single_Cycle_Top_Tb/DUT/Control_Unit/funct7
add wave -noupdate /Single_Cycle_Top_Tb/DUT/Control_Unit/funct3
add wave -noupdate /Single_Cycle_Top_Tb/DUT/Control_Unit/ResultSrc
add wave -noupdate /Single_Cycle_Top_Tb/DUT/Control_Unit/MemWrite
add wave -noupdate /Single_Cycle_Top_Tb/DUT/Control_Unit/ALUSrc
add wave -noupdate /Single_Cycle_Top_Tb/DUT/Control_Unit/RegWrite
add wave -noupdate /Single_Cycle_Top_Tb/DUT/Control_Unit/branch
add wave -noupdate /Single_Cycle_Top_Tb/DUT/Control_Unit/ImmSrc
add wave -noupdate /Single_Cycle_Top_Tb/DUT/Control_Unit/ALUControl
add wave -noupdate /Single_Cycle_Top_Tb/DUT/Control_Unit/ALUOp
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {18630 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 370
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {72890 ps}

/****************************************************************
 - Project        : RISC-V Design
 - File name      : Instr_Mem.v
 - Description    : Instruction memory
 - Owner          : Hyuntaek.Jung
 - Revision History : 1) 2024.10.07 : Initial release
****************************************************************/
module Instr_Mem #(
    parameter N = 32
)(
    input [N-1:0] A,
    input rst,
    output [N-1:0] RD
);

    // 메모리 생성
    reg [N-1:0] Mem [1023:0]; // 32비트 데이터를 저장할 수 있는 1024개의 레지스터 배열 정의

    // RISC-V 명령어 주소의 경우 항상 하위 2비트는 00이므로 상위 30비트만 있어도 됨
    assign RD = (rst) ? Mem[A[31:2]] : {32{1'b0}};
    initial begin
        // I-type 명령어
        Mem[0] = 32'hFFC4A303; // lw x6, -4(x9)  (I-type) PC=0
        Mem[1] = 32'h00832383; // lw x7, 8(x6)   (I-type) PC=4
    end


endmodule

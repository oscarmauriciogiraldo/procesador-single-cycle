module SEU(
    input [25:0] Inst,
    input [1:0] SEUScr,
    output reg signed [63:0] SEU_out
    );

always @(*)begin
    case (SEUScr)
        0: SEU_out = {{52{Inst[21]}},Inst[21:10]};
        1: SEU_out = {{45{Inst[21]}},Inst[11:10],{7{Inst[21]}},Inst[20:12]};
        2: SEU_out = {{38{Inst[21]}},Inst[25:0]};
        3: SEU_out = {{46{Inst[21]}},Inst[22:5]};
    endcase
end

endmodule
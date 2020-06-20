module Mux_Reg2Sel(
    input [4:0] Rm,
    input [4:0] Rt,
    input Reg2Sel,
    output reg [4:0] out_Mux_Reg2Sel

    );

always @(*)begin
    case (Reg2Sel)
        0: out_Mux_Reg2Sel = Rm;
        1: out_Mux_Reg2Sel = Rt;
    endcase
end

endmodule
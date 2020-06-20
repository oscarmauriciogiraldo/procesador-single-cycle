module Mux_RegWrSrc(
    input [4:0] Rt,
    input RegWrSrc,
    output reg [4:0] out_Mux_RegWrSrc

    );

always @(*)begin
    case (RegWrSrc)
        0: out_Mux_RegWrSrc <= Rt;
        1: out_Mux_RegWrSrc <= 30;
    endcase
end

endmodule
module Mux_PCSrc(    
    input [63:0] Sum1,
    input [63:0] sum2,
    input [63:0] RdReg2,
    input [1:0] PCSrc,
    output reg signed [63:0] out_Mux_PCSrc

    );

always @(*)begin
    case (PCSrc)
        0: out_Mux_PCSrc <= Sum1;
        1: out_Mux_PCSrc <= sum2;
        2: out_Mux_PCSrc <= RdReg2;
    endcase
end

endmodule
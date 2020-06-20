module Mux_RFDataWrSrc(
    input [63:0] Data_memory,
    input [63:0] Alu,
    input [63:0] Sum1,
    input [1:0] RFDataSel,
    output reg signed [63:0] out_Mux_RFDataSel

    );

always @(*)begin
    case (RFDataSel)
        0: out_Mux_RFDataSel = Data_memory;
        1: out_Mux_RFDataSel = Alu;
        2: out_Mux_RFDataSel = Sum1;
    endcase
end

endmodule
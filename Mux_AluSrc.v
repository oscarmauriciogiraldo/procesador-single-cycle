module Mux_AluSrc(
    input [63:0] Register_file,
    input [63:0] SEU,
    input AluSrc,
    output reg [63:0] out_Mux_AluSrc

    );

always @(*)begin
    case (AluSrc)
        0: out_Mux_AluSrc = Register_file;
        1: out_Mux_AluSrc = SEU;
    endcase
end

endmodule
module Sum2(
    input [63:0] PC,
    input [63:0] SEU,
    output [63:0] out_Sum2

    );

 assign out_Sum2 = PC + (SEU<<2);


endmodule
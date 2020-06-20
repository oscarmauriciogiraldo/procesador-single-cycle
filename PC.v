module PC(
    input [63:0] in_pc,
    input clk,
    output reg [63:0] out_pc=0
    
    );

 always @(posedge clk)
        out_pc<=in_pc;
endmodule
module Register_file(
    input [4:0] Rn,
    input [4:0] Rm,
    input [4:0] WrReg,
    input signed [63:0] WrData,
    input RfWr,
    input clk,
    output reg signed[63:0] RdReg1,
    output reg signed[63:0] RdReg2
    );
    
    reg signed [63:0] registros [31:0];
// ESCRITURA
    always @(posedge clk)begin
        if(RfWr==1 && (WrReg != 31))
            registros[WrReg] <= WrData;
        if(registros[28]<0)
            registros[28]=0;
    
    end
    // LECTURA
    
    initial begin
        assign RdReg1 = registros[Rn];
        assign RdReg2 = registros[Rm];
        registros[31] = 0;
    end

endmodule
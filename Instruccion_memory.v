module Instruccion_memory(
    input [63:0] Address,
    output [31:0] Instruccion 
    );
    localparam SIZE = 20000;
    localparam Archivo = "inicial.mem";
    reg [7:0] registro [SIZE-1:0]; 

    initial begin
        $display("Loading rom.");
        $readmemh(Archivo,registro);
    end
    
/*initial begin
    registro[0] = 8'h1; 
    registro[1] = 8'h2;
    registro[2] = 8'h3;
    registro[3] = 8'h4;
    registro[4] = 8'h5; 
    registro[5] = 8'h6;
    registro[6] = 8'h7;
    registro[7] = 8'h8;
    registro[8] = 8'h9; 
    registro[9] = 8'hA;
    registro[10] = 8'hB;
    registro[11] = 8'hC;
    registro[12] = 8'hD; 
    registro[13] = 8'hE;
    registro[14] = 8'hF;
    registro[15] = 8'h0;
   end*/

assign Instruccion = (Address<SIZE)?({{registro[Address],registro[Address+1]},{registro[Address+2],registro[Address+3]}}):0;

endmodule
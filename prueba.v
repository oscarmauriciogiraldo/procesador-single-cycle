
module prueba_precesador();
reg clk;
reg [7:0] sch;
wire [7:0] led;

procesador2 P1( 
    .clk(clk),
    .sch(sch),
    .led(led)
    );

initial begin
clk=0;
#15
sch=2;
#20
sch=3;
end

always #10  clk=~clk;
endmodule
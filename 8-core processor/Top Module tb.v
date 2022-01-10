module Top_module_tb;
	reg clk;
	wire DR;
	parameter clk_period = 10;

     Top_module top_mod_1();
    initial begin
       clk = 0;
    end
     
     always 
       #(clk_period/2) clk = ~clk;


endmodule


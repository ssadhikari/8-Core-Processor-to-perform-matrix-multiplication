module Address_register_tb;
	
	reg clk,write,rst;
	reg [15:0] data_in;

	wire [15:0] data_out;

	parameter clk_period = 10;
	
	Address_register gpr1 (clk,write,rst,data_in,data_out); //to call the register ,piliwelta data pass karanna ona
	//create clock
	initial begin
		clk = 0;
	end
	always
		#(clk_period /2 )
		clk = ~clk;
	//parameter passing
	initial
		begin
			rst=0;write = 0; data_in = 16'd0;//sizeof data,base,value
			#clk_period
			data_in = 16'b0011001100110011;write=1;
			#clk_period
			data_in = 16'b0011001100110011;write=0;
			#clk_period

			rst = 1;
		end
endmodule
			

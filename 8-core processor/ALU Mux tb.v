
module ALU_mux_tb;
	
	reg clk,rst;
	reg [1:0] select;
	reg enable;
	reg [15:0] data_in;

	wire [15:0] data_out;

	parameter clk_period = 10;
	
	ALU_mux gpr1 (clk,rst,select,enable,data_in,data_out); //to call the register ,piliwelta data pass karanna ona
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
			rst=0;enable = 1 ;select =2'b00; data_in = 16'd0;//sizeof data,base,value
			#(clk_period*3)
			rst=0;select =2'b00;enable = 1 ; data_in = 16'd0;//sizeof data,base,value
			#(clk_period*2)
			rst=1;select =2'b00;enable = 1 ; data_in = 16'd0;//sizeof data,base,value
			#(clk_period*2)
			rst=0;enable=1;data_in = 16'b0011001100110011;select =2'b00;
			#clk_period
			rst=0;enable=1;data_in = 16'b0011001100110011;select =2'b01;
			#clk_period
			rst=0;enable=1;data_in = 16'b0011001100110011;select =2'b10;
			#clk_period
			rst=0;enable=1;data_in = 16'b0011001100110011;select =2'b11;
			#(clk_period*2)
			rst=0;enable=0;data_in = 16'b0011001100110011;select =2'b00;


			rst = 1;
		end
endmodule
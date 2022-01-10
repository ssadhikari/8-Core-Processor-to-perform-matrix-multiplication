module Main_mux_tb;
	
	reg clk,rst;
	reg [3:0] select;
	reg enable;
	 reg [15:0] dr_out,r1_out,r2_out,r3_out,r4_out,r5_out,r6_out,r7_out,r8_out,r9_out,ALU_out;

	wire [15:0] data_out;

	parameter clk_period = 10;
	
	Main_mux gpr1 (clk,rst,select,enable,dr_out,r1_out,r2_out,r3_out,r4_out,r5_out,r6_out,r7_out,r8_out,r9_out,ALU_out,data_out); //to call the register ,piliwelta data pass karanna ona
	//create clock
	initial begin
		clk = 0;
		dr_out <= 0;
		r1_out <= 0;
		r2_out <= 0;
		r3_out <= 0;
		r4_out <= 0;
		r5_out <= 0;
		r6_out <= 0;
		r7_out <= 0;
		r8_out <= 0;
		r9_out <= 0;
		ALU_out <= 0;
	end
	always
		#(clk_period /2 )
		clk = ~clk;
	//parameter passing
	initial
		begin
			rst=0;enable = 1 ;select =4'd0; ALU_out = 16'd250;//sizeof data,base,value
			#(clk_period*2)
			rst=1;enable = 1 ;select =4'd0; ALU_out = 16'd251;//sizeof data,base,value
			#(clk_period*2)
			rst=0;enable = 1 ;select =4'd1; ALU_out = 16'd300;//sizeof data,base,value
			#(clk_period*2)
			rst=0;enable = 1 ;select =4'd2; dr_out = 16'd310;//sizeof data,base,value
			#(clk_period*2)
			rst=0;enable = 1 ;select =4'd3; r1_out = 16'd311;//sizeof data,base,value
			#(clk_period*2)
			rst=0;enable = 1 ;select =4'd4; r2_out = 16'd312;//sizeof data,base,value			#clk_period
			#(clk_period*2)
			rst=0;enable = 1 ;select =4'd5; r3_out = 16'd313;//sizeof data,base,value
			#(clk_period*2)
			rst=0;enable = 1 ;select =4'd6; r4_out = 16'd314;//sizeof data,base,value
			#(clk_period*2)
			rst=0;enable = 1 ;select =4'd7; r5_out = 16'd315;//sizeof data,base,value
			#(clk_period*2)
			rst=0;enable = 1 ;select =4'd8; r6_out = 16'd316;//sizeof data,base,value
			#(clk_period*2)
			rst=0;enable = 1 ;select =4'd9; r7_out = 16'd317;//sizeof data,base,value
			#(clk_period*2)
			rst=0;enable = 1 ;select =4'd10; r8_out = 16'd318;//sizeof data,base,value
			#(clk_period*2)
			rst=0;enable = 1 ;select =4'd11; r9_out = 16'd319;//sizeof data,base,value
			#(clk_period*2)
			rst=1;enable = 1 ;select =4'd5; r3_out = 16'd313;//sizeof data,base,value


			
		end
endmodule


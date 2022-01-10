module Instruction_memory(clk,rst,read,address,data_out);
	input clk,rst,read; 
	input [15:0] address; 
	output reg [15:0] data_out; 
	reg [15:0] word[255:0];
	initial 
		begin
			word[0]={8'd0,8'd4};                                //CLAC
			word[1]={8'd3,8'd11};                               //MVAC-R3
			word[2]={8'd4,8'd11};                               //MVAC-R4
			word[3]={8'd5,8'd11};                               //MVAC-R5
			word[4]={8'd2,8'd11};                               //MVAC-R2
			word[5]={8'd6,8'd5};                                //LOAD-R6
			word[6]={8'd0,8'd1};                                //r1 -----> according to data memory
			word[7]={8'd7,8'd5};                                //LOAD-R7
			word[8]={8'd0,8'd2};                                //c1------->according to data memory
			word[9]={8'd8,8'd5};                                //LOAD-R8
			word[10]={8'd0,8'd4};                               //c2  -----> according to data memory
			word[11]={8'd6,8'd12};                              //COPY-R6
			word[12]={8'd8,8'd27};                              //MUL-R8
			word[13]={8'd9,8'd11};                              //MVAC-R9
			word[14]={8'd7,8'd12};                              //COPY-R7
			word[15]={8'd6,8'd27};                              //MUL-R6
			word[16]={8'd1,8'd11};                              //MVAC-R1
			word[17]={8'd11,8'd5};                              //LOAD-AC
			word[18]={8'd0,8'd3};                               //r2  -----> according to data memory
			word[19]={8'd8,8'd27};                              //MUL-R8
			word[20]={8'd1,8'd23};                              //ADD-R1
			word[21]={8'd3,8'd9};                               //INDAC-4
			word[22]={8'd1,8'd11};                              //MVAC-R1
//			word[23]={8'd2,8'd12};                              //COPY-R2 --------->loop
//			word[24]={8'd2,8'd9};                               //INDAC-1
//			word[25]={8'd2,8'd11};                              //MVAC-R2
//			word[26]={8'd0,8'd4};                               //CLAC
//			word[27]={8'd1,8'd12};                              //COPY-R1
//			word[28]={8'd2,8'd23};                              //ADD-R2
//			word[29]={8'd3,8'd11};                              //MVAC-R3
//			word[30]={8'd0,8'd4};                               //CLAC 
//			word[31]={8'd3,8'd13};                              //STOR-R9
//			word[32]={8'd9,8'd12};                              //COPY-R9
//			word[33]={8'd2,8'd25};                              //SUB-R2
//			word[34]={8'd0,8'd16};                              //JPNZ
//			word[35]={8'd0,8'd23};                              //---------Go to loop ---------

			word[23]={8'd11,8'd12};                             //COPY-ID
			word[24]={8'd3,8'd11};                              //MVAC-R3
			
			word[25]={8'd0,8'd4};                               //CLAC ----------- loop-1--------
			word[26]={8'd2,8'd9};                               //INDAC-1
			word[27]={8'd4,8'd11};                              //MVAC-R4


			word[28]={8'd0,8'd4};                               //CLAC ------------ loop-2 ---------
			word[29]={8'd9,8'd11};                              //MVAC-R9
			word[30]={8'd0,8'd4};                               //CLAC	
			word[31]={8'd2,8'd9};                               //INDAC-1
			word[32]={8'd5,8'd11};                              //MVAC-R5

			word[33]={8'd5,8'd12};                              //COPY-R5 ------------ loop-3 ----------
			word[34]={8'd1,8'd9};                               //INDAC-(-1)
			word[35]={8'd8,8'd27};                              //MUL-R8
			word[36]={8'd3,8'd9};                               //INDAC-4
			word[37]={8'd4,8'd23};                              //ADD-R4
			word[38]={8'd2,8'd11};                              //MVAC-R2
			word[39]={8'd6,8'd12};                              //COPY-R6
			word[40]={8'd7,8'd27};                              //MUL-R7
			word[41]={8'd2,8'd23};                              //ADD-R2
			word[42]={8'd2,8'd11};                              //MVAC-R2
			word[43]={8'd2,8'd20};                              //LODM-R2
			word[44]={8'd2,8'd11};                              //MVAC-R2
			word[45]={8'd3,8'd12};                              //COPY-R3
			word[46]={8'd1,8'd9};                               //INDAC-(-1)
			word[47]={8'd7,8'd27};                              //MUL-R7
			word[48]={8'd3,8'd9};                               //INDAC-4
			word[49]={8'd5,8'd23};                              //ADD-R5
			word[50]={8'd10,8'd11};                             //MVAC-R10  ....
			word[51]={8'd10,8'd20};                             //LODM-R10 ....
			word[52]={8'd2,8'd27};                              //MUL-R2
			word[53]={8'd9,8'd23};                              //ADD-R9
			word[54]={8'd9,8'd11};                              //MVAC-R9
			word[55]={8'd5,8'd12};                              //COPY-R5 
			word[56]={8'd2,8'd9};                               //INDAC-1
			word[57]={8'd5,8'd11};                              //MVAC-R5
			word[58]={8'd7,8'd12};                              //COPY-R7
			word[59]={8'd5,8'd25};                              //SUB-R5
			word[60]={8'd0,8'd16};                              //JPNZ

			word[61]={8'd0,8'd33};                              //------------- Go to loop-3 ------------
			word[62]={8'd1,8'd12};                              //COPY-R1
			word[63]={8'd4,8'd23};                              //ADD-R4
			word[64]={8'd2,8'd11};                              //MVAC-R2
			word[65]={8'd3,8'd12};                              //COPY-R3
			word[66]={8'd1,8'd9};                               //INDAC-(-1)
			word[67]={8'd8,8'd27};                              //MUL-R8
			word[68]={8'd2,8'd23};                              //ADD-R2
			word[69]={8'd2,8'd11};                              //MVAC-R2
			word[70]={8'd9,8'd12};                              //COPY-R9
			word[71]={8'd2,8'd13};                              //STOR-R2

			word[72]={8'd4,8'd12};                              //COPY-R4 
			word[73]={8'd2,8'd9};                               //INDAC-1
			word[74]={8'd4,8'd11};                              //MVAC-R4

			word[75]={8'd8,8'd12};                              //COPY-R8
			word[76]={8'd4,8'd25};                              //SUB-R4
			word[77]={8'd0,8'd16};                              //JPNZ 


			word[78]={8'd0,8'd28};                              // ------------ Go to loop-2 ------------
			word[79]={8'd3,8'd12};                              //COPY-R3
			word[80]={8'd4,8'd9};                               //INDAC-8
			word[81]={8'd3,8'd11};                              //MVAC-R3
			word[82]={8'd6,8'd12};                              //COPY-R6
			word[83]={8'd3,8'd25};                              //SUB-R3

			word[84]={8'd0,8'd16};                              //JPNZ

			word[85]={8'd0,8'd25};                              // ------------ Go to loop-1 ------------
			word[86]={8'd0,8'd30};                              // END
		end
		always@(posedge clk or posedge rst)  
			begin
				if (rst) data_out <= 0;
				else if(read) data_out<=word[address];
			end
endmodule
		









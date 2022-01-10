module Main_mux
	(input clk,rst,
	 input [3:0] select,
	 input enable,
	 input [15:0] dr_out,r1_out,r2_out,r3_out,r4_out,r5_out,r6_out,r7_out,r8_out,r9_out,r10_out,id_out,ALU_out,dm_out,im_out,

	 output reg [15:0] data_out);

	always @ (posedge enable or select or posedge rst)
		begin
			if ( rst ) data_out <= 0;
			else if ( enable== 1)
				begin
					case (select)

						4'd1 : data_out <= ALU_out;
						4'd2 : data_out <= dr_out;
						4'd3 : data_out <= r1_out;
						4'd4 : data_out <= r2_out;
						4'd5 : data_out <= r3_out;
						4'd6 : data_out <= r4_out;
						4'd7 : data_out <= r5_out;
						4'd8 : data_out <= r6_out;
						4'd9 : data_out <= r7_out;
						4'd10 : data_out <= r8_out;
						4'd11 : data_out <= r9_out;
						4'd12 : data_out <= r10_out;
						4'd13 : data_out <= dm_out;
						4'd14 : data_out <= im_out;
						4'd15 : data_out <= id_out;
						default : data_out <= ALU_out;
						

					endcase 
				end
			//else data_out <= 0; 
		end
endmodule



module ALU_mux
	(input clk,rst,
	 input [2:0] select,
	 input enable,
	 input [15:0] data_in,
	 output reg [15:0] data_out);

	always @ (posedge enable or data_in or select or posedge rst)
		begin
			if ( rst ) data_out <= 0;
			else if ( enable== 1)
				begin
					case (select)
						3'd0 : data_out <= data_in;
						3'd1 : data_out <= -16'd1;
						3'd2 : data_out <= 16'd1;
						3'd3 : data_out <= 16'd4;
						3'd4 : data_out <= 16'd8;
						default : data_out <= data_in;
					endcase
					 
				end 
			
		end
endmodule

	
module Program_counter
        (input clk,write,rst,inc,
        input [15:0] data_in,
        output reg[15:0] data_out);

	always @(posedge clk or posedge rst)
           begin
                 if ( rst ) data_out <= 0;
                 else if ( write ) data_out <= data_in;
                 else if ( inc ) data_out <= data_out + 16'd1;   

           end

endmodule
           

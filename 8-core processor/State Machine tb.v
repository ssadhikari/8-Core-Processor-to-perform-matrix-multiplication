module State_machine_tb;
     reg clk,z;
     reg [15:0] ir;

     
     wire acw,clac,r1w,r2w,r3w,r4w,r5w,r6w,r7w,r8w,r9w,r10,irw,pcw,pc_inc,drw,arw,imr,dmw,dmr,mux_alu,mux_cont,finish;
     wire [1:0] alu_op,mux_alu_op;
     wire [3:0] mux_op;

     parameter clk_period = 10;

     State_machine sm_1(clk,z,ir,acw,clac,r1w,r2w,r3w,r4w,r5w,r6w,r7w,r8w,r9w,r10w,irw,pcw,pc_inc,drw,arw,imr,dmw,dmr,mux_alu,mux_cont,finish,alu_op,mux_alu_op,mux_op);
    initial begin
       clk = 0;
	z=0;
	//check=0;
    end
     
     always 
       #(clk_period/2) clk = ~clk;


     initial
         begin
            ir = {8'd0,8'd4};  // 00000000+00000100   00000100 ---> instruction ----> ir[7:0]
            #(clk_period*7)
            
            #(clk_period*2)

            ir = {8'd5,8'd5};     //LOAD
            #(clk_period*7)

           ir = {8'd2,8'd9};     //INAC
            #(clk_period*5)

           ir = {8'd7,8'd11};    //MVAC
            #(clk_period*4)

           ir = {8'd3,8'd12};     //COPY
            #(clk_period*4)

           ir = {8'd9,8'd13};      //STOR
            #(clk_period*6)

           ir = {8'd1,8'd16};  z=1;      //JPNZY
            #(clk_period*5)

           ir = {8'd2,8'd16}; z=0;     //JPNZN
            #(clk_period*4)

           ir = {8'd2,8'd20};     //LODM
            #(clk_period*6)

           ir = {8'd4,8'd23};     //ADD
            #(clk_period*5)

           ir = {8'd9,8'd25};     //SUB
            #(clk_period*5)

           ir = {8'd5,8'd27};     //MUL
            #(clk_period*5)

           ir = {8'd8,8'd29};     //NOP
            #(clk_period*4)

           ir = {8'd3,8'd30};     //END
         


        end 
endmodule
     
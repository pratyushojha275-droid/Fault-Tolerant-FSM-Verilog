`timescale 1ns / 1ps

module fsm_top_tb;

reg clk;
reg x;

wire [1:0] y;
wire [7:0] count;
wire [4:0] actual_state;

fsm_top uut (
    .clk(clk),
    .x(x),
    .y(y),
    .count(count),
    .actual_state(actual_state)
);

initial begin
    clk = 0;
end

always #5 clk = ~clk;   

initial begin
        x = 0; 
        #10;
        x = 1;  #10;  
        x = 1;  #10;  
        x = 1;  #10;  
        x = 1;  #10;  
        x = 0;  #20;  
        x = 1;  #10;  
        x = 0;  #10;  
        x = 1;  #10;  
        x = 0;  #10;  
        x = 1;  #10; 
                #20;
        uut.u1.state = 5'b10111;
        x=1;
    

                #20;

    $finish;

end

endmodule
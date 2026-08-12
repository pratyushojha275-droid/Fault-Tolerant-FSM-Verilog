`timescale 1ns / 1ps

module fsm_top(input clk, input x,output [1:0]y, [7:0]count,
[4:0]actual_state
    );
    
    wire [4:0]t1;
    wire [4:0]t2;
    wire [4:0]t3;
    wire [4:0]t4;
    wire [4:0]t5;
    wire vs;
    wire [2:0]h1;
    wire [2:0]h2;
    wire [2:0]h3;
    wire [2:0]h4;
    
    fsm_core u1(.x(x),.y(y),.clk(clk),.state(t1));
    
    error_insertion u2(.state(t1),.count(count),.state_corrupt1(t2),.state_corrupt2(t3),
    .state_corrupt3(t4),.state_corrupt4(t5),.valid_state(vs));
    
    hamming_distance u3(.valid_state(vs),.state_corrupt1(t2),.state_corrupt2(t3),
    .state_corrupt3(t4),.state_corrupt4(t5),.hamming_distance1(h1),
    .hamming_distance2(h2),.hamming_distance3(h3),
    .hamming_distance4(h4));
    
    correction u4(.state(t1),.hamming_distance1(h1),
    .hamming_distance2(h2),.hamming_distance3(h3),
    .hamming_distance4(h4),.actual_state(actual_state));
    
endmodule

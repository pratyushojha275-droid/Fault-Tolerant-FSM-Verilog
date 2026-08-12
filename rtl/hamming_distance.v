`timescale 1ns / 1ps

module hamming_distance(input valid_state, [4:0]state_corrupt1,
[4:0]state_corrupt2, [4:0]state_corrupt3, [4:0]state_corrupt4,
output reg[2:0] hamming_distance1,reg[2:0] hamming_distance2,
reg[2:0] hamming_distance3,reg[2:0] hamming_distance4);
    
    integer i;
    
    always @(*)begin
    
    if(valid_state)begin
    hamming_distance1 = 3'b000;
    hamming_distance2 = 3'b000;
    hamming_distance3 = 3'b000;
    hamming_distance4 = 3'b000;
    end
    
    else begin
        
    for( i=0; i< 5; i=i+1)begin
    
    if(state_corrupt1[i] == 1'b1)begin
    hamming_distance1 = hamming_distance1 +3'b001;
    end 
    if(state_corrupt2[i] == 1'b1)begin
    hamming_distance2 = hamming_distance2 +3'b001;
    end
    if(state_corrupt3[i] == 1'b1)begin
    hamming_distance3 = hamming_distance3 +3'b001;
    end
    if(state_corrupt4[i] == 1'b1)begin
    hamming_distance4 = hamming_distance4 +3'b001;
    end
    end
    end
    end
endmodule

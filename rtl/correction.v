`timescale 1ns / 1ps

module correction(input clk, [4:0]state,[2:0] hamming_distance1,[2:0] hamming_distance2,[2:0] hamming_distance3,
[2:0] hamming_distance4,output reg [4:0]actual_state

    );
    
    always @(*)begin
    
    if((state != 5'b00000) && (state!=5'b00111) && (state!=5'b11001) && (state!=5'b11110)) begin
    
    if(hamming_distance1 == 3'b001)begin
    actual_state <= 5'b00000;
    end  
    if(hamming_distance2 == 3'b001)begin
    actual_state <= 5'b00111;
    end  
    
    if(hamming_distance3 == 3'b001)begin
    actual_state <= 5'b11001;
    end  
    
    if(hamming_distance4 == 3'b001)begin
    actual_state <= 5'b11110;
    end  
    end
    if(state == 5'b00000)begin
    actual_state <= 5'b00000;
    end
    if(state == 5'b00111)begin
    actual_state <= 5'b00111;
    end
    if(state == 5'b11001)begin
    actual_state <= 5'b11001;
    end
    if(state == 5'b11110)begin
    actual_state <= 5'b11110;
    end
    
    end
endmodule

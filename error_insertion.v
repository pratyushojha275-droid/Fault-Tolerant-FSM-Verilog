`timescale 1ns / 1ps

module error_insertion(input [4:0] state, output reg [7:0]count, valid_state, reg [4:0]state_corrupt1,
reg [4:0]state_corrupt2, reg [4:0]state_corrupt3, reg [4:0]state_corrupt4

    );
    
    initial begin
    count<=8'b0;
    end
    
    always @(state)begin
    
    if((state == 5'b00000) || (state==5'b00111) || (state==5'b11001) || (state==5'b11110)) begin
    valid_state <= 1'b1;
    end 
    else begin
    valid_state <= 1'b0;
    end

    if(valid_state==0)begin
    count <= count +8'b1;
    end
    end
    
    always @(state)begin
    
    if((state != 5'b00000) && (state!=5'b00111) && (state!=5'b11001) && (state!=5'b11110)) begin
    state_corrupt1 <= state^5'b00000;
    state_corrupt2 <= state^5'b00111;
    state_corrupt3 <= state^5'b11001;
    state_corrupt4 <= state^5'b11110;
    end 
    
    if((state == 5'b00000) || (state==5'b00111) || (state==5'b11001) || (state==5'b11110)) begin
    state_corrupt1 <= 5'b00000;
    state_corrupt2 <= 5'b00000;
    state_corrupt3 <= 5'b00000;
    state_corrupt4 <= 5'b00000;
    
    end
    end
endmodule

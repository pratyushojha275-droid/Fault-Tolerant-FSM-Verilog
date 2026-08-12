`timescale 1ns / 1ps

module fsm_core(input clk, x, output reg [1:0] y, reg [4:0] state );

    parameter IDLE = 5'b00000;
    parameter s1 = 5'b00111;
    parameter s2 = 5'b11001;
    parameter s3 = 5'b11110;
    reg [4:0] states = IDLE;
    
    initial begin
    state = 5'b00000;
    states = 5'b00000;
    y = 2'b00;
    end
    
    always @(posedge clk) begin
    
    case(states)
    5'b00000 : begin 
    if(x==0)begin
    state<= 5'b00000;
    states<= 5'b00000;
    y<= 2'b00;
    end
    else begin
    state<= 5'b00111;
    states<= 5'b00111;
    y<= 2'b01;
    end
    end
    5'b00111 : begin 
    if(x==0)begin
    state<= 5'b00111;
    states<= 5'b00111;
    y<= 2'b01;
    end
    else begin
    state<= 5'b11001;
    states<= 5'b11001;
    y<= 2'b10;
    end
    end
    5'b11001 : begin 
    if(x==0)begin
    state<= 5'b11001;
    states<= 5'b11001;
    y<= 2'b10;
    end
    else begin
    state<= 5'b11110;
    states<= 5'b11110;
    y<= 2'b11;
    end
    end
    5'b11110 : begin 
    if(x==0)begin
    state<= 5'b11110;
    states<= 5'b11110;
    y<= 2'b11;
    end
    else begin
    state<= 5'b00000;
    states<= 5'b00000;
    y<= 2'b00;
    end
    end
    default: begin
    state<= 5'b00000;
    states<= 5'b00000;
    y<= 2'b00;
    end
    endcase
    
    end 
endmodule

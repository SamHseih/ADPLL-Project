//------------------------------------------------------//
//- Advanced Digital IC Design                          //
//-                                                     //
//- Exercise: PLL Controller                            //
//------------------------------------------------------//

`timescale 1ns/1ps
`include "DCO.v"

module CONTROLLER(reset, phase_clk,  p_up, p_down, dco_code, freq_lock, polarity, DCO_OUT , RESET_);

input	       reset, phase_clk;
input          p_up, p_down;

output [6:0]   dco_code;
output         freq_lock;
output         polarity;
output         DCO_OUT;
output RESET_;

assign RESET_ = ~reset;

//Write Your PLL Controller Here
reg freq_lock;
reg [4:0] step;  //add/sub value
reg [6:0] dco_code;
reg pre_state,current_state;
wire [6:0] coarse;

//using pre_signal vs current_signal to find change singnal
always@(posedge reset or negedge phase_clk)begin
  if(reset)begin
   current_state <= 1'b1;
  end else if (!p_up)begin
    current_state <= 1'b1;
  end else if (!p_down)begin
    current_state <= 1'b0; 
  end
end
always@(posedge reset or negedge phase_clk)begin
  if(reset)begin
    pre_state <= 1'b1;
  end else if (!p_up ||!p_down)begin
    pre_state <= current_state;
  end
end

//polarity control means up and down change
assign polarity = pre_state ^ current_state;

//change add/sub value  
always@(posedge reset or negedge phase_clk)begin
  if (reset)begin
    step <= 5'd31;
  end else if(step == 5'd1)begin
    step <= step; 
  end else if(polarity)begin
    if(step != 5'd1) step <= step>>1;
  end 
end


//change control code Add
always@(posedge reset or negedge phase_clk)begin
  if(reset)begin
    dco_code <= 7'd64;
  end else if(p_up && dco_code <= step)begin
    dco_code <= 7'd0;
  end else if(p_up)begin
    dco_code <= dco_code - step;
  end else if(p_down && (dco_code >= (7'd127 - step)))begin
    dco_code <= 7'd127; 
  end else if(p_down)begin
    dco_code <= dco_code + step; 
  end
end

//freq_lock 
always@(posedge reset or negedge phase_clk)begin
  if (reset)begin
    freq_lock <= 1'b0;
  end else if(step == 1'd1)freq_lock <= 1'b1;
end


assign coarse[0] = dco_code[0];
assign coarse[1] = dco_code[1];
assign coarse[2] = dco_code[2];
assign coarse[3] = dco_code[3];
assign coarse[4] = dco_code[4];
assign coarse[5] = dco_code[5];
assign coarse[6] = dco_code[6];
//reset_=0, DCO is reset, reset_=1, DCO works
//DCO   !!!reset need Inverse!!!
DCO DCO(.RESET(RESET_), .coarse_0(coarse[0]), .coarse_1(coarse[1]),  
        .coarse_2(coarse[2]), .coarse_3(coarse[3]), .coarse_4(coarse[4]),
        .coarse_5(coarse[5]),  .coarse_6(coarse[6]),
        .DCO_OUT(DCO_OUT));


endmodule

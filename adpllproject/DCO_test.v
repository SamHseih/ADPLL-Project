//------------------------------------------------------//
//- Advanced Digital IC Design                          //
//-                                                     //
//- Exercise: Design a FSK Modem                        //
//------------------------------------------------------//
`timescale 1ns/1ps
`include "DCO.v"

module DCO(RESET, TX_CLK, TX_DATA, FSK_OUT);

  input  RESET, TX_CLK, TX_DATA;
  output FSK_OUT;

wire [6:0]coarse;
reg state;
wire RESET_;
assign RESET_ = ~RESET;
//DCO   !!!reset need Inverse!!!
DCO DCO(.dco_reset(RESET_), .coarse_0(coarse[0]), .coarse_1(coarse[1]),  .coarse_2(coarse[2]),  .coarse_3(coarse[3]), .coarse_4(coarse[4]),  .coarse_5(coarse[5]),  .coarse_6(coarse[6]),  .dco_OUT(FSK_OUT));

//FSK Control
always@(posedge RESET or posedge TX_CLK)begin
  if(RESET)begin
    state <= 7'd0;
  end
  else if(TX_CLK)begin
    if(TX_DATA == 1)begin
      state <= 1'd1;
    end else begin
      state <= 1'd0;
    end   
  end
end

assign coarse = (state)?7'd0:7'd127;

endmodule

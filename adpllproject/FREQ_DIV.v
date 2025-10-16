//------------------------------------------------------//
//- Advanced Digital IC Design                          //
//-                                                     //
//- Exercise: Frequency Divider                         //
//------------------------------------------------------//

`timescale 1ns/1ps
module FREQ_DIV(reset, clk, M, Out_divM);

input         reset;
input	      clk;
input	[2:0] M;
output	      Out_divM;

//Write Your Programmable Counter-based Frequency Divider Here
reg [2:0] counter;
reg out;

assign Out_divM = (M==1)?clk:out;

always@(posedge reset or posedge clk)begin
  if(reset)begin
    counter <= 3'd0;
  end else if(counter==0) begin
    counter <= M - 3'd1;
  end else begin 
    counter <= counter - 3'd1;
  end
end

always@(posedge reset or posedge clk)begin
  if(reset)begin
    out <= 1'b0;
  end else if(counter == 0 ) begin
    out <= 1'b1;
  end else begin 
    out <= 1'b0;
  end
end
//always@(clk) $display("counter = %d\nout= %b\nOut_divM= %b",counter,out,Out_divM);
endmodule

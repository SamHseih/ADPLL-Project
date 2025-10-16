//------------------------------------------------------//
//- Advanced Digital IC Design                          //
//-                                                     //
//- Exercise: Design a FSK Modem                        //
//------------------------------------------------------//
`timescale 1ns/1ps
module MONITOR(OUT_CLK,freq_lock, RESET,M ,REF_CLK);
   input OUT_CLK, freq_lock;
  output RESET,M, REF_CLK;
   
    reg  RESET, REF_CLK;
    reg [2:0] M;


//DCO Process SS 84MHz ~852 MHz
//DCO Process TT 148MHz ~1525 MHz
//DCO Process FF 209MHz ~2200 MHz

//PFD 85MHz ~ 400 MHz

//333MHz Reference Clock: Period is 3ns
//400MHz Reference Clock: Period is 2.5ns
//500MHz Reference Clock: Period is 2ns
//1GHz
//always@(*) #(0.9*M) REF_CLK = ~REF_CLK;
always #1 REF_CLK = ~REF_CLK; 

initial begin
$dumpfile("PLL.vcd");
$dumpvars;

RESET=1'b1; REF_CLK=1'b0; 
M=3'd2;
#30 
RESET=1'b0;
#50000 

$finish;
end

endmodule

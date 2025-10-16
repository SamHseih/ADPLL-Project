//------------------------------------------------------//
//- Advanced Digital IC Design                          //
//-                                                     //
//- LAB04d PFD Modeling                                 //
//------------------------------------------------------//


//Include Sub modules


`timescale 1ns/1ps

module TEST(OUT_CLK, freq_lock, reset ,M ,REF_CLK);

output reg   reset;  //System Reset
output reg [2:0] M;
output reg REF_CLK;
input OUT_CLK;
input freq_lock;


reg R_REF_CLK;

prameter phase=1;
parameter K = 0.9;

reg[3:0] counter;
integer Cycle;
real OutCycle;

real LockInTime;
real lastTime;
real RefPeriod;
real outPeriod;
real outClock;
real lastPeriod;
real Jper;
real Jcc;
real Jlong;
real CycleTime;


real delay = 0.058; //ns
real period = 20;

//25MHz Reference Clock: Period is 40ns
//50MHz Reference Clock: Period is 20ns
//125MHz Reference Clock: Period is 8ns
//333MHz Reference Clock: Period is 3ns
//400MHz Reference Clock: Period is 2.5ns
//500MHz Reference Clock: Period is 2ns

always@(COARSE)begin
  case(COARSE)
   3'd0 :period <= 20;
   3'd1 :period <= 10;
   3'd2 :period <= 4;
   3'd3 :period <= 1.5;
   3'd4 :period <= 1.25;
   3'd5 :period <= 1;
   3'd6 :begin period <= 10; delay=0.06; end
   3'd7 :delay=0.05;
  endcase
end
//ref_clk
always #period REF_CLK= ~REF_CLK; 
always@(REF_CLK or RESET_)#delay REF_CLK_FB =  REF_CLK & RESET_;

//Instanitate dco module
pfd_model pfd_lag( .reset_(RESET_), .IN(REF_CLK), .FB(REF_CLK_FB), .flagU(PFD_OUTU_lag), .flagD(PFD_OUTD_lag) );
pfd_model pfd_lead( .reset_(RESET_), .IN(REF_CLK_FB), .FB(REF_CLK), .flagU(PFD_OUTU_lead), .flagD(PFD_OUTD_lead) );


//TEST all PFD control codes
always@(negedge PFD_OUTU_lag or negedge PFD_OUTD_lag or negedge RESET_)
  begin
    if(!RESET_) begin
       counter <= 4'd0;
       COARSE <= 3'd0;
    end else if(counter == 4'd10) begin
       COARSE <= COARSE + 3'd1;
       counter <= 4'd0; //clear counter
    end else begin
       counter <= counter + 1'b1; //increase counter
    end
  end 


initial begin
//WaveDump all signals
$fsdbDumpfile("dco_model.fsdb");
$fsdbDumpvars;

RESET_=1'b0;
REF_CLK = 1'b0;
REF_CLK_FB = 1'b0;

#15 RESET_=1'b1;
#5 REF_CLK=1'b0;
////TEST DCO control code

#500;
#1000 $finish;
end

endmodule
            

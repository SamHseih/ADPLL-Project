//------------------------------------------------------//
//- Advanced Digital IC Design                          //
//-                                                     //
//- LAB04d PFD Modeling                                 //
//------------------------------------------------------//
`timescale 1ns/1ps
//PFD_dead_zone 58ps
//25MHz Reference Clock: Period is 40ns
//50MHz Reference Clock: Period is 20ns
//125MHz Reference Clock: Period is 8ns
//333MHz Reference Clock: Period is 3ns
//400MHz Reference Clock: Period is 2.5ns
//500MHz Reference Clock: Period is 2ns
module PFD(reset,IN,FB, flagU,flagD);
input IN,FB;
input reset;
output  flagU,flagD;

reg QU,QD;
reg OUTU,OUTD;
wire A1A2;
reg RST; 
wire OUTBU,OUTBD;
reg outU,outD;

assign A1A2 = ~(QU&&QD);
//DFF*2
always@(posedge IN or negedge RST)begin
if(RST==1'b0) QU<= #0.01 1'b0; else QU <= #0.05 1'b1;
end
always@(posedge FB or negedge RST)begin
if(RST==1'b0) QD<= #0.01 1'b0; else QD <= #0.05 1'b1;
end
//RST
always@(A1A2 or reset) RST = #0.02 (A1A2 && reset);
//OUT U/D
always@(QU or QD) OUTU <= #0.1 ~(QU&&!QD);
always@(QU or QD) OUTD <= #0.1 ~(!QU&&QD);
//OUTB U/D
assign #0.07 OUTBU = OUTU;
assign #0.07 OUTBD = OUTD;
//2 * DFF
always@(posedge IN or negedge OUTBU)begin
    if(OUTBU==1'b0) outU <= #0.01 1'b0; else outU <= #0.01 1'b1;
end 

always@(posedge FB or negedge OUTBD)begin
    if(OUTBD==1'b0) outD <= #0.01 1'b0; else outD <= #0.01 1'b1;
end 

assign flagU = outU;
assign flagD = outD;



endmodule

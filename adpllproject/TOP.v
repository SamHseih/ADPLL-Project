//------------------------------------------------------//
//- Advanced Digital IC Design                          //
//-                                                     //
//- Exercise: Design a FSK Modem                        //
//------------------------------------------------------//
`timescale 1ns/1ps
`include "ADPLL_MONITOR.v"
`include "FREQ_DIV.v"
`include "CONTROLLER.v"
`include "PFD.v"
`include "DCO.v"


module TOP;
wire [2:0] M;
wire [6:0] dco_code;

//PFD
PFD PFD(.reset(RESET_), .IN(REF_CLK), .FB(Out_divM), .flagU(flagU), .flagD(flagD));

//PLLControler
CONTROLLER CONTROLLER(.reset(RESET), .phase_clk(REF_CLK), .p_up(flagU), .p_down(flagD), .dco_code(dco_code), .freq_lock(freq_lock), .polarity(polarity), .DCO_OUT(OUT_CLK), .RESET_(RESET_));
//FRQDIV
FREQ_DIV FREQ_DIV(.reset(RESET), .clk(OUT_CLK), .M(M), .Out_divM(Out_divM));

//Test Module
MONITOR MONITOR(.OUT_CLK(OUT_CLK), .RESET(RESET), .REF_CLK(REF_CLK), .M(M) );

endmodule

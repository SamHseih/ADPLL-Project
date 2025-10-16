//------------------------------------------------------//
//- Advanced Digital IC Design                          //
//-                                                     //
//- LAB04d DCO Modeling                                 //
//------------------------------------------------------//


//Include Sub modules
`include "dco_model.v"

`timescale 1ns/1ps
module TEST;

reg       RESET_;   //System Reset
reg [6:0] COARSE;   //DCO control code

reg [3:0] counter;

//Instanitate dco module
dco_model dco(.reset_(RESET_), .coarse(COARSE), .dco_out(DCO_OUT));

//TEST all DCO control codes
always@(negedge DCO_OUT or negedge RESET_)
  begin
    if(!RESET_) begin
       counter <= 4'd0;
       COARSE <= 7'd0;
    end else if(counter == 4'd10) begin
       COARSE <= COARSE + 7'd1;
       counter <= 4'd0; //clear counter
    end else begin
       counter <= counter + 1'b1; //increase counter
    end
  end 

initial begin
//WaveDump all signals
$fsdbDumpfile("dco_model.fsdb");
$fsdbDumpvars;

RESET_=1'b0; COARSE=6'd0;
#15 RESET_=1'b1;
//TEST DCO control code
#500;
#1000 $finish;
end

endmodule
            

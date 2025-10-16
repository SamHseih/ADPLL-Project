//------------------------------------------------------//
//- Advanced Digital IC Design                          //
//-                                                     //
//- Exercise: Design a DCO module                       //
//------------------------------------------------------//
`timescale 1ns/1ps


module DCO(RESET, coarse_0, coarse_1, coarse_2,coarse_3, coarse_4, coarse_5, coarse_6,coarse_7, DCO_OUT);

  input  RESET, coarse_0, coarse_1, coarse_2,coarse_3, coarse_4, coarse_5, coarse_6, coarse_7;
  output DCO_OUT;
wire [6:0]coarse;
assign coarse[0] = coarse_0;
assign coarse[1] = coarse_1;
assign coarse[2] = coarse_2;
assign coarse[3] = coarse_3;
assign coarse[4] = coarse_4;
assign coarse[5] = coarse_5;
assign coarse[6] = coarse_6;

real period = 1;
reg DCO_OUT;

always@(coarse) begin
  case(coarse)
  7'd0  :period <= 8.65449690;    7'd1  :period <= 5.18223750;    7'd2  :period <= 3.99909710;    7'd3  :period <= 2.72813910;  
  7'd4  :period <= 2.44626160;    7'd5  :period <= 2.18203660;    7'd6  :period <= 1.95476810;    7'd7  :period <= 1.83838080;  
  7'd8  :period <= 1.71358440;    7'd9  :period <= 1.61941850;    7'd10 :period <= 1.55305070;    7'd11 :period <= 1.46866740;  
  7'd12 :period <= 1.41547020;    7'd13 :period <= 1.37859770;    7'd14 :period <= 1.31989700;    7'd15 :period <= 1.28496680;  
  7'd16 :period <= 1.26165100;    7'd17 :period <= 1.22011100;    7'd18 :period <= 1.19533940;    7'd19 :period <= 1.17210790;  
  7'd20 :period <= 1.14150070;    7'd21 :period <= 1.12319420;    7'd22 :period <= 1.10571740;    7'd23 :period <= 1.08201780;  
  7'd24 :period <= 1.06523750;    7'd25 :period <= 1.04775350;    7'd26 :period <= 1.03081480;    7'd27 :period <= 1.01777320;  
  7'd28 :period <= 1.00617920;    7'd29 :period <= 0.98993999;    7'd30 :period <= 0.98104531;    7'd31 :period <= 0.97164149;  
  7'd32 :period <= 0.95593239;    7'd33 :period <= 0.94710375;    7'd34 :period <= 0.94075828;    7'd35 :period <= 0.92471993;  
  7'd36 :period <= 0.92229194;    7'd37 :period <= 0.91508593;    7'd38 :period <= 0.90512704;    7'd39 :period <= 0.89487713;  
  7'd40 :period <= 0.88917758;    7'd41 :period <= 0.87858923;    7'd42 :period <= 0.87439622;    7'd43 :period <= 0.87033405;  
  7'd44 :period <= 0.86222701;    7'd45 :period <= 0.85744378;    7'd46 :period <= 0.85133146;    7'd47 :period <= 0.84333628;  
  7'd48 :period <= 0.83771049;    7'd49 :period <= 0.83299987;    7'd50 :period <= 0.82766084;    7'd51 :period <= 0.82310067;  
  7'd52 :period <= 0.81974561;    7'd53 :period <= 0.81249310;    7'd54 :period <= 0.81071528;    7'd55 :period <= 0.80651975;  
  7'd56 :period <= 0.80123771;    7'd57 :period <= 0.79705921;    7'd58 :period <= 0.79435906;    7'd59 :period <= 0.78925992;  
  7'd60 :period <= 0.78552444;    7'd61 :period <= 0.78321563;    7'd62 :period <= 0.77782792;    7'd63 :period <= 0.77617738;  
  7'd64 :period <= 0.77173249;    7'd65 :period <= 0.76776717;    7'd66 :period <= 0.76497112;    7'd67 :period <= 0.76247464;  
  7'd68 :period <= 0.75873705;    7'd69 :period <= 0.75784542;    7'd70 :period <= 0.75405998;    7'd71 :period <= 0.74919754; 
  7'd72 :period <= 0.74786596;    7'd73 :period <= 0.74537977;    7'd74 :period <= 0.74219823;    7'd75 :period <= 0.74034989;  
  7'd76 :period <= 0.73803859;    7'd77 :period <= 0.73689295;    7'd78 :period <= 0.73394403;    7'd79 :period <= 0.73086244;  
  7'd80 :period <= 0.72830933;    7'd81 :period <= 0.72597884;    7'd82 :period <= 0.72576196;    7'd83 :period <= 0.72127690;  
  7'd84 :period <= 0.71959318;    7'd85 :period <= 0.71963978;    7'd86 :period <= 0.71509102;    7'd87 :period <= 0.71707330;  
  7'd88 :period <= 0.71299260;    7'd89 :period <= 0.71032557;    7'd90 :period <= 0.70749237;    7'd91 :period <= 0.70674166;  
  7'd92 :period <= 0.70369888;    7'd93 :period <= 0.70258640;    7'd94 :period <= 0.70035008;    7'd95 :period <= 0.69863412;  
  7'd96 :period <= 0.69768498;    7'd97 :period <= 0.69575727;    7'd98 :period <= 0.69367074;    7'd99 :period <= 0.69133683;  
  7'd100:period <= 0.69115082;    7'd101:period <= 0.68736709;    7'd102:period <= 0.68756550;    7'd103:period <= 0.68680024;  
  7'd104:period <= 0.68491308;    7'd105:period <= 0.68285327;    7'd106:period <= 0.68308561;    7'd107:period <= 0.68118434;  
  7'd108:period <= 0.67919448;    7'd109:period <= 0.67749676;    7'd110:period <= 0.67568888;    7'd111:period <= 0.67533645;  
  7'd112:period <= 0.67368417;    7'd113:period <= 0.67242127;    7'd114:period <= 0.67311935;    7'd115:period <= 0.66858079;  
  7'd116:period <= 0.67073221;    7'd117:period <= 0.66640991;    7'd118:period <= 0.66678689;    7'd119:period <= 0.66468887;  
  7'd120:period <= 0.66416840;    7'd121:period <= 0.66299564;    7'd122:period <= 0.66220543;    7'd123:period <= 0.65985753;  
  7'd124:period <= 0.65959501;    7'd125:period <= 0.65956940;    7'd126:period <= 0.65629420;    7'd127:period <= 0.65610882;
  endcase
 end

always@(posedge RESET) //DCO Work
  begin : dco_run
    forever begin : dco_set
      DCO_OUT = ~DCO_OUT;
      #(period/2.0);
    end
  end
      
always@(negedge RESET) //DCO STOP
  begin
    DCO_OUT = 0;
    disable dco_run; //turn off DCO when reset_=0;
  end




endmodule

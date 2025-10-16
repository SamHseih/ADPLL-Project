*******************************************************
* Advanced Digital IC Design                          *
*                                                     *
* Demo: DCO with Digital Vector Input                 *
*******************************************************
*** Voltage: 1.8V ***
.PARAM supply=1.8v
*.PARAM tem=25
*** Temperature: 25C ***
*.TEMP tem
***********************************
* Define Global Nets              *
***********************************
.GLOBAL VDD VSS
***********************************
* Voltage Sources                 *
***********************************
vdd     VDD   0  DC supply
vss     VSS   0  DC 0
***********************************
* TOP Circuit                     *
***********************************
.INCLUDE "ultrasim_cells.sp"
***********************************
* Subckt Definition               *
***********************************
.SUBCKT DCO RESET coarse_0 coarse_1 coarse_2 coarse_3 coarse_4 coarse_5 coarse_6 DCO_OUT

C1 DCO_OUT 0 0.02p

Xbegin1  RESET  DCO_OUT  C0  NAND2X1 
Xbegin2   VDD C0 C1  TBUFIX1 
Xbegin3   VDD C1  DCO_OUT TBUFIX1 
XIEND VDD C1 DCO_OUT TBUFIX1
*Firs level*
XFirst1   coarse_0  DCO_OUT C0 TBUFIX4 
XFirst2   coarse_2  DCO_OUT C0 TBUFIX4 
XFirst3   coarse_2  DCO_OUT C0 TBUFIX4 
XFirst4   coarse_3  DCO_OUT C0 TBUFIX4 
XFirst5   coarse_3  DCO_OUT C0 TBUFIX4 
XFirst6   coarse_4  DCO_OUT C0 TBUFIX4 
XFirst7   coarse_4  DCO_OUT C0 TBUFIX4 
XFirst8   coarse_4  DCO_OUT C0 TBUFIX4 
XFirst9   coarse_4  DCO_OUT C0 TBUFIX4 
XFirst10  coarse_4  DCO_OUT C0 TBUFIX4 
XFirst11  coarse_4  DCO_OUT C0 TBUFIX4 
XFirst12  coarse_5  DCO_OUT C0 TBUFIX4 
XFirst13  coarse_5  DCO_OUT C0 TBUFIX4 
XFirst14  coarse_5  DCO_OUT C0 TBUFIX4 
XFirst15  coarse_5  DCO_OUT C0 TBUFIX4 
XFirst16  coarse_5  DCO_OUT C0 TBUFIX4
XFirst17  coarse_5  DCO_OUT C0 TBUFIX4
XFirst18  coarse_5  DCO_OUT C0 TBUFIX4
XFirst19  coarse_5  DCO_OUT C0 TBUFIX4
XFirst20  coarse_5  DCO_OUT C0 TBUFIX4
XFirst21  coarse_5  DCO_OUT C0 TBUFIX4
XFirst22  coarse_6  DCO_OUT C0 TBUFIX4
XFirst23  coarse_6  DCO_OUT C0 TBUFIX4
XFirst24  coarse_6  DCO_OUT C0 TBUFIX4
XFirst25  coarse_6  DCO_OUT C0 TBUFIX4
XFirst26  coarse_6  DCO_OUT C0 TBUFIX4
XFirst27  coarse_6  DCO_OUT C0 TBUFIX4
XFirst28  coarse_6  DCO_OUT C0 TBUFIX4
XFirst29  coarse_6  DCO_OUT C0 TBUFIX4
XFirst30  coarse_6  DCO_OUT C0 TBUFIX4
XFirst31  coarse_6  DCO_OUT C0 TBUFIX4
XFirst32  coarse_6  DCO_OUT C0 TBUFIX4
XFirst33  coarse_6  DCO_OUT C0 TBUFIX4
XFirst34  coarse_6  DCO_OUT C0 TBUFIX4
XFirst35  coarse_6  DCO_OUT C0 TBUFIX4
XFirst36  coarse_6  DCO_OUT C0 TBUFIX4
XFirst37  coarse_6  DCO_OUT C0 TBUFIX4
XFirst38  coarse_6  DCO_OUT C0 TBUFIX4
XFirst39  coarse_6  DCO_OUT C0 TBUFIX4
XFirst40  coarse_6  DCO_OUT C0 TBUFIX4
XFirst41  coarse_6  DCO_OUT C0 TBUFIX4
XFirst42  coarse_6  DCO_OUT C0 TBUFIX4
XFirst43  coarse_6  DCO_OUT C0 TBUFIX4
*Second level*
XSecond1   coarse_1  C0 C1 TBUFIX1 
XSecond2   coarse_2  C0 C1 TBUFIX1 
XSecond3   coarse_3  C0 C1 TBUFIX1 
XSecond4   coarse_3  C0 C1 TBUFIX1 
XSecond5   coarse_3  C0 C1 TBUFIX1 
XSecond6   coarse_4  C0 C1 TBUFIX1 
XSecond7   coarse_4  C0 C1 TBUFIX1 
XSecond8   coarse_4  C0 C1 TBUFIX1 
XSecond9   coarse_4  C0 C1 TBUFIX1 
XSecond10  coarse_4  C0 C1 TBUFIX1 
XSecond11  coarse_5  C0 C1 TBUFIX1 
XSecond12  coarse_5  C0 C1 TBUFIX1 
XSecond13  coarse_5  C0 C1 TBUFIX1 
XSecond14  coarse_5  C0 C1 TBUFIX1 
XSecond15  coarse_5  C0 C1 TBUFIX1 
XSecond16  coarse_5  C0 C1 TBUFIX1 
XSecond17  coarse_5  C0 C1 TBUFIX1 
XSecond18  coarse_5  C0 C1 TBUFIX1 
XSecond19  coarse_5  C0 C1 TBUFIX1 
XSecond20  coarse_5  C0 C1 TBUFIX1 
XSecond21  coarse_5  C0 C1 TBUFIX1 
XSecond22  coarse_6  C0 C1 TBUFIX1 
XSecond23  coarse_6  C0 C1 TBUFIX1 
XSecond24  coarse_6  C0 C1 TBUFIX1 
XSecond25  coarse_6  C0 C1 TBUFIX1 
XSecond26  coarse_6  C0 C1 TBUFIX1 
XSecond27  coarse_6  C0 C1 TBUFIX1 
XSecond28  coarse_6  C0 C1 TBUFIX1 
XSecond29  coarse_6  C0 C1 TBUFIX1 
XSecond30  coarse_6  C0 C1 TBUFIX1 
XSecond31  coarse_6  C0 C1 TBUFIX1 
XSecond32  coarse_6  C0 C1 TBUFIX1 
XSecond33  coarse_6  C0 C1 TBUFIX1 
XSecond34  coarse_6  C0 C1 TBUFIX1 
XSecond35  coarse_6  C0 C1 TBUFIX1 
XSecond36  coarse_6  C0 C1 TBUFIX1 
XSecond37  coarse_6  C0 C1 TBUFIX1 
XSecond38  coarse_6  C0 C1 TBUFIX1 
XSecond39  coarse_6  C0 C1 TBUFIX1 
XSecond40  coarse_6  C0 C1 TBUFIX1 
XSecond41  coarse_6  C0 C1 TBUFIX1 
XSecond42  coarse_6  C0 C1 TBUFIX1 
*Third level*
XThird1   coarse_1  C1 DCO_OUT TBUFIX3
XThird2   coarse_2  C1 DCO_OUT TBUFIX3
XThird3   coarse_3  C1 DCO_OUT TBUFIX3
XThird4   coarse_3  C1 DCO_OUT TBUFIX3
XThird5   coarse_3  C1 DCO_OUT TBUFIX3
XThird6   coarse_4  C1 DCO_OUT TBUFIX3
XThird7   coarse_4  C1 DCO_OUT TBUFIX3
XThird8   coarse_4  C1 DCO_OUT TBUFIX3
XThird9   coarse_4  C1 DCO_OUT TBUFIX3
XThird10  coarse_4  C1 DCO_OUT TBUFIX3
XThird11  coarse_5  C1 DCO_OUT TBUFIX3
XThird12  coarse_5  C1 DCO_OUT TBUFIX3
XThird13  coarse_5  C1 DCO_OUT TBUFIX3
XThird14  coarse_5  C1 DCO_OUT TBUFIX3
XThird15  coarse_5  C1 DCO_OUT TBUFIX3
XThird16  coarse_5  C1 DCO_OUT TBUFIX3
XThird17  coarse_5  C1 DCO_OUT TBUFIX3
XThird18  coarse_5  C1 DCO_OUT TBUFIX3
XThird19  coarse_5  C1 DCO_OUT TBUFIX3
XThird20  coarse_5  C1 DCO_OUT TBUFIX3
XThird21  coarse_5  C1 DCO_OUT TBUFIX3
XThird22  coarse_6  C1 DCO_OUT TBUFIX3
XThird23  coarse_6  C1 DCO_OUT TBUFIX3
XThird24  coarse_6  C1 DCO_OUT TBUFIX3
XThird25  coarse_6  C1 DCO_OUT TBUFIX3
XThird26  coarse_6  C1 DCO_OUT TBUFIX3
XThird27  coarse_6  C1 DCO_OUT TBUFIX3
XThird28  coarse_6  C1 DCO_OUT TBUFIX3
XThird29  coarse_6  C1 DCO_OUT TBUFIX3
XThird30  coarse_6  C1 DCO_OUT TBUFIX3
XThird31  coarse_6  C1 DCO_OUT TBUFIX3
XThird32  coarse_6  C1 DCO_OUT TBUFIX3
XThird33  coarse_6  C1 DCO_OUT TBUFIX3
XThird34  coarse_6  C1 DCO_OUT TBUFIX3
XThird35  coarse_6  C1 DCO_OUT TBUFIX3
XThird36  coarse_6  C1 DCO_OUT TBUFIX3
XThird37  coarse_6  C1 DCO_OUT TBUFIX3
XThird38  coarse_6  C1 DCO_OUT TBUFIX3
XThird39  coarse_6  C1 DCO_OUT TBUFIX3
XThird40  coarse_6  C1 DCO_OUT TBUFIX3
XThird41  coarse_6  C1 DCO_OUT TBUFIX3
XThird42  coarse_6  C1 DCO_OUT TBUFIX3
.ENDS






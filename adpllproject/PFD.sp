*******************************************************
* Advanced Digital IC Design                          *
*                                                     *
* Exercise: Phase/Frequency Detector                  *
*******************************************************

***********************************
* TOP Circuit                     *
***********************************
.SUBCKT PFD reset IN FB flagU flagD
XDFFR1 IN VDD RST NO QU DFFRX4
XDFFR2 FB VDD RST NO QD DFFRX4

XAND1 A1A2 reset RST NAND2X1
XAND2 QU QD A1A2 AND2X1

XINV1 QU NQU1 INVX2
XINV2 QD NQD1 INVX2

XT1 NQU1 NQU BUFF7
XT2 NQD1 NQD BUFF7
XT3 QU QUB BUFF7
XT4 QD QDB BUFF7

XNAND1 QUB NQD OUTU NAND2X1
XNAND2 NQU QDB OUTD NAND2X1

XD1 OUTU OUTBU DPA
XD2 OUTD OUTBD DPA

XDFFR3 IN VDD OUTBU NO flagU DFFRX4
XDFFR4 FB VDD OUTBD NO flagD DFFRX4
.ENDS
***********************************
* Subckt Definition               *
***********************************

.SUBCKT DPA IN OUT
X0 IN A BUFX4
XA A IN AB AND2X1
XB AB A BC AND2X1 
XC BC AB CD AND2X1
XD CD BC DE AND2X1
XE DE CD EF AND2X1
XF EF DE OUT AND2X1
.ENDS

.SUBCKT BUFF7 A Y
X1 A T1 BUFX4 
X2 T1 T2 BUFX4
X3 T2 T3 BUFX4 
X4 T3 T4 BUFX4 
X5 T4 T5 BUFX4
X6 T5 T6 BUFX4
X7 T6 Y BUFX4
.ENDS

.END

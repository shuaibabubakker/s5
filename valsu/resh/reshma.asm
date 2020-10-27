	JSUB	FINDAREA
	JSUB	FINDPERIMETER
halt	J	halt
.
.
.	

FINDAREA LDA #1
         MUL BREADTH
         MUL LENGTH
         STA AREA
         RSUB
.
.
.
FINDPERIMETER LDA #0
              ADD BREADTH
              ADD LENGTH
              MUL #2
              STA PERIMETER
              RSUB
.
.
.
BREADTH WORD 5
LENGTH WORD 10
.
.
AREA RESW 1
PERIMETER RESW 1

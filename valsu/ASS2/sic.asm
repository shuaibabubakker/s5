	JSUB	ARE
	JSUB	PER
halt	J	halt

ARE     LDA	BASE
        MUL	HEIGHT
        STA	AREA
        RSUB

PER	LDA	SIDE
	ADD	BASE
	MUL	TWO
	STA	PERIMETER
	RSUB
	
TWO	WORD	2
SIDE	WORD	3
BASE	WORD	5
HEIGHT	WORD	4
AREA	RESW	1
PERIMETER	RESW	1


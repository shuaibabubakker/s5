	JSUB	ARE
	JSUB	PER
halt	J	halt
	
ARE     LDA	BASE
        LDS	HEIGHT
        MULR	S,A
        STA	AREA
        RSUB

PER	LDA	SIDE
	LDS	BASE
	ADDR	S,A
	MUL	#2
	STA	PERIMETER
	RSUB
	
SIDE	WORD	3
BASE	WORD	5
HEIGHT	WORD	4
AREA	RESW	1
PERIMETER	RESW	1

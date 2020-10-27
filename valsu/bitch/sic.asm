main	JSUB	score_calc
	JSUB	total_calc
	JSUB	perc_calc
HALT	J	HALT
	
score_calc	LDA	w
		MUL	w_mark
		STA	score
		LDA	c
		MUL	c_mark
		SUB	score
		STA	score
		RSUB
	
total_calc	LDA	c_mark
		MUL	n
		STA	total
		RSUB
	
perc_calc	LDA	score
		MUL	hundred
		DIV	total
		STA	perc
		RSUB


n	WORD	10
c_mark	WORD	4
w_mark	WORD	2
c	WORD	6
w	WORD	2
hundred	WORD	100
score	RESW	1
total	RESW	1
perc	RESW	1

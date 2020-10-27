main	LDF	#10.0
	STF	n
	LDF	#4.0
	STF	c_mark
	LDF	#2.0
	STF	w_mark
	LDF	#6.0
	STF	c
	LDF	#2.0
	STF	w
	JSUB	score_calc
	JSUB	total_calc
	JSUB	perc_calc
HALT	J	HALT
	
score_calc	LDF	w
		MULF	w_mark
		STF	score
		LDF	c
		MULF	c_mark
		SUBF	score
		STF	score
		RSUB
	
total_calc	LDF	c_mark
		MULF	n
		STF	total
		RSUB
	
perc_calc	LDF	score
		MULF	#100.0
		DIVF	total
		STF	perc
		RSUB


n	RESF	1
c_mark	RESF	1
w_mark	RESF	1
c	RESF	1
w	RESF	1
score	RESF	1
total	RESF	1
perc	RESF	1

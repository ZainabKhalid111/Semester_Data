ORG 00H
MOV TMOD,#01H
Again:SETB P1.0
ACALL Delay
CLR P1.0
ACALL Delay
SJMP Again

Delay : MOV TL0,#18H
		MOV TH0,#0FCH
		SETB TR0
		Back: JNB TF0,Back
		CLR TR0
		CLR TF0
		RET
END
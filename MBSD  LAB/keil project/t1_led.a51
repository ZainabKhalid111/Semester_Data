ORG 0x00;
	start:
		CLR P1.1
		CLR P1.2
		CLR P2.1
		CLR P2.2
		CLR P2.3.
		
		CLR P2.4
	Again:
		SETB P1.1
		SETB P1.2
	
	LABEL1:
		SETB P2.1
		SETB P2.2
		SETB P2.3
		SETB P2.4
		JMP LABEL1
	
		CLR P1.1
		CLR P1.2
	LABEL2:
		SETB P2.1
		CLR P2.2
		CLR P2.3
		CLR P2.4
		JMP LABEL2
	
		SETB P1.1
		CLR P1.2
	LABEL3:
		SETB P2.2
		CLR P2.1
		CLR P2.3
		CLR P2.4
		JMP LABEL3
	
		SETB P1.2
		CLR P1.0
	LABEL4:
		SETB P2.3
		CLR P2.1
		CLR P2.2
		CLR P2.4
		JMP LABEL4
	
	SJMP Again
END
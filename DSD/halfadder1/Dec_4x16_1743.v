
module Dec_4x16 (A, B, C, D, En, O);
input A, B, C, D, En; //A is MSB and D is LSB
output [15:0] O; //16 bit output
//Write your code here
	assign O[0]=~A&~B&~C&~D&En; //enable is active high
	assign O[1]=~A&~B&~C&D&En;
	assign O[2]=~A&~B&C&~D&En;
	assign O[3]=~A&~B&C&D&En;
	assign O[4]=~A&B&~C&~D&En;
	assign O[5]=~A&B&~C&D&En;
	assign O[6]=~A&B&C&~D&En;
	assign O[7]=~A&B&C&D&En;
	assign O[8]=A&~B&~C&~D&En;
	assign O[9]=A&~B&~C&D&En;
	assign O[10]=A&~B&C&~D&En;
	assign O[11]=A&~B&C&D&En;
	assign O[12]=A&B&~C&~D&En;
	assign O[13]=A&B&~C&D&En;
	assign O[14]=A&B&C&~D&En;
	assign O[15]=A&B&C&D&En;
endmodule //end of module
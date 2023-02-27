module test_HA1; //test bench to test HA1 (Half Adder)

	// Inputs are regs here
	reg A,B;
		
	// Outputs are wires here
	wire Sum, Carry;
	
	// Instantiate the Unit/Design Under Test (U/DUT)
	// HA1 dut (A, B, Sum, Carry);  // Positional association
	HA1 dut (.s(Sum), .c(Carry), .a(A), .b(B));  // Explicit association

	initial begin
	$display("A		B	C	S");
	A=0;B=0;
	#1
	$display(" %b	%b	%b %b",A,B,Carry,Sum);
	A=0;B=1;
	#1
	$display(" %b	%b	%b %b",A,B,Carry,Sum);
	A=1;B=0;
	#1
	$display(" %b	%b	%b %b",A,B,Carry,Sum);
	A=1;B=1;
	#1
	$display(" %b	%b	%b %b",A,B,Carry,Sum);

	end	      
endmodule
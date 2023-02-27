module test_HA2; //test bench to test HA2 (Half Adder)

	// Inputs are regs here
	reg A, B;
		
	// Outputs are wires here
	wire Sum, Carry;
	
	// Instantiate the Unit/Design Under Test (U/DUT)
	// HA2 dut (Sum, Carry, A, B);  // Positional association
	HA2 dut (.A(A), .B(B), .Su(Sum), .Ca(Carry));  // Explicit association

	initial begin
	// Initialize Inputs	
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

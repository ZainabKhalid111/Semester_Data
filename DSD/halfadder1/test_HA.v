module test_HA; //test bench to test HA (Half Adder)

	// Inputs are regs here
	reg A, B;
		
	// Outputs are wires here
	wire Sum, Carry;
	
	// Instantiate the Unit/Design Under Test (U/DUT)
	// HA dut (A, B, Sum, Carry);  // Positional association
	HA dut (.a(A), .b(B), .s(Sum), .c(Carry));  // Explicit association

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
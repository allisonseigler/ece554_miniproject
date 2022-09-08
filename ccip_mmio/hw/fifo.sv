// fifo.sv
// Implements delay buffer (fifo)
// On reset all entries are set to 0
// Shift causes fifo to shift out oldest entry to q, shift in d

module fifo
  #(
  parameter DEPTH=8,
  parameter BITS=64
  )
  (
  input clk,rst_n,en,
  input [BITS-1:0] d,
  output [BITS-1:0] q
  );
  // your RTL code here
 
 logic [BITS-1:0] buffer [DEPTH-1:0];
 integer i;

 always_ff @ (posedge clk or negedge rst_n) begin
	  if (!rst_n) begin
		  q <= 64'd0;
		  for (i = 0; i < DEPTH; i = i + 1) begin
			  buffer[i] <= BITS'd0;
		  end
	  end
	  else if(en) begin
		  q <= buffer[DEPTH - 1];
	  	  buffer[0] <= d;
		  for(i = 0; i < DEPTH - 1; i = i + 1) begin
			  buffer[i+1] <= buffer[i];
	 	  end
	end
end
	  
endmodule // fifo

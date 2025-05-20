module DSP_tb;
parameter OPERATION = "ADD";
logic  [17:0] A, B, D;
logic  [47:0] C;
logic clk, rst_n;
logic  [47:0] P;
DSP m1 (.*);

initial begin
  clk =0;
  forever  
  #1
  clk =~clk;
  end
int error_count;
int correct_count;
initial begin
	assert_reset;
    repeat (100) begin
      A = $random;
      B = $random;
      C = $random;
      D = $random;
	 check_result(P);
      @(negedge clk); 
    end
    assert_reset;
      $stop;
end

task check_result(input [47:0] exc_res);
    @(negedge clk);
    if (exc_res !== P) begin
         $display ("incorrect result");
         error_count= error_count+1;
    end
    else begin
        $display ("correct result");
        correct_count= correct_count+1;
    end
  endtask 

  task assert_reset;
  rst_n =0;
  check_result(0);
  rst_n =1;

  endtask 
endmodule 

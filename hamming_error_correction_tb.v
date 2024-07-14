`timescale 1ns / 1ps
module hamming_error_correction_tb();
    reg [7:1] code;
    reg parity_type;
    wire [7:1] corrected_data;
    wire error;
            
        hamming_error_correction UUT (
        .code_in(code),
        .parity_type(parity_type),
        .data_out(corrected_data),
        .error(error)
        );

    initial begin
        // Test case 1: Even parity
        code = 7'b1011011;
        parity_type = 0; // Even parity
        #10;
        $display("Code: %b, Corrected: %b, Error: %b, Parity: Even",code, corrected_data, error);

        // Test case 2: Odd parity
        code = 7'b1010101;
        parity_type = 1; // Odd parity
        #10;
        $display("Code: %b, Corrected: %b, Error: %b, Parity: Even",code, corrected_data, error);

        // End simulation
        $finish;
    end
endmodule

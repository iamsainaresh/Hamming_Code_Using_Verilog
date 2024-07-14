`timescale 1ns / 1ps
module hamming_decode_tb();
    reg [7:1] code;
    reg parity_type;
    wire [4:1] decoded_data;
    wire error;
            
        hamming_code_decoder UUT (
        .code_in(code),
        .parity_type(parity_type),
        .data_out(decoded_data),
        .error(error)
        );

    initial begin
        // Test case 1: Even parity
        code = 7'b1011011;
        parity_type = 0; // Even parity
        #10;
        $display("Code: %b, Decoded: %b, Error: %b, Parity: Even",code, decoded_data, error);

        // Test case 2: Odd parity
        code = 7'b1010110;
        parity_type = 1; // Odd parity
        #10;
        $display("Code: %b, Decoded: %b, Error: %b, Parity: Even",code, decoded_data, error);

        // End simulation
        $finish;
    end
endmodule

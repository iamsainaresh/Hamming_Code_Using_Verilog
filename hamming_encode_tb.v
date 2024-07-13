`timescale 1ns / 1ps
module hamming_encode_tb();
    reg [4:1] data;
    reg parity_type;
    wire [7:1] code;

    hamming_code_encoder UUT (
        .data_in(data),
        .parity_type(parity_type),
        .code_out(code)
    );

    initial begin
        // Test case 1: Even parity
        data = 4'b0001;  // Takes input as D4,D3,D2,D1
        parity_type = 0; // Even parity
        #10;
        $display("Data: %b, Encoded: %b, Parity: Even", data, code);
        
        // Test case 2: Odd parity
        data = 4'b1000;
        parity_type = 1; // Odd parity
        #10;
        $display("Data: %b, Encoded: %b, Parity: Odd", data, code);



        // End simulation
        $finish;
    end
endmodule

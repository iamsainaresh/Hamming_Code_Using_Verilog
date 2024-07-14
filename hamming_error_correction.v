`timescale 1ns / 1ps
module hamming_error_correction(
    input [7:1] code_in,   // 7-bit Hamming code input
    input parity_type,     // Parity type: 0 for even, 1 for odd
    output [7:1] data_out, // 7-bit corrected data output
    output reg error       // Error flag
    );
    
     // Calculate syndrome bits
    wire s1, s2, s3;
    assign s1 = code_in[1] ^ code_in[3] ^ code_in[5] ^ code_in[7] ^ parity_type;    //p1 checks d3,d5,d7
    assign s2 = code_in[2] ^ code_in[3] ^ code_in[6] ^ code_in[7] ^ parity_type;    //p2 checks d3,d6,d7
    assign s3 = code_in[4] ^ code_in[5] ^ code_in[6] ^ code_in[7] ^ parity_type;    //p4 checks d5,d6,d7

    // Determine the error position
    wire [2:0] error_pos;
    assign error_pos = {s3, s2, s1};

    // Correct the error if there is one
    reg [7:1] corrected_code;    //taking a corrected_code register which stores the input code and change the error position
    always @(*) begin
        corrected_code = code_in;
        if (error_pos != 3'b000) begin
            corrected_code[error_pos] = ~corrected_code[error_pos];  //Inverting the error position bit in register
            error = 1; // Error detected and corrected
        end else begin
            error = 0; // No error
        end
    end
    
    assign data_out = corrected_code;   //Giving output the corrected code
  
endmodule

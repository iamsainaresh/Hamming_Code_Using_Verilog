`timescale 1ns / 1ps
module hamming_code_decoder(
    input [7:1] code_in,   // 7-bit Hamming code input
    input parity_type,     // Parity type: 0 for even, 1 for odd
    output [4:1] data_out, // 4-bit message bits data output
    output reg error       // Error flag
    );

    // Calculate syndrome bits
    wire s1, s2, s3;
    assign s1 = code_in[1] ^ code_in[3] ^ code_in[5] ^ code_in[7] ^ parity_type;     //p1 checking d3,d5,d7 and the parity type 
    assign s2 = code_in[2] ^ code_in[3] ^ code_in[6] ^ code_in[7] ^ parity_type;     //p2 checking d3,d6,d7 and the parity type 
    assign s3 = code_in[4] ^ code_in[5] ^ code_in[6] ^ code_in[7] ^ parity_type;     //p4 checking d5,d6,d7 and the parity type 

    // Determine the error position
    wire [2:0] error_pos;
    assign error_pos = {s3, s2, s1};   

    reg [7:1] corrected_code;  //taking a register corrected data to change the error positioned bit
    always @(*) begin
        corrected_code = code_in;
        if (error_pos != 3'b000) begin
            corrected_code[error_pos] = ~corrected_code[error_pos];  //inverting the error positioned bit
            error = 1; // Error detected and corrected
        end else begin
            error = 0; // No error
        end
    end

    assign data_out = {corrected_code[7], corrected_code[6], corrected_code[5], corrected_code[3]};   //1,2,4 positions are for parity bits, extracting 3,5,6,7 message data bits
    
endmodule

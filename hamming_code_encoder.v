`timescale 1ns / 1ps
module hamming_code_encoder(
    input [4:1] data_in,   // 4-bit data input
    input parity_type,     // Parity type: 0 for even, 1 for odd
    output [7:1] code_out  // 7-bit Hamming code output
    );
    
    // Calculate parity bits
    wire p1, p2, p3;
    
    // Parity bit calculations
    assign p1 = data_in[1] ^ data_in[2] ^ data_in[4] ^ parity_type;
    assign p2 = data_in[1] ^ data_in[3] ^ data_in[4] ^ parity_type;
    assign p3 = data_in[2] ^ data_in[3] ^ data_in[4] ^ parity_type;


    // Assign the Hamming code output
    assign code_out = {data_in[4], data_in[3], data_in[2], p3, data_in[1], p2, p1};

endmodule

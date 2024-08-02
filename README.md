# Hamming Code Project

This project involves the implementation of Hamming Code in Verilog. The project includes three main components: a Hamming Code Generator/Encoder, a Hamming Code Decoder, and a Hamming Code Correction module. Each component is tested using corresponding testbenches. The Parity is either or Odd/Even is defined by the input we gave (i.e., parity_type = 1 for Odd, parity_type = 0 for Even) . 


## Table of Contents

- [Hamming Code Representation](#hamming-code-representation)
- [Files in the Project](#files-in-the-project)
- [Hamming Code Generator/Encoder](#hamming-code-generatorencoder)
- [Hamming Code Decoder](#hamming-code-decoder)
- [Hamming Code Correction](#hamming-code-correction)
- [Testbenches](#testbenches)
- [How to Run](#how-to-run)
- [Contributors](#contributors)

## Hamming Code Representation

The Hamming Code uses a specific bit pattern for error detection and correction. The 7-bit Hamming Code is represented as follows:

|   Code   | H7 | H6 | H5 | H4 | H3 | H2 | H1 |
|----------|----|----|----|----|----|----|----|
| Position | D4 | D3 | D2 | P3 | D1 | P2 | P1 |
|----------|----|----|----|----|----|----|----|
| Bit      | 1  | 1  | 0  | 0  | 1  | 0  | 0  |

Where:
- **D** represents data bits.
- **P** represents parity bits.

## Files in the Project

The project consists of the following files:

### Design Files
1. `hamming_code_encoder.v` - Hamming Code Generator/Encoder
2. `hamming_code_decoder.v` - Hamming Code Decoder
3. `hamming_error_correction.v` - Hamming Code Correction

### Testbench Files
1. `hamming_encode_tb.v` - Testbench for the Encoder
2. `hamming_decode_tb.v` - Testbench for the Decoder
3. `hamming_error_correction_tb.v` - Testbench for the Correction module

## Hamming Code Generator/Encoder

The Hamming Code Generator/Encoder takes 4 message bits and outputs a 7-bit Hamming Code. It adds parity bits to the original message bits to form the Hamming Code. 
### Input
- `message_bits`: 4-bit input message

### Output
- `hamming_code`: 7-bit Hamming Code

![hamming_encoder](https://github.com/user-attachments/assets/210dd03f-400c-4770-90b1-abd7dbff36d9)

## Hamming Code Decoder

The Hamming Code Decoder takes a 7-bit Hamming Code as input and produces the corrected 4-bit message bits as output. An error falg raises when there is error, if there is no error it is in LOW state.

### Input
- `hamming_code`: 7-bit Hamming Code

### Output
- `corrected_message`: 4-bit corrected message

![hamming_decoder](https://github.com/user-attachments/assets/dc975a91-fd75-4586-8777-00f3712664dc)

## Hamming Code Correction

The Hamming Code Correction module takes a 7-bit Hamming Code with an error and rectifies the error to produce the correct 7-bit Hamming Code. It raises an error falg when there is an error in code, if not it is in LOW.

### Input
- `error_hamming_code`: 7-bit Hamming Code with an error

### Output
- `corrected_hamming_code`: 7-bit corrected Hamming Code

![hamming_error_correction](https://github.com/user-attachments/assets/3b6fb4a3-03ea-406c-9b6b-3b734b65d047)



## How to Run

To run the testbenches and verify the design, use a Verilog simulator such as ModelSim or any other preferred Verilog simulation tool. Follow these steps:

1. Compile the design files and testbench files.
2. Run the simulation for each testbench.
3. Verify the outputs against the expected results.

&nbsp;

&nbsp;
# contributors
© 2024 Sai Naresh Padakanti

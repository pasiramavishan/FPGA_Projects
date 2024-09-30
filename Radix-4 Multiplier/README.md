# Radix-4 Multiplier

## Overview

This repository contains the implementation of a radix-4 multiplier written in SystemVerilog. A radix-4 Booth's algorithm is used to optimize multiplication, reducing the number of partial products and leading to faster performance in hardware-based multipliers. This module is parameterized and can handle input bit widths defined at compile time.

## Features

- **Parameterizable Design:** The multiplier's bit width can be configured via the `N` parameter.
- **Efficient Multiplication:** Uses radix-4 Booth encoding to reduce the number of partial products.
- **Modular Design:** The multiplier interacts with an external `AdderSubtractor_Nbit` module to handle addition and subtraction operations.

## Design Details

### Main Logic

The radix-4 Booth multiplier works by encoding groups of bits from num2 and shifting the partial products of num1 accordingly. Depending on the 3-bit group of num2, specific values of num1 are added or subtracted to form the final result.

![Radix-4-booth-recoding](https://github.com/user-attachments/assets/5ed7985c-3317-47d5-88fc-2b6deaaf74e4)

### External Modules

This module uses an AdderSubtractor_Nbit submodule to handle addition and subtraction of the partial products. The result of each stage is stored and shifted as needed to accumulate the final product.


## Example Instantiation

To instantiate the `radix4` module in your SystemVerilog design, you can use the following code:

```verilog
radix4 #(.N(24)) radix4_multiplier (
    .num1(num1),        // First input number
    .num2(num2),        // Second input number
    .clk(clk),          // Clock signal
    .rstn(rstn),        // Active-low reset
    .FinalResult(FinalResult)  // Output result
);


# Radix-4 Multiplier

## Overview

This repository contains the implementation of a radix-4 multiplier written in SystemVerilog. A radix-4 Booth's algorithm is used to optimize multiplication, reducing the number of partial products and leading to faster performance in hardware-based multipliers. This module is parameterized and can handle input bit widths defined at compile time.

## Design Details

# Main Logic

The radix-4 Booth multiplier works by encoding groups of bits from num2 and shifting the partial products of num1 accordingly. Depending on the 3-bit group of num2, specific values of num1 are added or subtracted to form the final result.

![Radix-4-booth-recoding](https://github.com/user-attachments/assets/5ed7985c-3317-47d5-88fc-2b6deaaf74e4)

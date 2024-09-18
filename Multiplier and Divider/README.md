# IEEE 754 Floating-Point Multiplier (Add-Shift Method)

## Overview

This project implements a single-precision (32-bit) floating-point multiplier using the IEEE 754 standard. The multiplication algorithm follows the **add-shift method**, which is a sequential process commonly used in hardware multipliers for handling floating-point multiplication. The module takes two floating-point numbers as inputs, performs the multiplication, and outputs the product in IEEE 754 format.

## Features

- **Complies with the IEEE 754 standard** for single-precision floating-point numbers (32-bit).
- **Add-shift multiplication algorithm** for efficient hardware implementation.

## How it Works

### Input Format

The multiplier accepts two single-precision floating-point numbers (32-bit) as inputs. These numbers follow the IEEE 754 format, which consists of three main components:

1. **Sign bit (1 bit)**: Determines whether the number is positive or negative.
2. **Exponent (8 bits)**: The biased exponent, representing the magnitude of the number.
3. **Mantissa (23 bits)**: The fraction part (also called the significand) of the number, normalized to 1.x format.

### Add-Shift Multiplication Method

The add-shift method breaks down the multiplication of two numbers into a series of shifts and additions, ensuring efficient calculation in hardware. The algorithm performs the following steps:

1. **Input Extraction**: Extract the sign, exponent, and mantissa from both input numbers.
2. **Exponent Addition**: Add the exponents of the two numbers, adjusting for the IEEE 754 bias.
3. **Mantissa Multiplication**: Multiply the mantissas of the two numbers using the add-shift method, producing a 48-bit result.
4. **Normalization**: Normalize the result by adjusting the exponent and mantissa to maintain compliance with the IEEE 754 format.
5. **Sign Calculation**: Determine the sign of the result based on the signs of the input numbers.
6. **Final Rounding**: Round the mantissa to fit into the 23-bit IEEE 754 format.

Here is a block diagram of the floating-point adder-subtractor:

![Adder-Subtractor Diagram](https://github.com/pasiramavishan/myImages/blob/main/Multiplier.png)


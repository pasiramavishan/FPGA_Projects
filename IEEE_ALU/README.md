<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--     <title>IEEE 754 Floating-Point Adder-Subtractor</title> -->
</head>
<body>
    <h1>IEEE 754 Floating-Point Adder-Subtractor</h1>
    <h2>Overview</h2>
    <p>
        This project implements an IEEE 754 compliant adder-subtractor for single-precision floating-point numbers. The module handles the addition and subtraction operations as per the IEEE 754 standard, which is widely used in computing for floating-point arithmetic. It ensures accurate representation and manipulation of decimal numbers in hardware, making it suitable for various digital design applications.
    </p>  
    <h2>Features</h2>
    <ul>
        <li><strong>Supports both addition and subtraction</strong> of IEEE 754 single-precision (32-bit) floating-point numbers.</li>
        <li><strong>Normalization</strong> of results to maintain IEEE 754 compliance.</li>
    </ul>
    <h2>Prerequisites</h2>
    <p>To run or simulate the code, you need the following tools:</p>
    <ul>
        <li><strong>Verilog simulator</strong> (e.g., ModelSim, Vivado, or any other simulator supporting Verilog)</li>
        <li><strong>Makefile</strong> (Optional) for automated testing and simulation</li>
        <li><strong>Test inputs</strong> based on IEEE 754 single-precision format</li>
    </ul>
    <h2>How it Works</h2>
    <h3>Input Format</h3>
    <p>The input numbers are 32-bit IEEE 754 single-precision floating-point numbers. Each input consists of three main components:</p>
    <ol>
        <li><strong>Sign bit (1 bit)</strong>: Represents the sign of the number (0 for positive, 1 for negative).</li>
        <li><strong>Exponent (8 bits)</strong>: The biased exponent, which helps represent large and small numbers.</li>
        <li><strong>Mantissa (23 bits)</strong>: The fraction part of the number.</li>
    </ol>
    
<img src="https://github.com/pasiramavishan/myImages/blob/main/IEEE%20format.jpg" alt="Alt text" title="Optional title" width="500">
    <h3>Process Flow</h3>
    <ol>
        <li><strong>Input Extraction</strong>: The adder-subtractor extracts the sign, exponent, and mantissa from the input floating-point numbers.</li>
        <li><strong>Exponent Alignment</strong>: Aligns the exponents of both numbers for addition/subtraction by adjusting the mantissas accordingly.</li>
        <li><strong>Addition/Subtraction</strong>: Performs the operation based on the sign bits.</li>
        <li><strong>Normalization</strong>: The result is normalized to ensure it is compliant with IEEE 754 standards.</li>
        <li><strong>Rounding</strong>: The final result is rounded to fit into the 32-bit IEEE 754 format.</li>
    </ol>
    <h2>Test Cases</h2>
    <p>The testbench includes various test cases:</p>
    <ul>
        <li>Basic addition/subtraction.</li>
        <li>Addition/subtraction of very large/small numbers with decimals.</li>
    </ul>
    <h2>Future Improvements</h2>
    <ul>
        <li>Support for double-precision (64-bit) IEEE 754 numbers.</li>
        <li>Performance optimization for hardware implementation.</li>
        <li>Support for multiply-add operations.</li>
    </ul>
<img src="https://github.com/pasiramavishan/myImages/blob/main/Block%20Diagram.jpeg" alt="Alt text" title="Optional title" width="500">
</body>
</html>

<h1>Testing Timing Analysis</h1>


<img src="https://github.com/pasiramavishan/myImages/blob/main/IEEE%20adder.png" alt="Alt text" title="Optional title" width="500">


<img src="https://github.com/pasiramavishan/myImages/blob/main/IEEE%20adder%202.png" alt="Alt text" title="Optional title" width="500">


<h1>FPGA Implmentation</h1>


<div style="display: flex;">
    <img src="https://github.com/pasiramavishan/myImages/blob/main/ieee%20aadder3.jpg" alt="Image 1" style="width: 45%; margin-right: 10px;">
    <img src="https://github.com/pasiramavishan/myImages/blob/main/ieee%20adder.jpg" alt="Image 2" style="width: 45%;">
</div>

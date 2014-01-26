ECE281_Lab1
===========

Sabin's Lab 1

# Truth Table (just for fun)
![alt text](https://raw2.github.com/sabinpark/ECE281_Lab1/master/Lab%201%20Truth%20Table.PNG "Truth Table")

# Waveform Simulation
![alt text](https://raw2.github.com/sabinpark/ECE281_Lab1/master/Lab%201%20Simulation%20Results.PNG "Simulation Results")

# Immaculate Schematic!
![alt text](https://raw2.github.com/sabinpark/ECE281_Lab1/master/Lab%201%20Schematic.PNG "Schematic")

# Analysis
Fortunately, the simulated results match the truth table shown above.  The truth table shows the inputs and outputs.  By comparing the truth table with the simulation results, one may find that the two do correspond to each other.  In conclusion, a 3-bit binary number was converted into its two's complement binary number using VHDL, and successfully simulated using a testbench.

# Design Test
After successful implementation of the FPGA with the constraints file and the code file, the FPGA did properly convert the 3-bit two's complementary number according to the truth table.  The switches SW0 to SW2 were used for the 3-bit testing.  The corresponding LEDs were set as the outputs.  Each combination of the switches were tested and the FPGA displayed all the correct conversions.  All the results were doublechecked using the truth table shown above.

# 8-bit Implementation
A new vhdl file was created for the 8-bit implementation of the two's complement converter.  This time, standard_logic_vector signals were used for the input and the output (each with a size of 8).  As shown in the vhdl file, the output (X) was set equal to the not-gate input (A) with a 1 added to the least significant bit.  This was accomplished using only one line of code which allowed me to NOT the entire input, then add 1 bit after converting the bus to as UNSIGNED.  The result was recasted to standard_logic_vector.  After implementing the vhdl file with the ucf file, I was able to create a project and test out the 8-bit conversion as shown (or will be shown) in class.  

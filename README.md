ECE281_Lab1
===========

Sabin's Lab 1

# Project Demonstration (UPDATE)
Captain Silva checked the funcitonality of the 8-bit design on Monday, 27 January 2014 at apx 1036.  It works!

# Truth Table
![alt text](https://raw2.github.com/sabinpark/ECE281_Lab1/master/Lab%201%20Truth%20Table.PNG "Truth Table")

# Waveform Simulation
![alt text](https://raw2.github.com/sabinpark/ECE281_Lab1/master/Lab%201%20Simulation%20Results.PNG "Simulation Results")

# Immaculate Schematic!
![alt text](https://raw2.github.com/sabinpark/ECE281_Lab1/master/Lab%201%20Schematic.PNG "Schematic")

# Analysis
Fortunately, the simulated results match the truth table shown above.  The truth table shows the inputs and outputs.  By comparing the truth table with the simulation results, one may find that the two do correspond to each other.  In conclusion, a 3-bit binary number was converted into its two's complement binary number using VHDL, and successfully simulated using a testbench.

# Code for the 3-bit Two's Complement
The ENTITY part of the vhdl code:
There are three inputs and three outputs.
```vhdl
  Port ( A : in  STD_LOGIC;
         B : in  STD_LOGIC;
         C : in  STD_LOGIC;
         X : out  STD_LOGIC;
         Y : out  STD_LOGIC;
         Z : out  STD_LOGIC);
```

The ARCHITECTURE part of the vhdl code:
These signals are intermediary and will be used in the connection portion below.
```vhdl
  signal A_NOT, B_NOT, C_NOT, E, F, G, H, I : STD_LOGIC;
```

The CONNECTION part of the vhdl code:
First, the NOT of each of the inputs were created.  I used the derived equations for the X, Y, and Z components, and wrote the corresponding code to ultimately set the output signals.
```vhd
	-- the not's
	A_NOT <= not A;
	B_NOT <= not B;
	C_NOT <= not C;
	
	-- x component
	E <= A_NOT and C;
	F <= A_NOT and B;
	G <= A and B_NOT and C_NOT;
	X <= E or F or G;
	
	-- y component
	H <= B and C_NOT;
	I <= B_NOT and C;
	Y <= H or I;
	
	-- z component
	Z <= C;
```

# UCF implementation
I followed the directions to generate the UCF file and used the examples given from the handout.  To correct for errors, I had to comment out the examples of connecting a SLV (std_logic_vector) because these switches and LEDs were unused.  The result is shown below:
```vhd
# ==== Slide Switches (SW) ====
NET "A" LOC = "K18"; # Type = INPUT, Sch name = SW2
NET "B" LOC = "H18"; # Type = INPUT, Sch name = SW1
NET "C" LOC = "G18"; # Type = INPUT, Sch name = SW0

# LED outputs constraints
NET "X"  LOC = "K15"; # Sch name = LD0
NET "Y"  LOC = "J15"; # Sch name = LD1
NET "Z"  LOC = "J14"; # Sch name = LD2
```
The name of the inputs were set approriately to the switches and LEDs.

# Design Test
After successful implementation of the FPGA with the constraints file and the code file, the FPGA did properly convert the 3-bit two's complementary number according to the truth table.  The switches SW0 to SW2 were used for the 3-bit testing.  The corresponding LEDs were set as the outputs.  Each combination of the switches were tested and the FPGA displayed all the correct conversions.  All the results were doublechecked using the truth table shown above.

# 8-bit Schematic
![alt text](https://raw2.github.com/sabinpark/ECE281_Lab1/master/Lab%201%20Schematic%208bit.PNG "8-bit Schematic")

# 8-bit Implementation
A new vhdl file was created for the 8-bit implementation of the two's complement converter.  This time, standard_logic_vector signals were used for the input and the output (each with a size of 8).  As shown in the vhdl file, the output (X) was set equal to the not-gate input (A) with a 1 added to the least significant bit.  This was accomplished using only one line of code which allowed me to NOT the entire input, then add 1 bit after converting the bus to as UNSIGNED.  The result was recasted to standard_logic_vector.  

```vhd
X <= STD_LOGIC_VECTOR(unsigned(not A) + 1);
```

The UCF file for the 8-bit version was a bit different in that I had to call each element of the SLV separately before setting it to a swtich or an LED.  Messing around with the code, I found that the syntax for calling each element was not that hard.  I just had to call the element index using parentheses.
```vhd
NET "A(7)" LOC = "R17"; # Type = INPUT, Sch name = SW7
NET "A(6)" LOC = "N17"; # Type = INPUT, Sch name = SW6
NET "A(5)" LOC = "L13"; # Type = INPUT, Sch name = SW5
NET "A(4)" LOC = "L14"; # Type = INPUT, Sch name = SW4
NET "A(3)" LOC = "K17"; # Type = INPUT, Sch name = SW3
NET "A(2)" LOC = "K18"; # Type = INPUT, Sch name = SW2
NET "A(1)" LOC = "H18"; # Type = INPUT, Sch name = SW1
NET "A(0)" LOC = "G18"; # Type = INPUT, Sch name = SW0
```
Another important part I realized was that the MSB is represented as A(7) and the LSB is A(0).  I originally had it backwards, and thus, the results were all flipped.  After changing the code so that A(7) shows the MSB (the farthest left bit), everything worked perfectly.

After implementing the vhdl file with the ucf file, I was able to create a project and test out the 8-bit conversion successfully.  

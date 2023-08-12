# Calculator

Calculator designed to handle up to many standard ALU operations including adding, subtracting, multiplying, dividing, and shifting. Operands can be accepted as 32-bit values from -2147483648 to 2147483647 along with a similar operation range. Anywhere outside this range may result in unexpected behavior including overflow.

---

## Repository Structure
The repository is organized as follows:

- `Calculator/`: Contains calculator project and verilog for RTL.
- `Documentation/`: Holds images and visual assets related to the project.

---

## Demonstration

![alt text](Documentation/mul.gif) 

Shown above is an example of multiplication performed on the DE10-Lite. To begin, the first operand is entered followed by the enter button, then the proccess is repeated for the second operand. Lastly, the alu opcode is verified as a switch value and the multiplication result is displayed. 

---

## Features

- [Add](Documentation/add.gif)
- [Subtract](Documentation/sub.gif)
- [Multiply](Documentation/mul.gif)
- [Divide](Documentation/div.gif)
- [LSL, ASL](Documentation/left.gif)
- [LSR, ASR](Documentation/right.gif)
- [Scroll (HEX10 - HEX0)](Documentation/move.gif)

---

## License
This is published under the [MIT License](https://opensource.org/licenses/MIT).


An example C program that traces shifts and reduces of given input with GNU Bison and GNU Flex of given according to following grammar:

S -> E
E -> E + E | -E | id

> Example Output

Shift token id
Reduce stack by rule E --> id
Shift token +
Shift token -
Shift token id
Reduce stack by rule E --> id
Reduce stack by rule E --> -E
Reduce stack by rule E --> E + E
Shift token +
Shift token id
Reduce stack by rule E --> id
Reduce stack by rule E --> E + E
Reduce stack by rule S --> E
Pop S

-----------------------------------------------------

> How to disable colored output?
Set "COLOR" to "0" in "color.h".

> Make targets
1) all (default):
   Compiles program and runs it with default input.

2) release
   Creates release build

3) debug
   Genarates state transition diagram (parser.dot),
   Genarates parser states (parser.output),
   Creates debug build.

4) test
   Runs the program with default input.

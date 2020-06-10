# Brainf*ck

[Brainf*ck](https://en.wikipedia.org/wiki/Brainfuck) is an esoteric programming language where we program on a tape that is composed of cells, each cell starting out with the value `0`; we give instructions to move left/right on top of that tape, to increment and decrement the numbers in the tape and to read/write to a single cell in the tape.

The instruction set supported by brainf*ck is:

 - use `<` to move left on the tape and use `>` to move right;
 - use `+` to increment the current cell we are at and use `-` to decrement;
 - use `.` to take a single character from input, which is read as its ASCII code into the cell (e.g. reading a `'a'` puts `97` in the current cell) and use `,` to take the current cell and output it as an ASCII character (e.g. using `,` on a cell with `98` would print `'b'`);
 - use `[]` to create a "while" loop; when the program hits a `[`, it only enters the code inside it if the current cell is different from `0` and when we hit `]` we go back to the `[`.

# Example

The program `,[.,]` copies the input and outputs it back to the user... [Try it online!](https://tio.run/##SypKzMxLK03O/v9fJ1pPJ/b//8TilDQQVkgshtMK6YlFCkYmpgA)

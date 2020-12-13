[
    Program to halve an arbitrarily big integer.
    Authored by github.com/RojerGS.
]

>>>,[>,]+       Read digits sequentially and flag end of number
[<]             Skip to the beginning
                We will start halving on the most significant digit
                    and work our way to least significant digits
>>[             Loop to go over the digits, while we are pointing at a set cell
                    it is because there is some digit to the left
  <<++++++      Prepare to subtract 48 from the digit
  [>--------<-]
  +>            Leave flag
                The digit is now in decimal
  [             Decrease the number 2 by 2
   -[-<+<]
   <[>>++++++++++<<<<] Carry 10 cuz digit was odd and sync back pointer position
   >>>
  ]
  ++++++
  [<++++++++>-]
  <-.[-]
 >>>
]

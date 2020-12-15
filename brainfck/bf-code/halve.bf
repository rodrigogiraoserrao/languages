[
    Program to halve an arbitrarily big integer.
    Available at github.com/RojerGS/languages/tree/master/brainfck/bf-code/halve.bf.
]
>>>,[>,]+       Read digits sequentially and flag end of number
[<]             Skip to the beginning
                We will start halving on the most significant digit
                    and work our way to least significant digits
>>[             Loop to go over the digits while we are pointing at a set cell
                    it is because there is some digit to the left
  <             This is D plus 48
  [             Decrease the number 2 by 2
   -[-<+<]
   <[>>++++++++++<<<<] Carry 10 because digit was odd and sync back pointer position
   >>>
  ]             On the left we have D//2 plus 24
  +++
  [<++++++++>-] Adding an extra 24 converts to ASCII
  <.[-]
 >>>
]
<-              Check if the number was odd
[               This cell was 10 because there was carry from odd units digit
 -[>+++++<-]    
 >+.+++++++.>
]

[
    Authored by github.com/RojerGS,
        this program sums two arbitrarily big integers.
    Reads the first one, then a newline, then the second one and then EOF.
    The memory layout will be 0 0 0 A B A B A B ...
        where A and B refer to the digits of the number we want to sum.
    Uses ideas from brainfuck.org/fib_explained.b and improves upon
        https://github.com/RojerGS/languages/blob/master/brainfck/bf-code/sum-bigints.bf
    Runs below 380 instructions per output character
        when the input numbers have the same size
        and below 423 when the numbers have different sizes.
        (Make it faster by writing explicitly the leading zeroes.)
]

>>>,
[
 ----------         Subtract 10 to check if this is a newline character
 [                  If it is not
  >++++++           Convert it to its decimal plus 1
  [<------>-]       Subtract 36
  <-                And subtract 1 for a total of minus 47
  >>,<              Then we read the next digit and go to a 0
 ]                  Done reading next digit
 >                  Point to the next digit
]                   Done reading digits of A
                    At this point we are immediately to the right
                        of the position where we read the newline
                        character that is now a 0 cell
                    Traverse back to the beginning of the tape
<<<                 Go back to last digit of A
[<<]                Skip all the digits we read
                    At this point the tape is (0) 0 A 0 A 0 A etc
                    We read the digits of B in a similar fashion
>>>,                Read the first digit of B
[                   Keep reading digits while EOF is not reached
 >>++++++++         Subtract 48 from it
 [<<------>>- ]
 <<+>>,             Add one to store B in decimal plus one and
                        read the next digit for processing
]              
                    Both numbers have been read and they are currently
                        left aligned at the beginning of the tape
                    We will now align them to the right; this is
                        the same as aligning them by their least
                        significant digit
                    We are at the first B position that is empty
                    If there is an A digit on my left then I should
                        push B's digit to the right
<[                  Loop while there is an A digit to the left of
                        the first empty B position
  <
  [                 Loop while we are on top of a B digit
   [>>+<<-]         Copy this digit to the right
   <<               Go straight for the next B position
  ]                 Done pushing all digits of B to the right
                    At this point the memory layout is 0 (0) A 0 A B etc
  >>+[>>]           Find the first B position after the digits of B
                    We add 1 to the empty B position because the most
                        significant digit of B is 0 and the digits are
                        being stored in decimal plus 1
  <                 Point to the A position on the left so that the loop
                        resets if needed to push B to the right again
]                   Loop done and B was pushed to the right if needed
                    At this point we are in an empty A position
                        but we might be far away from the last digit
                        of A if B is much longer than A
<[<<]>[>>]          Use B to go all the way left and use A to come
                        all the way right again
                    We are at the first empty A position
                    If there is a B digit to the right of this position
                        then we need to push A to the right
>[                  Loop while there is a B digit to the right of
                        the first empty A position
  <<<               This is very similar to the loop above
  [                     we only have to be careful with the directions
   [>>+<<-]             in which we search for the next cells at the
   <<                   beginning and end
  ]
  >>+[>>]
  >
]
                    At this point we are on top of the first empty
                        B position and the numbers are lined up
                    We can now sum the numbers
<<                  Get on top of the least significant B
[                   Loop while there is a pair of digits to be summed
 [<+>-]             Add A and B in the position for A and now subtract
                        the extra 2 that we had; only problem is that
                        if we are here because the two most significant
                        digits had a carry then A plus B is just 1
                        instead of 2 or more
 +<-                Use an ifelse to distinguish the cases
 [->-]                  If we entered this then A plus B is 2 or more
 >                  Remove the other extra 1 and clean the else clause
 [-<+>>]            If we entered this then A plus B was exactly 1
 <<
                    Now we are on top of the REAL value of A plus B
 [>+<-[>+<-[>+<-    Start moving the sum to the position of B and check
 [>+<-[>+<-[>+<-        if the sum is larger than 10 because in that
 [>+<-[>+<-[>+<-        case we need to carry a digit
 [                  A plus B is AT LEAST 10
  -<+               Carry a digit to the next B to be processed
  >>[-]             Zero out the digit we were going to print
  <[>+<-]           Copy whatever is left
 ]
 ]]]]]]]]]          Memory layout is
                        0 0 0 etc (0) D 0 prevD etc
                        where D is the decimal digit to be printed
 ++++++++           Add 48 to D
 [>++++++<-]<           and put cursor on next B
]
>>[.>>]             Print everything

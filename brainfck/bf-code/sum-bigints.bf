[
    Authored by github.com/RojerGS,
        this program sums two arbitrarily big integers.
    Reads the first one, then a newline, then the second one and then EOF.
    Memory layout will be 0 0 0 0 0 0 A B TA TB A B TA TB ...
    The A and B cells will store digits of the numbers A and B.
    The TA and TB cells tell us how far the number goes, because
    a digit might be 0, in which case the corresponding A/B cell
    ends up with the value 0, and thus cannot be used to check
    for the presence of a digit.
    The two zeroes on the left are the landing cells for when
    we are at the end of some number A/B and use the consecutive TA/TBs
    to come back to the beginning.
    Uses ideas seen in brainfuck.org/fib_explained.b.
    This program performs below 425 instructions per character of output
        when the numbers are approximately of the same size
        and below 585 when the numbers have different input sizes.
        (Make it faster by writing explicitly the leading zeroes.)
]


>>>>>>,
[ go over each digit of A
 ----------
 [ the digit is different from 10 (newline ASCII code)
  >++++++
  [<------>-] remove an extra 36 from the digit
  <--         and minus 2 for a total of subtracting 48 from the digit
              to convert from ASCII to decimal
  >>+         flag TA to mark relevant digit
  >>,         read next digit of A
  <           go to a 0 to exit the if
 ]
 Memory layout here is either all zeroes or DA 0 1 (0) A
 Where DA is the digit from A we just converted to decimal
 > put cursor on potential next digit
]
<<<[<<<<]     use the TAs to go to LA
>>>,          read first B
[ go over each digit of B
 >>++++++
 [<<-------->>-] subtract 48
 + flag TB to mark relevant digit
 >>,
]

Now check if A is longer than B
At this point the pointer is at an empty B
so if the TA immediately to the right is set to 1
then A is longer than B
>
[ while A ends to the right of B
 <<< jump to first TB
 now we will move B one position to the right
 [ while we are at a TB
  <<[>>>>+<<<<-]
  >>>>>>+ set the TB to the right of the copied digit
  <<<<<<<< look for the next TB
 ]
 We are at the left of the tape
 Now we have to trace all the way back to the right end of B
 >>>>[>>>>]
 This is the first TB position that is not 1 because B is not that big
 < point to the neighbour TA to check if A is this big again
]

Now we are at a TA that is 0 meaning A did not expand this far
However we might be far from A if B is much longer
We use B to go to LB and from there find the end of A
<<<[<<<<] reach LB
>>>[>>>>]
Now we are at the first empty TA
If the TB to the right is 1 then B is larger than A and we push A to the right
>[               while B ends to the right of A
 <<<<<           jump to first TA
 [               while we are at a TA
  <<[>>>>+<<<<-] copy A
  >>>>>>+        set TA to the right of the copied digit
  <<<<<<<<       go to next TA
 ]
 >>>>[>>>>]
 We arrived at the first TA position that is empty
 This means A is not this long
 We check if B is this long and keep pushing A if needed
 >
]
This is an empty TB and the numbers are aligned
We can start summing them now
<<<<
[                while we are at a TB
                 set TA to A plus B
 <[-]            clean TA
 <[>+<-]         copy B to TA
 <[>>+<<-]       add A to TA
 >>              prepare to move TA back to B
                 check if B is larger than 9 to carry
 [<+>-[<+>-[<+>-[<+>-[<+>-[<+>-[<+>-[<+>-[<+>-
 [               if we enter this then TA is 10 or more
  <<<<<+         in this case we need to carry one into the next B
  >>+>>          when coming back we ensure the TB is set
                 just in case this was THE MOST significant digit of the sum
  [-]            erase the current value in B to reset the units digit
  >-[<+>-]       copy the remaining value of TA to B
 ]
 ]]]]]]]]]
 ++++++          set TA to 6 and add 48 to B to display later
 [<++++++++>-]
 <<<             Go to next TB
]
>>[.>>>>]        Display result

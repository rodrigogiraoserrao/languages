# **Brainetry**

**Brainetry** is an [esoteric programming language][eso-pl] inspired in [brainf*ck][brainfuck] and [Poetic][poetic]. Its name is a (bad) play on "brainf*ck" and "poetry".

# Coding in **Brainetry**

In **Brainetry** each line of the source code either corresponds to a brainf*ck operator or it does nothing, and the mapping is done based on the number of words each line has:

| Words in a line | brainf*ck operator |
|-----------------|--------------------|
| 2 | `>` |
| 3 | `<` |
| 4 | `+` |
| 5 | `-` |
| 6 | `,` |
| 7 | `.` |
| 8 | `[` |
| 9 | `]` |

For **Brainetry**, a "word" is any sequence of non-space characters, so the line `"   thisis 1 really       weirdly formatted    line "` counts as having `6` words.

If you don't know how to code in brainf*ck you will have a hard time coding in **Brainetry**.

# Implementation

The implementation - in Python - can be found in the `brainetry.py` file; notice that the Python style used in that file was a proof of concept for something unrelated to this project and thus may strike as weird Python code.

The implementation can be restyled into:

```py
def I(l, i, p=0, m=[0]):
    while l:
        n, *l = l
        if n in [2, 3]:
            p += 1 - [2, 0, 3].index(n)
            m = [0]*(p<0) + m + [0]*(p==len(m))
            p = max(0, p)
        elif n in [4, 5]:
            pp = p%len(m)
            m[pp] += 1 - [4, 0, 5].index(n)
            m[pp] %= 256
        elif 6 == n:
            if not i:
                i = "\u0000"
            c, *i = i
            m[p%len(m)] = ord(c)
        elif 7 == n:
            print(chr(m[p%len(m)]), end="")
        elif 8 == n:
            t = 1
            g = [t := t + (k==8) - (k==9) for k in l].index(0)
            while m[p%len(m)]:
                i, p, m = I(l[:g], i, p, m)
            l = l[g:]
    return i, p, m

def E(c):
    l = [*filter(
        bool,
        [len(l.split(" "))for l in c.split("\n")]
    )]
    I(l, input(" inp >> "))
    print()
```

# Examples

The examples that follow have the corresponding source code in the `btry` directory and you can test a given `file` with `cli.py file`.

## CAT program

This program in `btry\cat.btry` takes input and outputs it to the user.

```
This program you are currently reading
has the particularity of explaining itself. In fact,
this program has one simple mission :
Take some input provided by you
and throw it right back at your face !!!
```

## Hello, World!

This program in `btry\hello_world.btry` outputs the string `"Hello, World"` to the user.

```
This is a "short"
brainetry program that outputs, to stdout, the message
"Hello, World!" as per the
programming world standard. This standard
dictates that
a user that is trying
a language for the first time should write
as its
first program
this "Hello, World!" program.
Of course,
this becomes a repetitive task,
this becomes a repetitive task,
this becomes a repetitive task,
this becomes a repetitive task,
this becomes a repetitive task,
but that shouldn't
hinder you from
tackling this awesome challenge in the Brainetry programming language.

Me, myself and
I have found this language
to be quite amusing if
used to write
self-referential programs like this one.

Self-referential objects are objects that
I, personally, really enjoy. This
might be because I am just a weird person.

Or not!
Who knows? Certainly not me.

Dear reader, please rest assured that we
are ALMOST
at the
MIDDLE of
this self referential program.
Also, please refraing from adding the hyphen
between self
and referential
in the line above, as it is
NOT a typo, it is missing purposefully.

A very important skill
needed to write Brainetry
programs is one's imagination.
This is because each instruction needs one line
of Brainetry source code on its own.
Sounds easy?
I can assure you, it definitely is not easy.

I'm growing tired,
I'm growing unimaginative,
I'm growing old,
I'm writing code.

Oh boy, I wish that would've rhymed!

Even though I can't
really rhyme in English
because I am unskilled,
I can tell you that this is
exhibiting signs of schizophrenia, right?
At this point I am
pretty much talking to myself,
and no one is listening,
right? No one is listening,
right? I definitely hope not.

Now on to some decent source code,
this program works
by harnessing the
well known power of modular
arithmetic, a really nice thing mathematics has
bestowed upon
us, mortals.
This is,
for real,
a really awesome gift
from the mathematicians of yor to us.
```


[eso-pl]: https://en.wikipedia.org/wiki/Esoteric_programming_language
[brainfuck]: https://esolangs.org/wiki/Brainfuck
[poetic]: https://mcaweb.matc.edu/winslojr/vicom128/final/

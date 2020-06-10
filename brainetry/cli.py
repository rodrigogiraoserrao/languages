import argparse

from brainetry import E
from lorem import lorem

def btry2bf(code):
    """Translate a brainetry program to brainfuck."""

    result = ""
    for line in code.split("\n"):
        n = len([*filter(bool, line.split(" "))])
        if n < 2 or n > 9:
            continue
        result += "  ><+-,.[]"[n]
    return result

def bf2btry(code):
    """Translate a brainfuck program to brainetry."""

    while "\n" in lorem:
        lorem = lorem.replace("\n", "")
    lorem = lorem.split(" ")

    result = ""
    source = lorem[::]
    ops = "><+-,.[]"
    ops_is = []
    for c in code:
        if c == "\n":
            result += c
        if c in ops:
            i = ops.index(c) + 2
            ops_is.append(i)
            if i > len(source):
                source += lorem[::]
            new = " ".join(source[:i])
            source = source[i:]
            result += new + "\n"

    return ops_is, result


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("file", help="read Braintry code from the given file")

    group = parser.add_mutually_exclusive_group()
    group.add_argument(
        "--btry2bf", action="store_true", default=False,
        help="translate brainetry to brainfuck"
    )
    group.add_argument(
        "--bf2btry", action="store_true", default=False,
        help="translate brainfuck to brainetry"
    )

    args = parser.parse_args()
    if args.file:
        with open(args.file, "r") as f:
            inp = f.read()

        if args.btry2bf:
            print(btry2bf(inp))

        else:
            E(inp)

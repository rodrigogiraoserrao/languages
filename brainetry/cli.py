import argparse

from brainetry import E

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

    from lorem import lorem

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

    parser.add_argument(
        "-o", "--output", metavar="output-to",
        help="path to file to write output to; use with --bf2btry or --btry2bf"
    )

    args = parser.parse_args()
    if args.file:
        with open(args.file, "r") as f:
            inp = f.read()

        if args.btry2bf:
            r = btry2bf(inp)
        elif args.bf2btry:
            ops, r = bf2btry(inp)
            print(ops)
            print(r)
        else:
            E(inp)
            r = ""

        if (outfile := args.output) and r:
            with open(outfile, "w") as f:
                f.write(r)

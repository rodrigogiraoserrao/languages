import argparse
from pylex256 import E, U

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    group = parser.add_mutually_exclusive_group()
    group.add_argument(
        "-i", "--interpret", type=int, metavar="INT",
        help="Interpret the given pylex256 program"
    )
    group.add_argument(
        "-u", type=str, metavar="PYCODE",
        help="Convert a Python program to pylex256"
    )
    group.add_argument(
        "-f", type=str, metavar="FILENAME",
        help="Convert a Python program from the given file"
    )

    args = parser.parse_args()
    if args.interpret:
        E(args.interpret)
    elif args.u:
        print(U(args.u))
    elif args.f:
        with open(args.f, "r") as f:
            code = f.read()
        print(U(code))

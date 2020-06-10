# pylex256

A useless programming language!

In **pylex256** a program is a single integer. This integer `n` is taken and we execute, as Python code, the `n`th lexicographic permutation of the 256 ASCII characters.

We start counting with `0` and so `0` in **pylex256** is the empty program.

# Usage

`pylex256.py` expects an integer as input, which is then interpreted as a **pylex256** program. The easiest way to program in **pylex256** is to write the equivalent Python code and then use `cli.py -u code` to translate it into **pylex256** code. Alternatively, the equivalent Python code can be saved in a text file with name `filename` and then the CLI tool can be used as `cli.py -f filename`.

# Examples

## Empty program

```
0
```

This **pylex256** program is the empty program and does nothing.

## Hello world

```
42071388039438968423485210789681210583404748447229738
```

This **pylex256** program prints `"Hello, world!"` and then terminates.

## Add two input numbers

```
4029638410529927757338605595777429537093819042437057966920903925696619841326524894216998785372854124357930
```

This **pylex256** program asks for two integers as input and prints the result of adding them together.

## Self-interpreter

```
8975757455764534910130624149747374532847246689368414813142050974074799199472743233659499343507903574941592733599119304015896536768456982899712514839757539364488663323803434009789033438571542239634391268318630441169936728698654780016431181304131937652632146529350457910538333864493248093073610213239302756243616800273452060030634597866876575167500063475377840921302523525777284779224214492607490315
```

This **pylex256** takes a **pylex256** program as input and then interprets it.

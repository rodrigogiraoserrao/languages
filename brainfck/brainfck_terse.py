def I(l, i, p=0, m=[0]):
    while l:
        n, *l = l
        if n in "><":
            p += 1 - "> <".index(n)
            m = [0]*(p<0) + m + [0]*(p==len(m))
            p = max(0, p)
        elif n in "+-":
            m[p] += 1 - "+ -".index(n)
            m[p] %= 256
        elif "," == n:
            if not i:
                i = "\u0000"
            c, *i = i
            m[p] = ord(c)
        elif "." == n:
            print(chr(m[p]), end="")
        elif "[" == n:
            g = 0
            t = 1
            aux = [t := t + (k=="[") - (k=="]") for k in l]
            g = aux.index(0)
            while m[p]:
                i, p, m = I(l[:g], i, p, m)
            l = l[g:]
    return i, p, m

if __name__ == "__main__":
    state = I(input(" bf code >> "), input(" program input >> "))
    print()
    print(state)

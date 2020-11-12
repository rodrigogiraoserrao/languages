from sys import*;from io import*;M=256;V=argv;V.extend([""]*2);stdin=StringIO(V[2])if V[2]else stdin
def I(b,t=[0],p=0):
 while b: # interpret while there's code
  c,*b=b;c="+-><,.[]".find(c) # get next op
  if c in[0,1]:t[p]+=1-2*c;t[p]%=M # increase memory cell and wrap at 256
  if c in[2,3]:p+=5-2*c;t=[0]*(p<0)+t+[0]*(p==len(t));p=max(p,0) # move pointer and adjust tape
  if c==4:i=stdin.read(1)or"\u0000";t[p]=ord(i)%M # read one char as numeric input
  if c==5:stdout.write(chr(t[p])) # print one char as output
  if c==6:
   d=1;j=[d:=d+(x=="[")-(x=="]")for x in b].index(0);b,b_=b[j+1:],b[:j]
   while t[p]:_,t,p=I(b_,t,p) # loop while memory cell is non-zero
 return b,t,p
b,t,p=I(argv[1]);print();print(t,p) # interpret and print debugging info

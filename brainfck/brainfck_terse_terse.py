import sys;C="+-><,.[]";M=256;sys.argv.extend([""]*2) # useful constants and default arguments
def I(b,i="",t=[0],p=0,o=""):
 while b: # interpret while there's code
  c,*b=b;c=C.find(c) # get next op
  if c in[0,1]:t[p]+=1-2*c;t[p]%=M # increase memory cell and wrap at 256
  if c in[2,3]:p+=5-2*c;t=[0]*(p<0)+t+[0]*(p==len(t));p=max(p,0) # move pointer and adjust tape
  if c==4:t[p]=ord(i[0])%M if i else 0; i=i[1:]if i else "" # read one char as numeric input
  if c==5:o+=chr(t[p]) # print one char as output
  if c==6:
   d=1;j=[d:=d+(x=="[")-(x=="]")for x in b].index(0);b,b_=b[j+1:],b[:j]
   while t[p]:_,i,t,p,o=I(b_,i,t,p,o) # loop while memory cell is non-zero
 return b,i,t,p,o
b,i,t,p,o=I(sys.argv[1],sys.argv[2]);print(b,i,t,p,o)or print(o) # interpret and print

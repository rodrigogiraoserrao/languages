def E(i,s=""):
 i=i-(i>0)
 while i:i,c=divmod(i,256);s=chr(c)+s
 exec(s)
def U(s,i=0):[i:=i*256+ord(c)for c in s];return i+1
if __name__=="__main__":E(int(input()))

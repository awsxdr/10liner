1 SCREEN1:KEYOFF:COLOR15,5,15:I=RND(-TIME):DIMp$(2),u(2),v(2),w(2):FORI=1to2:u(i)=INT(RND(1)*400):v(i)=10:NEXTI:z=160
2 h=-1:X=100:F=180:FORJ=0TO1:READA$:FORK=1TO8:VPOKE(&H28+J)*8+K-1,ASC(MID$(a$,((K+I)MOD8)+1,1)):NEXTK:NEXTJ:READA$,B$
3 SPRITE$(20)=A$:FORJ=0TO1:SPRITE$(30+J)=B$:NEXTJ:READp$(1),p$(2):FORI=0TO24:PRINT"�����("+SPACE$(15)+")�����":NEXTI
4 C=200:D=400:I=I+1:SPRITE$(21)=p$((IMOD2)+1):EM=(n\5)*0.25+1:PUTSPRITE20,(X,z),12:FORJ=1TO2:
5 q=ABS(((u(J)+v(J)*EM)MODD)-C)+20:IFq<gANDg<q+8ANDv(j)-8<hANDh<v(j)+8THENh=-10:v(j)=-10:n=n+1:ELSEIFv(j)>FTHEN9
6 PUTSPRITE30+J-1,(q,v(J)),8:v(J)=v(J)+EM:NEXTJ:PUTSPRITE21,(g,h),3:s=ABS(STICK(0)+STRIG(0)):IFH>=0THENH=H-10
7 IFs=6THENX=X-2:h=z:g=X:ELSEIFs>5THENx=x-4ELSEIFs=2THENx=x+2:h=z:g=X:ELSEIFs>1THENx=x+4ELSEIFs=1THENh=Z:g=X
8 X=((X+180)MOD 200)+20:LOCATE15,0:PRINT"SCORE: "+STR$(n)+"000":GOTO4
9 LOCATE10,10:PRINT"GAME OVER!":COLOR15,9,15:GOTO9:DATA �t���а�,W��__/7W,$$<~~��f,�����~~$,�@�@�@�@,��@�@�@�
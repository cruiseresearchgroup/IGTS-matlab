function[GT_TT,Integ_TS] =GetTS_Syn(m,k)
n=420;
Integ_TS(m,n)=0;

%GT_TT=sort(10*randi(n/10-1,1,k));
%GT_TT=(n+30)/(k+1):n/(k+1):n-1;
GT_TT=40*randperm(ceil(n/40)-1,k);
GT_TT(k+1)=n;GT_TT=[1 GT_TT];
GT_TT=sort(floor(GT_TT));

Lval=0;

for i=1:k+1
    
    for l=1:m   
        val=randi(6);
        if (Lval==val)
            val=val+2;
        end
        for j=GT_TT(i):GT_TT(i+1)
            Integ_TS(l,j)=val;
        end    
        Lval=val;
    end
    
end
Integ_TS=Integ_TS./2;
for i=1:m
    Integ_TS(i,:) = awgn(Integ_TS(i,:),0.1);
end
GT_TT(1)=[];


    


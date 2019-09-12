function[TT,maxIG]=FullSearch(Integ_TS,k)
[Nu_TS,Le_TS]=size(Integ_TS);

Integ_TS=Clean_TS(Integ_TS,1);

step=1;
for i=1:k
    pos_TT(i)=step*i;
end
pos_TT(k+1)=Le_TS;

tu=1;maxIG=0.0;
while(tu)
    IG=IG_Cal(Integ_TS,pos_TT,k);
    if(IG>maxIG)
        TT=pos_TT;
        maxIG=IG;
    end
     
    tu=0;
    for i=k:-1:1
       if(pos_TT(i)+step<pos_TT(i+1)) 
           pos_TT(i)=pos_TT(i)+step;
           for j=i+1:k
               pos_TT(j)=pos_TT(j-1)+step;
           end
           tu=1;
           
           break;
       end
    end
end

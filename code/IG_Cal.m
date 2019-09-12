function[IG]=IG_Cal(Integ_TS,pos_TT1,k)
[Nu_TS,Le_TS]=size(Integ_TS);
pos_TT=sort(pos_TT1);
for i=1:Nu_TS
    TS_dist(i)=Integ_TS(i,Le_TS);
end
IG=Sh_Entropy(TS_dist);
last_id=1;

for i=1:k+1
    for j=1:Nu_TS
        TS_dist(j)=Integ_TS(j,pos_TT(i))-Integ_TS(j,last_id);
    end

    IG=IG-((pos_TT(i)-last_id)/Le_TS)*Sh_Entropy(TS_dist);
    
    last_id=pos_TT(i);
end
IG=IG;

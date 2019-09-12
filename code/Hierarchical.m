function[TT,maxIG]=Hierarchical(Integ_TS,k,step,double)
Integ_TS=Clean_TS(Integ_TS,double);
[Nu_TS,Le_TS]=size(Integ_TS);

maxIG(k)=0.0;
for i=1:k
   for j=1:step:Le_TS
      pos_TT(i+1)=Le_TS; 
      pos_TT(i)=j;  
      IG=IG_Cal(Integ_TS,pos_TT,i);
      if(IG>maxIG(i))
        TT=pos_TT;
        maxIG(i)=IG;
      end
   end
   pos_TT=TT; 
   %k1=nnz(pos_TT>pos_TT(i));
   %k2=nnz(pos_TT<pos_TT(i));
   %for j=1:Nu_TS
   %   S1(j)=Integ_TS(j,pos_TT(i));
   %   S2(j)=Integ_TS(j,Le_TS)-Integ_TS(j,pos_TT(i));
   %   S(j)=Integ_TS(j,Le_TS);
   %end
   %if i>1 MDLP(i)=maxIG(i)-maxIG(i-1)-(1/Le_TS)*((log2(Le_TS-1))+log2(3^4-2)-4*Sh_Entropy(S)+4*Sh_Entropy(S1)+4*Sh_Entropy(S2));end
   %MDLP(i)=(Sh_Entropy(S)-((pos_TT(i))/Le_TS)*Sh_Entropy(S1)-((Le_TS-pos_TT(i))/Le_TS)*Sh_Entropy(S2))-(1/Le_TS)*((log2(Le_TS-1))+log2(3^i-2)-i*Sh_Entropy(S)+(k1+1)*Sh_Entropy(S1)+(k2+1)*Sh_Entropy(S2));
   
   %MDLP(i)=maxIG(i)-(1/Le_TS)*((log2(Le_TS-1))+log2(3^i-2)-4*Sh_Entropy(S)+4*Sh_Entropy(S1)+4*Sh_Entropy(S2));
   %i=i;
   i; 
end
TT(k+1)=[];


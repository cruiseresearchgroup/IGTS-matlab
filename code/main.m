clearvars -except Result*
%--------------variables---------------
%k=number of transition times (change points)
%step=resuution of the output, higher value-> more accurate but costly
%GT_TT= Grong truth for transition times (change points) locations
%Integ_TS = m time series with lengh of n, [m, n]=size(Integ_TS);
%kk= detected transition times
%IG_K=Information gain of each step used for finding the best k
step=1;k=2;

%---------------Input----------------------------------
[GT_TT,Integ_TS]=GetTS_Syn(3,k);GT_TT(k+1)=[]%sytethic dataset
%[GT_TT,Integ_TS]=GetTS_HAR(36978,39666);GT_TT%Human Activity recognition dataset
%global stopid;global
%startid;istart=7.9;istop=10.8;[GT_TT,Integ_TS]=GetTS_iBeacon(istart,istop);GT_TT(floor(istart)+1:floor(istop))%ibeacon dataset

%-------save to csv file---------------
%csvwrite('out.csv',Integ_TS')
%csvwrite('TT-out.csv',GT_TT)

%----------Search Algorithm---------------------------
methodid=3;
tic
switch methodid
   case 1%full search (minimizing variance)
        TT=FullSearch(Integ_TS,k);TT(k+1)=[];        
    case 2%ksegmentation (minimizing variance)
        [TT,maxVAR]=ksegmentation(Integ_TS,k,step);
    case 3 %Normalized doubled IGTS, TopDown (proposed method)
        [TT,IG_k]=Hierarchical(Integ_TS,k,step,1);
    case 4%Normalize IGTS, TopDown 
        [TT,IG_k]=Hierarchical(Integ_TS,k,step,0);
    case 5%simple Ig-base,Not normalized, not doubled 
        [TT,IG_k]=Hierarchical(Integ_TS,k,step,2);
    case 6%Normalized doubled IGTS, Dynamic Programming (proposed method)
        [TT,maxVAR]=DP_IG(Integ_TS,k,step,1);       
end
toc

%---------------Output--------------------------------
TT=sort(TT);
bestk=best_k(IG_k)


%---Syn----
%(TT-GT_TT)/420


%---------evaluation-------------
%if(methodid==2)Result2=[Result2 sqrt(mean(re.*re))];end
%if(methodid==3)Result3=[Result3 sqrt(mean(re.*re))];end
%if(methodid==4)Result4=[Result4 sqrt(mean(re.*re))];end
%if(methodid==5)Result5=[Result5 sqrt(mean(re.*re))];end

%-----------Bestk--
%bestk1=best_k(IG_k,1)
%bestk2=best_k(IG_k,2);
%bestk3=best_k(IG_k,3);
%Resultk1(k,bestk1)=Resultk1(k,bestk1)+1;
%Resultk2(k,bestk2)=Resultk2(k,bestk2)+1;
%Resultk3(k,bestk3)=Resultk3(k,bestk3)+1;



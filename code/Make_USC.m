l=0;Integ_TS=[];TT=[];
for i=1:14  %14 subjects
    for j=1:12  %12 activity
        for k=1:5   %5 trial
                load(strcat('H:\Work\Datasets-competition\uci\USC-HAD\USC-HAD\','Subject',int2str(i),'\','a',int2str(j),'t',int2str(k),'.mat'))
                %load(strcat('C:\Users\Mahsa\Downloads\USC-HAD\','Subject',int2str(i),'\','a',int2str(j),'t',int2str(k),'.mat'))
                l=l+1;
                Integ_TS=[Integ_TS;sensor_readings];
                TT=[TT, length(Integ_TS)];                
        end
    end
end
TT(l)=[];


for i=1:6
 
    Integ_TS(:,i+6)=movingvar(Integ_TS(:,i),101);
end
Integ_TS=Integ_TS';

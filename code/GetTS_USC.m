function[GT_TT, Integ_TS] =GetTS_USC(files)
S=0;Integ_TS=[];
for i=1:length(files)
    a(i) = load(strcat('H:\Work\Datasets-competition\uci\USC-HAD\USC-HAD\Subject9\',files{i}));
    S=S+length(a(i).sensor_readings);
    GT_TT(i)=S;
    Integ_TS=[Integ_TS;a(i).sensor_readings];
end
Integ_TS=[Integ_TS]';
%Integ_TS=Integ_TS.*Integ_TS;
GT_TT(length(files))=[];





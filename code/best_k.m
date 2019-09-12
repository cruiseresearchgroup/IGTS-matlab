function[bestk] =best_k(IG_k)
mode=1;
total_k=length(IG_k);
if mode==1
    for i=2:total_k-1
        IG_1(i)= (IG_k(i)-IG_k(i-1))/(IG_k(i+1)-IG_k(i));
    end
        [M,bestk]=max(IG_1);
end
    
if mode==2
    for i=2:total_k-1
        IG_2(i)= (IG_k(i)/IG_k(i-1))-(IG_k(i+1)/IG_k(i));
    end
    [M,bestk]=max(IG_2);
end

if mode==3
    for i=2:total_k-1
        IG_1(i)= (total_k-i)*(IG_k(i)-IG_k(i-1))/(IG_k(total_k)-IG_k(i));
    end
        [M,bestk]=max(IG_1);
end

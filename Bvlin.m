function B=Bvlin(v)
[x,y]=size(v);

if x~=1
    'enter a 1X n matrix please'
    return
end

for i=1:y
    B(i)=2*1.2*(v(1,i));%dB/dv(B(v))@v=0=2*1.2*v  
end

return
function y=Bvanal(x)
[A,B]=size(x);

if A~=1
    'enter a 1X n matrix please'
    return
end

for i=1:B
    y(i)=1.2*abs(x(1,i))*x(1,i);  
end

return
function y=Fxlin(x)
[A,B]=size(x);
if A~=1
    'enter a 1X n matrix please'
    return
end
for i=1:B
y(i)=.5*x(1,i);
end
return
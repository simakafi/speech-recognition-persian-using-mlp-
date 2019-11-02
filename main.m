function[]=main()

close all
clear all
clc

%Call network creating functions
Bnet=NNdamper();
Snet=NNspring();
close all

%Time
timestep=.1;
t=0:timestep:5;
st=size(t,2);
%Choice of Forcing Function

F=2*sin(2*t).*exp(-t/2);

for i=floor(st/2):st
F(1,i)=0;
end

%F=zeros(size(t));
%plot(t,F)

%size init.
pos=zeros(size(t));
vel=pos;
B=pos;
K=pos;
D=pos;

pdot_real=pos;
p_real=pos;
pos_real=pos;
vel_real=pos;
p=pos;
pdot=pos;


%I.C's!
pos(1)=0;%redundant but clear, ok?redundant but clear, ok?
vel(1)=0;
pos_real(1)=pos(1);
vel_real(1)=vel(1);

mass=5;%tons!
p(1)=vel(1)*mass;
p_real=p(1);

K0=sim(Snet,0);% In order to cancel(reduce) steady state error due to neural nets.
B0=sim(Bnet,0);

for i=1:size(t,2)-1;
    
    D(i)=Dtanal(i);
    % D(i)=0;
    
    K(i)=sim(Snet,pos(i));
    B(i)=sim(Bnet,vel(i));
    
    pdot(i+1)=F(1,i)+D(i)-K(i)-B(i)+K0+B0;
    
    %Momentum integrator
    
    p(i+1)=p(i)+pdot(i+1)*timestep;
    
    vel(i+1)=p(i)/mass;
    
    %Vel integrator
    
    pos(i+1)=pos(i)+vel(i+1)*timestep;
    
    
end


%Real solution
for i=1:size(t,2)-1;
    
    pdot_real(i+1)=F(1,i)+D(i)-Fxanal(pos_real(i))-Bvanal(vel_real(i));
    
    %Momentum integrator
    
    p_real(i+1)=p_real(i)+pdot_real(i+1)*timestep;
    
    vel_real(i+1)=p_real(i)/mass;
    
    %Vel integrator
    pos_real(i+1)=pos_real(i)+vel_real(i+1)*timestep;
    
    
end

%-------------------------------------------------
figure(2)

subplot(3,1,3);

plot(t,pdot/mass,'+',t,pdot_real/mass);
legend('ketab1','ketab1 real');

subplot(3,1,2);

plot(t,vel,'+',t,vel_real);
legend('ketab2','ketab2 real');

subplot(3,1,1);
plot(t,pos,'+',t,pos_real);
legend('ketab3','ketab4 real');



%-------------------------------------------------
figure(3)

subplot(4,1,1);
plot(t,K,'+',t,Fxanal(pos));
legend('ketab1','test');

subplot(4,1,2);
plot(t,B,t,Bvanal(vel));
legend('ketab2','test')

subplot(4,1,3);
plot(t,p,t,p_real);
legend('ketab3','test')

subplot(4,1,4);
plot(t,pdot,'+',t,pdot_real);
title('amini-NN');
legend('ketab4','test');

figure(4)
a=linspace(-2,2);
subplot(1,2,1)
plot(a,sim(Snet,a),a,Fxanal(a))
title('amini-NN');
legend('error test', 'error')

subplot(1,2,2)
plot(a,sim(Bnet,a),a,Bvanal(a))
title('amini-NN');
legend('error train', 'error')

figure(5)
plot(t,D)
title('amini-NN');
legend('error')
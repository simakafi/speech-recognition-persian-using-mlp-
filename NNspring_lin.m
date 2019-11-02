function springnet=NNspring_lin()


%%Spring NNetwork

n=1000;%number of training points per epoch

p=-2+4*rand(1,n);%really from -2 to 2 N, but BC errors could arise
t=Fxlin(p);

springnet = newfftd(p,t,[0 1],5);

%springnet = newfftd(p,t,[0 1 2],10);
%y1 = sim(springnet,p);%output without training


springnet.trainParam.epochs=100;
springnet.trainParam.goal=0.0000001;
springnet=train(springnet,p ,t);
%view(springnet)
gensim(springnet)

% y2 = sim(springnet,p);
% plot(p,t,'o',p,y1,'x',p,y2,'*');
% legend('analitical output','nn out without training','nn with training')
% title('Training');
% testtime=[-1.5:.1:2];
% testreal=fxanal(testtime);
% testsol=sim(springnet,testtime);
% error=testreal-testsol;
% figure(2);
% 
% plot(testtime,testreal,'+',testtime,testsol,'-',testtime,error,'o');
% legend('analitical output','nn output','error');
% title('testing mic check 1.2.3');
% testtime=[-1.5:.1:2];
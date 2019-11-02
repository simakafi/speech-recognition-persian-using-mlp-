function dampernet=NNdamper_lin()


%%Spring NNetwork

n=1000;%number of training points per epoch

p=-2+4*rand(1,n);%really from -2 to 2 N, but BC errors could arise
t=Bvlin(p);


dampernet = newfftd(p,t,[0 1],10);
%y1 = sim(dampernet,p);%output without training


dampernet.trainParam.epochs=100;
dampernet.trainParam.goal=0.0000001;
dampernet=train(dampernet,p,t);

% y2 = sim(dampernet,p)
% plot(p,t,'o',p,y1,'x',p,y2,'*')
% legend('analitical output','nn out without training','nn with training')
% title('Training')


% testtime=[-1.5:.1:2];
% testreal=Bvanal(testtime);
% testsol=sim(dampernet,testtime)
% error=testreal-testsol
% figure(2)
% 
% plot(testtime,testreal,'+',testtime,testsol,'-',testtime,error,'o')
% legend('analitical output','nn output','error')
% title('testing mic check 1.2.3')
% testtime=[-1.5:.1:2];
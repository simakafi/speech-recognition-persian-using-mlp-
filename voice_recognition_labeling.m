label=zeros(5,100000);

wav1=wavread('ketab1.wav');
label(1,37000:49000)=ones(1,49000-37000+1);
label(1,49000:55000)=2*ones(1,55000-49000+1);
label(1,55000:71000)=3*ones(1,71000-55000+1);
label(1,71000:82000)=4*ones(1,82000-71000+1);
subplot(3,2,1);
plot(wav1,'r');
hold on;
plot(label(1,:)/10)

wav2=wavread('ketab2.wav');
label(2,31000:40000)=ones(1,40000-31000+1);
label(2,40000:47000)=2*ones(1,47000-40000+1);
label(2,47000:64000)=3*ones(1,64000-47000+1);
label(2,64000:74000)=4*ones(1,74000-64000+1);
subplot(3,2,2);
plot(wav2,'r');
hold on;
plot(label(2,:)/10)

wav3=wavread('ketab3.wav');
label(3,29000:40000)=ones(1,40000-29000+1);
label(3,40000:47000)=2*ones(1,47000-40000+1);
label(3,47000:65000)=3*ones(1,65000-47000+1);
label(3,65000:76000)=4*ones(1,76000-65000+1);
subplot(3,2,3);
plot(wav3,'r');
hold on;
plot(label(3,:)/10)

wav4=wavread('ketab4.wav');
label(4,26000:35000)=ones(1,35000-26000+1);
label(4,35000:44000)=2*ones(1,44000-35000+1);
label(4,44000:61000)=3*ones(1,61000-44000+1);
label(4,61000:72000)=4*ones(1,72000-61000+1);
subplot(3,2,4);
plot(wav4,'r');
hold on;
plot(label(4,:)/10)

wav5=wavread('ketab5.wav');
label(5,17000:27000)=ones(1,27000-17000+1);
label(5,27000:35000)=2*ones(1,35000-27000+1);
label(5,35000:47000)=3*ones(1,47000-35000+1);
label(5,47000:54000)=4*ones(1,54000-47000+1);
subplot(3,2,5);
plot(wav5,'r');
hold on;
plot(label(5,:)/10)

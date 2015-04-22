close all;
clear all;


%%
%alpha absolute
%alpha relative
%beta absolute
%% import all data from the prerecorded data
%amuse = importdata('C:\Users\Hang\Desktop\Final Design Matlab\Assignment 3\amusement.mat');
%sleep1 = importdata('C:\Users\Hang\Desktop\Final Design Matlab\Assignment 3\sleep1.mat');
%awe = importdata('C:\Users\Hang\Desktop\Final Design Matlab\Assignment 3\awe.mat');
%awake2 = importdata('C:\Users\Hang\Desktop\Final Design Matlab\Assignment 3\awake2.mat');
%sleep2 = importdata('C:\Users\Hang\Desktop\Final Design Matlab\Assignment 3\sleep2.mat');
%excitement = importdata('C:\Users\Hang\Desktop\Final Design Matlab\Assignment 3\excitement.mat');
%fear = importdata('C:\Users\Hang\Desktop\Final Design Matlab\Assignment 3\fear.mat');
%sad = importdata('C:\Users\Hang\Desktop\Final Design Matlab\Assignment 3\sad.mat');
table = importdata('C:\Users\Hang\Desktop\Final Design Matlab\sleep analysis\table.xlsx');


awake1 = importdata('C:\Users\Hang\Desktop\Final Design Matlab\sleep analysis\awake.mat');
awake2 = importdata('C:\Users\Hang\Desktop\Final Design Matlab\sleep analysis\awake1.mat');
sleep1 = importdata('C:\Users\Hang\Desktop\Final Design Matlab\sleep analysis\sleep.mat');
sleep2 = importdata('C:\Users\Hang\Desktop\Final Design Matlab\sleep analysis\sleep1.mat');

%% setup
N = 1580;

%table.data = table.data(:,5:12);

%% only used the first 1071 points
%% awake
a1 = awake1.elements.alpha_absolute(1:N,2:5);
ar1 = awake1.elements.alpha_relative(1:N,2:5);
b1 = awake1.elements.beta_absolute(1:N,2:5);
br1 = awake1.elements.beta_relative(1:N,2:5);
blink1 = awake1.elements.blink(1:N,2);
d1 = awake1.elements.delta_absolute(1:N,2:5);
dr1 = awake1.elements.delta_relative(1:N,2:5);
concentration1 = awake1.elements.experimental_concentration(1:N,2);
mellow1 = awake1.elements.experimental_mellow (1:N,2);
g1 = awake1.elements.gamma_absolute(1:N,2:5);
gr1 = awake1.elements.gamma_relative(1:N,2:5);
t1 = awake1.elements.theta_absolute(1:N,2:5);
tr1 = awake1.elements.theta_relative(1:N,2:5);
ratio1 = b1./a1;
train = horzcat(a1,ar1,b1,br1,blink1,d1,dr1,concentration1,mellow1,g1,gr1,t1,tr1);
target1 = table.data(1,:);
for i = 1:N
target1(i,:) = table.data (1,:);
end
%% sleep

a2 = sleep1.elements.alpha_absolute(1:N,2:5);
ar2 = sleep1.elements.alpha_relative(1:N,2:5);
b2 = sleep1.elements.beta_absolute(1:N,2:5);
br2 = sleep1.elements.beta_relative(1:N,2:5);
blink2 = sleep1.elements.blink(1:N,2);
d2 = sleep1.elements.delta_absolute(1:N,2:5);
dr2 = sleep1.elements.delta_relative(1:N,2:5);
concentration2 = sleep1.elements.experimental_concentration(1:N,2);
mellow2 = sleep1.elements.experimental_mellow (1:N,2);
g2 = sleep1.elements.gamma_absolute(1:N,2:5);
gr2 = sleep1.elements.gamma_relative(1:N,2:5);
t2 = sleep1.elements.theta_absolute(1:N,2:5);
tr2 = sleep1.elements.theta_relative(1:N,2:5);

train = vertcat(train,horzcat(a2,ar2,b2,br2,blink2,d2,dr2,concentration2,mellow2,g2,gr2,t2,tr2));
for i = (2*N+1):2*N
target1(i,:) = table.data (2,:);
end

%% awake1
a4 = awake2.elements.alpha_absolute(1:N,2:5);
ar4 = awake2.elements.alpha_relative(1:N,2:5);
b4 = awake2.elements.beta_absolute(1:N,2:5);
br4 = awake2.elements.beta_relative(1:N,2:5);
blink4 = awake2.elements.blink(1:N,2);
d4 = awake2.elements.delta_absolute(1:N,2:5);
dr4 = awake2.elements.delta_relative(1:N,2:5);
concentration4 = awake2.elements.experimental_concentration(1:N,2);
mellow4 = awake2.elements.experimental_mellow(1:N,2);
g4 = awake2.elements.gamma_absolute(1:N,2:5);
gr4 = awake2.elements.gamma_relative(1:N,2:5);
t4 = awake2.elements.theta_absolute(1:N,2:5);
tr4 = awake2.elements.theta_relative(1:N,2:5);

train = vertcat(train,horzcat(a4,ar4,b4,br4,blink4,d4,dr4,concentration4,mellow4,g4,gr4,t4,tr4));
for i = (2*N+1):3*N
target1(i,:) = table.data (1,:);
end

%% sleep1
a5 = sleep2.elements.alpha_absolute(1:N,2:5);
ar5 = sleep2.elements.alpha_relative(1:N,2:5);
b5 = sleep2.elements.beta_absolute(1:N,2:5);
br5 = sleep2.elements.beta_relative(1:N,2:5);
blink5 = sleep2.elements.blink(1:N,2);
d5 = sleep2.elements.delta_absolute(1:N,2:5);
dr5 = sleep2.elements.delta_relative(1:N,2:5);
concentration5 = sleep2.elements.experimental_concentration(1:N,2);
mellow5 = sleep2.elements.experimental_mellow(1:N,2);
g5 = sleep2.elements.gamma_absolute(1:N,2:5);
gr5 = sleep2.elements.gamma_relative(1:N,2:5);
t5 = sleep2.elements.theta_absolute(1:N,2:5);
tr5 = sleep2.elements.theta_relative(1:N,2:5);

train = vertcat(train,horzcat(a5,ar5,b5,br5,blink5,d5,dr5,concentration5,mellow5,g5,gr5,t5,tr5));
for i = (3*N+1):4*N
target1(i,:) = table.data (2,:);
end


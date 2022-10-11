close all
clear

lambda = 30e-3; %meter
k = 2*pi/lambda;

%% Array Factor
theta = linspace(0,2*pi,361); %angle of observation 
N = 10; % number of elements
N_ = linspace(0,N-1,N);
d = lambda/2;
beta = deg2rad(60); %phase difference in rad
AF = zeros(1,length(theta));
for i = 1:length(theta)
    AF(i) = abs(sum(exp(1i.*N_*(k*d*sin(theta(i))+beta))));
end

% figure;plot(rad2deg(theta),AF);
figure;polarplot(theta,max(-25,20*log10(AF)),'k');rlim([-25 20]);title('Array Factor')

%% Read analytical data
E_Eplane_ANAL = ReadANAL('Epl-Micr_m.dat');
E_Eplane_ANAL_AbsE = max(-25,E_Eplane_ANAL.AbsE);
E_Hplane_ANAL = ReadANAL('Hpl-Micr_m.dat',5,inf);
E_Hplane_ANAL_AbsE = max(-25,cat(1,E_Hplane_ANAL.AbsE(1:91),-60*ones(179,1),E_Hplane_ANAL.AbsE(92:182)));

figure;
polarplot(theta,E_Eplane_ANAL_AbsE,'b',...
    theta,E_Hplane_ANAL_AbsE,'r');rlim([-25 0])
title('Analytical element pattern')
legend('E-plane','H-plane')

Earr_Hplane_ANAL = max(-20,E_Hplane_ANAL_AbsE + 20*log10(AF'));
Earr_Eplane_ANAL = max(-20,E_Eplane_ANAL.AbsE + 20*log10(AF(1)));

figure;
polarplot(theta,Earr_Eplane_ANAL-max(Earr_Hplane_ANAL),'b',...
    theta,Earr_Hplane_ANAL-max(Earr_Hplane_ANAL),'r');rlim([-40 5])
title('Analytical array pattern')
legend('E-plane','H-plane')

%% Read single patch pattern from CST
E_Eplane_CST = ReadCST('Epl-Micr_CST.csv');
E_Hplane_CST = ReadCST('Hpl-Micr_CST.csv');

figure;
polarplot(theta,max(-25,cat(1,E_Eplane_CST.AbsE,E_Eplane_CST.AbsE(1))-E_Eplane_CST.AbsE(1)),'b',...
    theta,max(-25,cat(1,E_Hplane_CST.AbsE,E_Hplane_CST.AbsE(1))-E_Hplane_CST.AbsE(1)),'r');rlim([-25 0])
title('Element pattern from CST')
legend('E-plane','H-plane')

%% Array pattern calculated from patch pattern sumulated
Earr_Hplane = max(0,cat(1,E_Hplane_CST.AbsE,E_Hplane_CST.AbsE(1)) + 20*log10(AF'));
Earr_Eplane = cat(1,E_Eplane_CST.AbsE,E_Eplane_CST.AbsE(1)) + 20*log10(AF(1));

figure;
polarplot(theta,Earr_Eplane-max(Earr_Hplane),'b',theta,Earr_Hplane-max(Earr_Hplane),'r');rlim([-40 5])
title('Array pattern calculated from CST')
legend('E-plane','H-plane')

%% Array pattern simulated
Earr_Eplane_CST = ReadCST('Epl-Micr_array60deg_CST.csv');
Earr_Hplane_CST = ReadCST('Hpl-Micr_array60deg_CST.csv');

figure;
polarplot(theta,max(0,cat(1,Earr_Eplane_CST.AbsE,Earr_Eplane_CST.AbsE(1)))-max(Earr_Hplane_CST.AbsE),'b',...
    theta,max(0,cat(1,Earr_Hplane_CST.AbsE,Earr_Hplane_CST.AbsE(1)))-max(Earr_Hplane_CST.AbsE),'r');rlim([-40 5])
title('Array pattern from CST')
legend('E-plane','H-plane')


%% Rotman lens design
Erotman_Hplane_port5_CST = ReadCST('Hpl-Micr_rotman0deg_CST.csv');
Erotman_Hplane_port4_CST = ReadCST('Hpl-Micr_rotman30deg_CST.csv');
Erotman_Hplane_port3_CST = ReadCST('Hpl-Micr_rotman30deg_CST.csv');
Erotman_Hplane_port2_CST = ReadCST('Hpl-Micr_rotman30deg_CST.csv');
Erotman_Hplane_port1_CST = ReadCST('Hpl-Micr_rotman30deg_CST.csv');

figure;
polarplot(theta,max(-10,cat(1,Erotman_Hplane_port1_CST.AbsE,Erotman_Hplane_port1_CST.AbsE(1)))-max(Erotman_Hplane_port1_CST.AbsE),'m');
hold on
polarplot(theta,max(-10,cat(1,Erotman_Hplane_port2_CST.AbsE,Erotman_Hplane_port2_CST.AbsE(1)))-max(Erotman_Hplane_port2_CST.AbsE),'k');
polarplot(theta,max(-10,cat(1,Erotman_Hplane_port3_CST.AbsE,Erotman_Hplane_port3_CST.AbsE(1)))-max(Erotman_Hplane_port3_CST.AbsE),'g');
polarplot(theta,max(-10,cat(1,Erotman_Hplane_port4_CST.AbsE,Erotman_Hplane_port4_CST.AbsE(1)))-max(Erotman_Hplane_port4_CST.AbsE),'r');
polarplot(theta,max(-10,cat(1,Erotman_Hplane_port5_CST.AbsE,Erotman_Hplane_port5_CST.AbsE(1)))-max(Erotman_Hplane_port5_CST.AbsE),'b');
% By symetry, reproduce the orther port patterns
polarplot(theta,max(-10,cat(1,Erotman_Hplane_port4_CST.AbsE(1),Erotman_Hplane_port4_CST.AbsE(360:-1:1)))-max(Erotman_Hplane_port4_CST.AbsE),'--r');
polarplot(theta,max(-10,cat(1,Erotman_Hplane_port3_CST.AbsE(1),Erotman_Hplane_port3_CST.AbsE(360:-1:1)))-max(Erotman_Hplane_port3_CST.AbsE),'--g');
polarplot(theta,max(-10,cat(1,Erotman_Hplane_port2_CST.AbsE(1),Erotman_Hplane_port2_CST.AbsE(360:-1:1)))-max(Erotman_Hplane_port2_CST.AbsE),'--k');
polarplot(theta,max(-10,cat(1,Erotman_Hplane_port1_CST.AbsE(1),Erotman_Hplane_port1_CST.AbsE(360:-1:1)))-max(Erotman_Hplane_port1_CST.AbsE),'--m');
hold off
rlim([-25 0])
title('Patterns of phased array with Rotman lens feeding from CST')
legend('Port 1','Port 2','Port 3','Port 4','Port 5', 'Port 6','Port 7','Port 8', 'Port 9')


%innercore
clear all;clc;clf;close all
scale = 1;
sample = 'HA2';
imagepath = strcat('Neupane\',sample);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
file_no = '51';
A = IBWread(strcat(imagepath,'\f000',file_no,'.ibw'));
B = A.y*scale;

Xmin = A.x0(1); Ymin = A.x0(2); 
Dx = A.dx(1); Dy = A.dx(2);
Xmax = Dx*size(B,1) + Xmin; Ymax = Dy*size(B,2) + Ymin;

Y = mean(B);%B(1,:);
X = 1:size(Y,2);
Xplot = Dy.*X + Ymin + 4.5;
[pk,lk,w,p] =findpeaks(Y(1,:), ...
                          'MinPeakDistance',50 );
% eliminate trend%%%%%%%%%%%%%%%%%%%
opol = 6;
[p,s,mu] = polyfit(X,Y,opol);
f_y = polyval(p,X,[],mu);
dt_Y = Y - f_y;
%%%%%%%%%%%%%%%%%%%%%%%%
offset = 2000;
hold on
%plot(Xplot,Y(1,:)+offset,'linewidth',2.5,'color','Red');
%plot(Xplot,f_y(1,:)+offset,'linewidth',2.5,'color','Blue');
plot(Xplot,dt_Y(1,:)+offset,'linewidth',1,'color','Red');

box on
xlabel('Energy (eV)')
ylabel('Counts (arb.)')
%plot(Xplot(lk),pk,'*');
xlim([-70,-10])
%ylim([0,6000])
hold off 
%text(Xplot(lk)+.2,pk+100,num2str((1:numel(pk))'))
Innercore = Xplot(lk);
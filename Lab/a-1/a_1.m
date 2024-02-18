%% LINEAR SCALE
close all;
clear;
clc;
%-------------------------------------------------------------------------
figure
n = [1,2,3];
for z = 1:length(n) % Grid of 1 spacing from 1 to 3
    x = 0.1 : 0.01 : 10; % Grid of 0.01 spacing from 0 to 10
    y = 1./((x).^n(z)); % Evaluate function on xvals
    plot(x, y); % Create line plot with yvals against xvals
    hold on;
end
title('Linear Scale of P=1/r^n')
xlabel('r,m') 
ylabel('1/x^n') 
grid on
hold off;
legend('n=1','n=2','n=3')

%% LOGLOG SCALE
figure
for n= 1:1:3 % Grid of 1 spacing from 1 to 3
    xvals = 0:0.01:10; % Grid of 0.01 spacing from 0 to 10
    yvals = 1./((xvals).^n); % Evaluate function on xvals
    loglog(xvals, yvals); % Create line plot with yvals against xvals
    hold on;
end
title('LogScale of P=1/r^n')
xlabel('r,m')
ylabel('P,W/m^2') 
grid on
hold off;
legend('n=1','n=2','n=3')

%% SCALING FACTOR LOGLOG SCALE
figure
for c= [1,2,5] % Grid of 1 spacing from 1 to 3
    xvals = 0:0.01:10; % Grid of 0.01 spacing from 0 to 10
    yvals = c./((xvals).^2); % Evaluate function on xvals
    loglog(xvals, yvals); % Create line plot with yvals against xvals
    hold on;
end
title('Scaling Factor LogScale');
xlabel('r,m') 
ylabel('C/x^2') 
grid on
hold off;
legend('C=1','C=2','C=5')

%% PLOTTING EXPERIMENTAL DATA
type p-vs-r-001.txt
M = readmatrix('p-vs-r-001.txt');
figure
loglog( M(:,1),M(:,2), '.b' );
%plotting the curve overlay
%C=P*r^2 = 15.86
hold on;
xvals = 0:0.01:10; % Grid of 0.01 spacing from 0 to 10
yvals = 15.86087./((xvals).^2); % Evaluate function on xvals
loglog(xvals, yvals,'r'); % Create line plot with yvals against xvals
xlabel('r,m')
ylabel('P,W/m^2') 
title('Plotting Experimental Data')
grid on
hold off;
legend('P(r), trial001','C/r^n model')
%% Combining Multiple Trials
files = dir('*.txt');
figure % Create scatter plot with P against r
for n= 1:length(files) % all the files 
    name=files(n).name;
    M = readmatrix(name);
    p1 = loglog( M(:,1),M(:,2),'b'); 
    hold on
end

%C/r^n model
xvals = 0:0.01:10; % Grid of 0.01 spacing from 0 to 10
yvals = 15.86087./((xvals).^2); % Evaluate function on xvals
p2 = loglog(xvals, yvals,'black'); % Create line plot with yvals against xvals

% N = zeros(101,length(files));
% create N with all the corresponding r's by rows and P's by columns
for n= 1:length(files) 
    name = files(n).name;
    M = readmatrix(name);
    M = M(:,2);
    N(:,n) = M;
end

% Create a matrix with all the mean P(r)
M = readmatrix(name);
A(:,1) = M(:,1);
mean = mean(N,2);
A(:,2) = mean;
p3 = loglog(A(:,1), A(:,2),'r'); % Create line plot with yvals against xvals

title('Combining Multiple Trials')
xlabel('r,m')
ylabel('P,W/m^2') 
grid on
legend([p1,p2,p3],'P(r), all trials','C/r^n model', 'meanP(r)')     
hold off
%% Confidence Plot
figure
%C/r^n model
xvals = 0.1:0.1:10; % Grid of 0.01 spacing from 0 to 10
yvals = 15.86087./((xvals).^2); % Evaluate function on xvals
loglog(xvals, yvals,'black'); % Create line plot with yvals against xvals

% create N with all the corresponding r's by rows and P's by columns
for n= 1:length(files) 
    name = files(n).name;
    M = readmatrix(name);
    N(:,n) = M(:,2);
    conf0  (n) = prctile(N(n,:),  0);
    conf25 (n) = prctile(N(n,:), 25);
    conf75 (n) = prctile(N(n,:), 75);
    conf100(n) = prctile(N(n,:),100);
end

% Create a matrix with all the mean P(r)
p3 = loglog(A(:,1), A(:,2),'r'); % mean plot
hold on

patch([xvals,fliplr(xvals)],[conf25,fliplr(conf75 )],'p','facealpha',0.4)
patch([xvals,fliplr(xvals)],[conf0 ,fliplr(conf100)],'r','facealpha',0.4)
% set(gca,'xscale', 'log', 'yscale', 'log')
loglog(xvals,yvals,'c')

title('Confidence Plot')
xlabel('r,m')
ylabel('P,W/m^2') 
grid on
hold off
legend('MeanP(r)','50% Confidence','100% Confidence' ,'C/r^n model');
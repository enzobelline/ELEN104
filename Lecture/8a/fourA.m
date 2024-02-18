Nz = 101;
Nt = 1001;
zmax = 5; 
tmax = 10;
z = linspace(0, zmax, Nz); %(0, 5, 101)
t = linspace(0, tmax, Nt); %(0,10,1001)
f = 20 ; % a frequency
omega = 2.*pi.*f ; % calculate omegas
k = 20;
%cycle through each time step

%% a
for t_ = t
    %update function f at this time step
    f = cos((omega.*t_)-(k.*z));
    figure(1)
    cla()
    plot(z,f)
    xlim([min(z),max(z)])
    ylim([-1,1])
    xlabel('z')
    ylabel('f(z,t)')
    drawnow()
end    
% omega changes how fast the function oscillates
% k determines how far the wave travels
%% b
for t_ = t
    %update function f at this time step
    f = cos((omega.*t_)+(k.*z));
    figure(2)
    cla()
    plot(z,f)
    xlim([min(z),max(z)])
    ylim([-1,1])
    xlabel('z')
    ylabel('f(z,t)')
    drawnow()
end    
% omega changes how fast the function oscillates
% k determines how far the wave travels
%% c
alpha = 2;
for t_ = t
    %update function f at this time step
    f = (exp(-1*alpha*z)).*cos((omega.*t_)-(k.*z));
    figure(3)
    cla()
    plot(z,f)
    xlim([min(z),max(z)])
    ylim([-1,1])
    xlabel('z')
    ylabel('f(z,t)')
    drawnow()
end    
% omega changes how fast the function oscillates
% k determines how far the wave travels
% alpha determines what is happening at time = 0
%% d
A = 2;
B = 2;
for t_ = t
    %update function f at this time step
    f = A.*cos((omega.*t_)-(k.*z)) + B.*cos((omega.*t_)+(k.*z));
    figure(4)
    cla()
    plot(z,f)
    xlim([min(z),max(z)])
    ylim([-1,1])
    xlabel('z')
    ylabel('f(z,t)')
    drawnow()
end    
% omega changes how fast the function oscillates
% k determines how far the wave travels
% A and B determines the size of the amplitude of the waves
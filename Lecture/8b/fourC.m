r = logspace(0,4, 1000);
fMag = abs(exp(-0.05.*r).*exp((-1i).*r)./r).^2; 
rad = r.^(-2); 
e = exp((-2*a).*r);

figure
loglog(r, fMag, 'k') 
hold on 
loglog(r, rad, '--b') 
hold on
loglog(r, e, '--r')
hold on             

xlabel('r, m')          
ylabel('|f|^2')
ylim([1/10^(8), 1])
legend('e^-^2^a^r', 'r^-^2', '|f|^2')
hold off
e = 8.8542*10^-12;
x1 = linspace(0,1,100);
x2 = linspace(1,3,100);

Vx1 = (x1.^2)/(2*e);
Vx2 = (1.5/e)*x2 - x2.^2/(4*e);
vj = Vx2(100);

plot(x1,Vx1./vj)
hold on
plot(x2,Vx2./vj)

xline(0,'g')
xline(1,'g')
xline(3,'g')
hold off
xlim([-0.5, 3.5])

xlabel('x`/wp')
ylabel('V(x`)/vj')
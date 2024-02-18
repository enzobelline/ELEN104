l = linspace(0,10, 1000);
m = 12.57 * 10^-7;
L = (m*pi)./l;
L2 = (9 + 10.*l).^-1;

figure
plot (l , L2*39.3701*10^-6)
hold on
plot (l, L)

grid on
xlim([0,10])
xlabel('Aspect Ratio 1/a')
xticks(0:2:10)

ylim([10^-7 , 10^-4])
ylabel('L/(Na)^2')

set(gca, 'Yscale','log')
legend('Wheeler Iductance Formula','Long Solenoid Approximation')
title('d7-b: Problem #2 Part b')
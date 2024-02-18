xn = [2 7 5 9];
an = [1 0.5 0.2 0.75];
x = 0:0.01:10; % Grid of 0.01 spacing from 0 to 10
fsum = zeros(1,1001);

figure
for n= 1:1:4 % Grid of 1 spacing from 1 to 4
    x = 0:0.01:10; % Grid of 0.01 spacing from 0 to 10
    fn = an(n).*exp(-(x-xn(n)).^2); % Evaluate function fn(x,xn,an)
    plot(x, fn); % Create line plot with fn against x
    fsum = fsum + fn;
    hold on;
end
plot(x,fsum,':');
title('Figure Replication Problem 3.b')
hold off

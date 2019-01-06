clear;
clc;
%{
Suppose we want to approximate the following function:
f(x) = cos x/cosh x, on [-a, a]
using n points equally spaced between -a and a. Find the interpolating 
polynomials and plot them versus the function f(x) for a = 1, 5, and 
n = 3, 5, 10, 15. Show also the data points you used for interpolation. 
Plot the results in a single figure.
%}

syms x;
f(x) = cos(x) / cosh(x);
a = [1, 5];
n = [3, 5, 10, 15];
counter = 0;

for i=1:length(a)
    for j=1:length(n)
        counter = counter + 1;
        
        x1 = linspace(-a(i), a(i), n(j)); % generate equally spaced points 
        y1 = cos(x1)./cosh(x1);
        
        subplot(3, 3, counter)
        ezplot(f(x), [-5, 5, -0.5, 1.1]); % plot original function 
        title(sprintf('a = %d, n = %d', a(i), n(j)));
        hold on;
        
        % coefficients of interpolating polynomial
        p = polyfit(x1, y1, n(j)-1); 
        x2 = linspace(-5, 5);
        y2 = polyval(p, x2); % evaluate interpolating polynomial
        subplot(3, 3, counter)
        plot(x2, y2); % plot interpolating polynomial
        
        subplot(3, 3, counter)
        plot(x1, y1, 'o'); % plot data points used for interpolation
        hold on;
    end
end
subplot(3, 3, 9);
plot(0,0, 0,0, 0,0, 0,0);
axis off;
legend('f(x)', 'p(x)');
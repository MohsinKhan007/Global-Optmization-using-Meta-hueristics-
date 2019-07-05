%_________________________________________________________________________%
%  Whale Optimization Algorithm (WOA) source codes demo 1.0               %
%                                                                         %
%  Developed in MATLAB R2011b(7.13)                                       %
%                                                                         %
%  Author and programmer: Seyedali Mirjalili                              %
%                                                                         %
%         e-Mail: ali.mirjalili@gmail.com                                 %
%                 seyedali.mirjalili@griffithuni.edu.au                   %
%                                                                         %
%       Homepage: http://www.alimirjalili.com                             %
%                                                                         %
%   Main paper: S. Mirjalili, A. Lewis                                    %
%               The Whale Optimization Algorithm,                         %
%               Advances in Engineering Software , in press,              %
%               DOI: http://dx.doi.org/10.1016/j.advengsoft.2016.01.008   %
%                                                                         %
%_________________________________________________________________________%

% This function containts full information and implementations of the benchmark 
% functions in Table 1, Table 2, and Table 3 in the paper

% lb is the lower bound: lb=[lb_1,lb_2,...,lb_d]
% up is the uppper bound: ub=[ub_1,ub_2,...,ub_d]
% dim is the number of variables (dimension of the problem)

function [lb,ub,dim,fobj] = GetFunctionsDetails(F)
    switch F
        case 'F1'
            fobj = @F1;
            lb=-100;
            ub=100;
            dim=30;

        case 'F2'
            fobj = @F2;
            lb=-10;
            ub=10;
            dim=30;

        case 'F3'
            fobj = @F3;
            lb=-100;
            ub=100;
            dim=30;

        case 'F4'
            fobj = @F4;
            lb=-100;
            ub=100;
            dim=30;

        case 'F5'
            fobj = @F5;
            lb=-30;
            ub=30;
            dim=30;

        case 'F6'
            fobj = @F6;
            lb=-100;
            ub=100;
            dim=30;

        case 'F7'
            fobj = @F7;
            lb=-1.28;
            ub=1.28;
            dim=30;

        case 'F8'
            fobj = @F8;
            lb=-500;
            ub=500;
            dim=30;

        case 'F9'
            fobj = @F9;
            lb=-5.12;
            ub=5.12;
            dim=30;

        case 'F10'
            fobj = @F10;
            lb=-32;
            ub=32;
            dim=30;

        case 'F11'
            fobj = @F11;
            lb=-600;
            ub=600;
            dim=30;

        case 'F12'
            fobj = @F12;
            lb=-50;
            ub=50;
            dim=30;

        case 'F13'
            fobj = @F13;
            lb=-50;
            ub=50;
            dim=30;

        case 'F14'
            fobj = @F14;
            lb=-65.536;
            ub=65.536;
            dim=2;

        case 'F15'
            fobj = @F15;
            lb=-5;
            ub=5;
            dim=4;

        case 'F16'
            fobj = @F16;
            lb=-5;
            ub=5;
            dim=2;

        case 'F17'
            fobj = @F17;
            lb=[-5,0];
            ub=[10,15];
            dim=2;

        case 'F18'
            fobj = @F18;
            lb=-2;
            ub=2;
            dim=2;

        case 'F19'
            fobj = @F19;
            lb=0;
            ub=1;
            dim=3;

        case 'F20'
            fobj = @F20;
            lb=0;
            ub=1;
            dim=6;     

        case 'F21'
            fobj = @F21;
            lb=0;
            ub=10;
            dim=4;    

        case 'F22'
            fobj = @F22;
            lb=0;
            ub=10;
            dim=4;    

        case 'F23'
            fobj = @F23;
            lb=0;
            ub=10;
            dim=4;

        case 'F24'  
            fobj= @F24;
            lb=-5.2;
            ub=5.2;
            dim=2;

        case 'F25'
            fobj=@F25;
            lb=-1;
            ub=4;
            dim=10;

        case 'F26'
            fobj=@F26;
            lb=0;
            ub=2;
            dim=3;

        case 'F27'
            fobj=@F27;
            lb=-500;
            ub=500;
            dim=10;

        case 'F28'
            fobj=@F28;
            lb=-100;
            ub=100;
            dim=2;

        case 'F29'
            fobj=@F29;
            lb=-5;
            ub=5;
            dim=10;

        case 'F30'
            fobj=@F30;
            lb=-5;
            ub=10;
            dim=20;

        case 'F31'
            fobj=@F31;
            lb=-10;
            ub=10;
            dim=20;

        case 'F32'
            fobj=@F32;
            lb=-6.28;
            ub=6.28;
            dim=20;

        case 'F33'
            fobj=@F33;
            lb=-32;
            ub=32;
            dim=2;
        case 'F34'
            fobj=@F34;
            lb=-32;
            ub=32;
            dim=2;
        case 'F35'
            fobj=@F35;
            lb=-35;
            ub=35;
            dim=30;
        case 'F36'
            fobj=@F36;
            lb=[-1 -1];
            ub=[2 1];
            dim=2;
        case 'F37'
            fobj=@F37;
            lb=0;
            ub=10;
            dim=30;
        case 'F38'
            fobj=@F38;
            lb=0;
            ub=10;
            dim=30;
        case 'F39'
            fobj=@F39;
            lb=[-500 -500];
            ub=[500 500];
            dim=2;
         case 'F40'
            fobj=@F40;
            lb=-4.5;
            ub=4.5;
            dim=2;
          case 'F41'
            fobj=@F41;
            lb=-2*(pi);
            ub=2*(pi);
            dim=2;
          case 'F42'
            fobj=@F42;
            lb=-100;
            ub=100;
            dim=2;
          case 'F43'
            fobj=@F43;
            lb=-100;
            ub=100;
            dim=2;
          case 'F44'
            fobj=@F44;
            lb=-10;
            ub=10;
            dim=2;
         case 'F45'
            fobj=@F45;
            lb=-20;
            ub=0;
            dim=2;
          case 'F46'
            fobj=@F46;
            lb=[-15 -3];
            ub=[-5 3];
            dim=2;
          case 'F47'
            fobj=@F47;
            lb=[-10 -10];
            ub=[10 10];
            dim=2;
          case 'F48'
            fobj=@F48;
            lb=-20;
            ub=20;
            dim=2;
        case 'F49'
            fobj=@F49;
            lb=-5;
            ub=5;
            dim=2;
        case 'F50'
            fobj=@F50;
            lb=-1;
            ub=1;
            dim=30;
       case 'F51'
            fobj=@F51;
            lb=-0.5;
            ub=2.5;
            dim=1;
       case 'F52'
            fobj=@F52;
            lb=-6;
            ub=6;
            dim=2;
       case 'F53'
            fobj=@F53;
            lb=[-10 -10];
            ub=[10 10];
            dim=2;
        case 'F54'
            fobj=@F54;
            lb=0;
            ub=10;
            dim=2;
        case 'F55'
            fobj=@F55;
            lb=0;
            ub=10;
            dim=2;
        case 'F56'
            fobj=@F56;
            lb=[-10 -10];
            ub=[10 10];
            dim=2;
        case 'F57'
            fobj=@F57;
            lb=[-1.5 -3];
            ub=[4 3];
            dim=2;  
        case 'F58'
            fobj=@F58;
            lb=-1;
            ub=1;
            dim=30;
        case 'F59'
            fobj=@F59;
            lb=-1.28;
            ub=1.28;
            dim=30;
        case 'F60'
            fobj=@F60;
            lb=-5;
            ub=5;
            dim=30;
      case 'F61'
            fobj=@F61;
            lb=-100;
            ub=100;
            dim=2;
      case 'F62'
            fobj=@F62;
            lb=-100;
            ub=100;
            dim=2;
      case 'F63'
            fobj=@F63;
            lb=-100;
            ub=100;
            dim=2;
        case 'F64'
            fobj=@F64;
            lb=-100;
            ub=100;
            dim=30;
        case 'F65'
            fobj=@F65;
            lb=-100;
            ub=100;
            dim=30;
        case 'F66'
            fobj=@F66;
            lb=-10;
            ub=10;
            dim=30;
        case 'F67'
            fobj=@F67;
            lb=-500;
            ub=500;
            dim=30;
        case 'F68'
            fobj=@F68;
            lb=-10;
            ub=10;
            dim=30;
        case 'F69'
            fobj=@F69;
            lb=-10;
            ub=10;
            dim=30;
        case 'F70'
            fobj=@F70;
            lb=-5;
            ub=5;
            dim=2;
        case 'F71'
            fobj=@F71;
            lb=-5;
            ub=5;
            dim=30;
        case 'F72'
            fobj=@F72;
            lb=-2*pi;
            ub=2*pi;
            dim=30;
        case 'F73'
            fobj=@F73;
            lb=-10;
            ub=10;
            dim=30;
        case 'F74'
            fobj=@F74;
            lb=-5;
            ub=10;
            dim=30;
    end
end

% F1
function o = F1(x)
o=sum(x.^2);
end

% F2

function o = F2(x)
o=sum(abs(x))+prod(abs(x));
end

% F3

function o = F3(x)
dim=size(x,2);
o=0;
for i=1:dim
    o=o+sum(x(1:i))^2;
end
end

% F4

function o = F4(x)
o=max(abs(x));
end

% F5

function o = F5(x)
dim=size(x,2);
o=sum(100*(x(2:dim)-(x(1:dim-1).^2)).^2+(x(1:dim-1)-1).^2);
end

% F6

function o = F6(x)
o=sum(abs((x+.5)).^2);
end

% F7

function o = F7(x)
dim=size(x,2);
o=sum([1:dim].*(x.^4))+rand;
end

% F8

function o = F8(x)
o=sum(-x.*sin(sqrt(abs(x))));
end

% F9

function o = F9(x)
dim=size(x,2);
o=sum(x.^2-10*cos(2*pi.*x))+10*dim;
end

% F10

function o = F10(x)
dim=size(x,2);
o=-20*exp(-.2*sqrt(sum(x.^2)/dim))-exp(sum(cos(2*pi.*x))/dim)+20+exp(1);
end

% F11

function o = F11(x)
dim=size(x,2);
o=sum(x.^2)/4000-prod(cos(x./sqrt([1:dim])))+1;
end

% F12

function o = F12(x)
dim=size(x,2);
o=(pi/dim)*(10*((sin(pi*(1+(x(1)+1)/4)))^2)+sum((((x(1:dim-1)+1)./4).^2).*...
(1+10.*((sin(pi.*(1+(x(2:dim)+1)./4)))).^2))+((x(dim)+1)/4)^2)+sum(Ufun(x,10,100,4));
end

% F13

function o = F13(x)
dim=size(x,2);
o=.1*((sin(3*pi*x(1)))^2+sum((x(1:dim-1)-1).^2.*(1+(sin(3.*pi.*x(2:dim))).^2))+...
((x(dim)-1)^2)*(1+(sin(2*pi*x(dim)))^2))+sum(Ufun(x,5,100,4));
end

% F14

function o = F14(x)
aS=[-32 -16 0 16 32 -32 -16 0 16 32 -32 -16 0 16 32 -32 -16 0 16 32 -32 -16 0 16 32;,...
-32 -32 -32 -32 -32 -16 -16 -16 -16 -16 0 0 0 0 0 16 16 16 16 16 32 32 32 32 32];

for j=1:25
    bS(j)=sum((x'-aS(:,j)).^6);
end
o=(1/500+sum(1./([1:25]+bS))).^(-1);
end

% F15

function o = F15(x)
aK=[.1957 .1947 .1735 .16 .0844 .0627 .0456 .0342 .0323 .0235 .0246];
bK=[.25 .5 1 2 4 6 8 10 12 14 16];bK=1./bK;
o=sum((aK-((x(1).*(bK.^2+x(2).*bK))./(bK.^2+x(3).*bK+x(4)))).^2);
end

% F16

function o = F16(x)
o=4*(x(1)^2)-2.1*(x(1)^4)+(x(1)^6)/3+x(1)*x(2)-4*(x(2)^2)+4*(x(2)^4);
end

% F17

function o = F17(x)
o=(x(2)-(x(1)^2)*5.1/(4*(pi^2))+5/pi*x(1)-6)^2+10*(1-1/(8*pi))*cos(x(1))+10;
end

% F18

function o = F18(x)
o=(1+(x(1)+x(2)+1)^2*(19-14*x(1)+3*(x(1)^2)-14*x(2)+6*x(1)*x(2)+3*x(2)^2))*...
    (30+(2*x(1)-3*x(2))^2*(18-32*x(1)+12*(x(1)^2)+48*x(2)-36*x(1)*x(2)+27*(x(2)^2)));
end

% F19

function o = F19(x)
aH=[3 10 30;.1 10 35;3 10 30;.1 10 35];cH=[1 1.2 3 3.2];
pH=[.3689 .117 .2673;.4699 .4387 .747;.1091 .8732 .5547;.03815 .5743 .8828];
o=0;
for i=1:4
    o=o-cH(i)*exp(-(sum(aH(i,:).*((x-pH(i,:)).^2))));
end
end

% F20

function o = F20(x)
aH=[10 3 17 3.5 1.7 8;.05 10 17 .1 8 14;3 3.5 1.7 10 17 8;17 8 .05 10 .1 14];
cH=[1 1.2 3 3.2];
pH=[.1312 .1696 .5569 .0124 .8283 .5886;.2329 .4135 .8307 .3736 .1004 .9991;...
.2348 .1415 .3522 .2883 .3047 .6650;.4047 .8828 .8732 .5743 .1091 .0381];
o=0;
for i=1:4
    o=o-cH(i)*exp(-(sum(aH(i,:).*((x-pH(i,:)).^2))));
end
end

% F21

function o = F21(x)
aSH=[4 4 4 4;1 1 1 1;8 8 8 8;6 6 6 6;3 7 3 7;2 9 2 9;5 5 3 3;8 1 8 1;6 2 6 2;7 3.6 7 3.6];
cSH=[.1 .2 .2 .4 .4 .6 .3 .7 .5 .5];

o=0;
for i=1:5
    o=o-((x-aSH(i,:))*(x-aSH(i,:))'+cSH(i))^(-1);
end
end

% F22

function o = F22(x)
aSH=[4 4 4 4;1 1 1 1;8 8 8 8;6 6 6 6;3 7 3 7;2 9 2 9;5 5 3 3;8 1 8 1;6 2 6 2;7 3.6 7 3.6];
cSH=[.1 .2 .2 .4 .4 .6 .3 .7 .5 .5];

o=0;
for i=1:7
    o=o-((x-aSH(i,:))*(x-aSH(i,:))'+cSH(i))^(-1);
end
end

% F23

function o = F23(x)
aSH=[4 4 4 4;1 1 1 1;8 8 8 8;6 6 6 6;3 7 3 7;2 9 2 9;5 5 3 3;8 1 8 1;6 2 6 2;7 3.6 7 3.6];
cSH=[.1 .2 .2 .4 .4 .6 .3 .7 .5 .5];

o=0;
for i=1:10
    o=o-((x-aSH(i,:))*(x-aSH(i,:))'+cSH(i))^(-1);
end
end

function o=Ufun(x,a,k,m)
o=k.*((x-a).^m).*(x>a)+k.*((-x-a).^m).*(x<(-a));
end


%U
%drop wave
function o=F24(x)
   n = size(x, 2);
    assert(n == 2, 'Drop-Wave function is only defined on a 2D space.')
    X = x(:, 1);
    Y = x(:, 2);
numeratorcomp = 1 + cos(12 * sqrt(X .^ 2 + Y .^ 2));
    denumeratorcom = (0.5 * (X .^ 2 + Y .^ 2)) + 2;
    o = - numeratorcomp ./ denumeratorcom;
end

%brown function
function o=F25(x)

n = size(x, 2);  
scores = 0;
x = x .^ 2;
    for i = 1:(n-1)
        scores = scores + x(:, i) .^ (x(:, i+1) + 1) + x(:, i+1).^(x(:, i) + 1);
    end
    o=scores;
end


%Wolfe Function
function o=F26(x)

 n = size(x, 2);
   % assert(n == 3, 'The Wolfe function is defined only on the 3-D space.')
    X = x(:, 1);
    Y = x(:, 2);
    Z = x(:, 3);
    
    o = (4/3)*(((X .^ 2 + Y .^ 2) - (X .* Y)).^(0.75)) + Z;

end

%Qing Function
function o=F27(x)

  n = size(x, 2);
    x2 = x .^2;
    
    scores = 0;
    for i = 1:n
        scores = scores + (x2(:, i) - i) .^ 2;
    end

   o=scores;
end


%easom function
function o=F28(x)
 
    n = size(x, 2);
    assert(n == 2, 'The Easom''s function is only defined on a 2D space.');
    X = x(:, 1);
    Y = x(:, 2);
    
    scores = -cos(X) .* cos(Y) .* exp(-( ((X - pi) .^2) + ((Y - pi) .^ 2))); 

    o=scores;
end

%Styblinski-Tank Function
function o=F29(x)

n = size(x, 2);
    scores = 0;
    for i = 1:n
        scores = scores + ((x(:, i) .^4) - (16 * x(:, i) .^ 2) + (5 * x(:, i)));
    end
    scores = 0.5 * scores;
    o=scores;

end

%zakharov
function o=F30(x)
    n = size(x, 2);
    comp1 = 0;
    comp2 = 0;
    for i = 1:n
        comp1 = comp1 + (x(:, i) .^ 2);
        comp2 = comp2 + (0.5 * i * x(:, i));
    end
    scores = comp1 + (comp2 .^ 2) + (comp2 .^ 4);
    o=scores;
end
%Periodic Function
function o=F31(x)
    sin2x = sin(x) .^ 2;
    sumx2 = sum(x .^2, 2);
    scores = 1 + sum(sin2x, 2) -0.1 * exp(-sumx2);
    o=scores;
end
%Xing she Xang N3
function o=F32(x)
   beta = 15;
   m = 5;
   scores = exp(-sum((x / beta).^(2*m), 2)) - (2 * exp(-sum(x .^ 2, 2)) .* prod(cos(x) .^ 2, 2));
   o=scores;
end

% Ackly 2n
function o = F33(x)
    
    n = size(x, 2);
    assert(n == 2, 'Ackley N. 2 function is only defined on a 2D space.')
    X = x(:, 1);
    Y = x(:, 2);
    
    o = -200 * exp(-0.02 * sqrt((X .^ 2) + (Y .^ 2)));
end
%ackly 3n
function o = F34(x)
    
    n = size(x, 2);
    assert(n == 2, 'Ackley N. 3 function is only defined on a 2D space.')
    X = x(:, 1);
    Y = x(:, 2);
    
    o = -200 * exp(-0.02 * sqrt((X .^ 2) + (Y .^ 2))) + ...
             5 * exp(cos(3 * X) + sin(3 * Y));
end
%ackly 4n
function o = F35(x)
    [m, n] = size(x);
    
    o = zeros(m, 1); 
   
   for i = 1:m
      for j = 1:(n - 1)
            o = o + exp(-0.2) .* sqrt( x(i, j) .^ 2 + x(i, j + 1) .^ 2 ) ...
            + 3 * ( cos(2 * x(i, j)) + sin(2 * x(i, j + 1)) );
      end
   end
end
%adjiman 
function o = F36(x)
    
    n = size(x, 2);
    assert(n == 2, 'Adjiman function is only defined on a 2D space.')
    X = x(:, 1);
    Y = x(:, 2);
    
    o = (cos(X) .* sin(Y)) - (X ./ ((Y .^ 2) + 1));
end
%alpine n1
function o = F37(x)
     o = sum(abs(x .* sin(x) + 0.1 * x), 2);
end 
%alpine n2
function o = F38(x)
     o = -prod(sqrt(x) .* sin(x), 2);
end 
%bartel conn
function o = F39(x)
    
    n = size(x, 2);
    assert(n == 2, 'Bartels Conn function is only defined on a 2D space.')
    X = x(:, 1);
    Y = x(:, 2);
    
    o = abs((X .^ 2) + (Y .^ 2) + (X .* Y)) + abs(sin(X)) + abs(cos(Y));
end
%baele function
function o = F40(x)
    n = size(x, 2);
    assert(n == 2, 'Beale''s function is only defined on a 2D space.')
    X = x(:, 1);
    Y = x(:, 2);
    
    o = (1.5 - X + (X .* Y)).^2 + ...
             (2.25 - X + (X .* (Y.^2))).^2 + ...
             (2.625 - X + (X .* (Y.^3))).^2;
end
%bird Function
function o = F41(x)
    
    n = size(x, 2);
    assert(n == 2, 'Bird function is only defined on a 2D space.')
    X = x(:, 1);
    Y = x(:, 2);
    
    o = sin(X) .* exp((1 - cos(Y)).^2) + ... 
        cos(Y) .* exp((1 - sin(X)) .^ 2) + ...
        (X - Y) .^ 2;
end
%bohachskeyn1 function
function o = F42(x)
    n = size(x, 2);
    assert(n == 2, 'The Bohachevsky N. 1 function is only defined on a 2D space.')
    X = x(:, 1);
    Y = x(:, 2);
    
    o = (X .^ 2) + (2 * Y .^ 2) - (0.3 * cos(3 * pi * X)) - (0.4 * cos(4 * pi * Y)) + 0.7;
end
%bohachskeyl n2 function
function o = F43(x)
    n = size(x, 2);
    assert(n == 2, 'The Bohachevsky N. 2 function is only defined on a 2D space.')
    X = x(:, 1);
    Y = x(:, 2);
    
    o = (X .^ 2) + (2 * Y .^ 2) - (0.3 * cos(3 * pi * X)) .* (cos(4 * pi * Y)) + 0.3;
end
%booth function
function o = F44(x)
    
    n = size(x, 2);
    assert(n == 2, 'Booth''s function is only defined on a 2D space.')
    X = x(:, 1);
    Y = x(:, 2);
    
    o = (X + (2 * Y) - 7).^2 + ( (2 * X) + Y - 5).^2;
end
% brent function
function o = F45(x)
    n = size(x, 2);
    assert(n == 2, 'The Brent function is defined only on the 2-D space.')
    X = x(:, 1);
    Y = x(:, 2);
    
    o = (X + 10).^2 + (Y + 10).^2 + exp(-X.^2 - Y.^2);
end
%bukin function
function o = F46(x)
    n = size(x, 2);
    assert(n == 2, 'The Bukin N. 6 functions is only defined on a 2D space.')
    
    X = x(:, 1);
    X2 = X .^ 2;
    Y = x(:, 2);
    
    o = 100 * sqrt(abs(Y - 0.01 * X2)) + 0.01 * abs(X  + 10);
end
%cross-in-tray
function o = F47(x)
    
    n = size(x, 2);
    assert(n == 2, 'The Cross-in-tray function is only defined on a 2D space.')
    X = x(:, 1);
    Y = x(:, 2);

    expcomponent = abs(100 - (sqrt(X .^2 + Y .^2) / pi));
    
    o = -0.0001 * ((abs(sin(X) .* sin(Y) .* exp(expcomponent)) + 1) .^ 0.1);
end
%decker-aarts
function o = F48(x)
    n = size(x, 2);
    assert(n == 2, 'The Deckkers-Aarts function is defined only on the 2-D space.')
    X = x(:, 1);
    Y = x(:, 2);
    
    o = (100000 * X.^2) + Y.^2 + - (X.^2 + Y.^2).^2 + (10^-5) * (X.^2 + Y.^2 ) .^4;
end 
% egg catare
function o = F49(x)
    n = size(x, 2);
    assert(n == 2, 'The Egg Crate function is defined only on the 2-D space.')
    X = x(:, 1);
    Y = x(:, 2);
    
    o = X.^2 + Y.^2 + (25 * (sin(X).^2 + sin(Y).^2));
end 
% Exponential
function o = F50(x)
   x2 = x .^2;
   
   o = -exp(-0.5 * sum(x2, 2));
end
%gramacy&lee
function o = F51(x)
    n = size(x, 2);
    assert(n == 1, 'Gramacy & Lee function is only defined on a 1-D space.')

    o = (sin(10 .* pi .* x) ./ (2 * x) ) + ((x - 1) .^ 4);
end
%himmelblau
function o = F52(x)
    n = size(x, 2);
    assert(n == 2, 'Himmelblau''s function is only defined on a 2D space.')
    X = x(:, 1);
    Y = x(:, 2);
    
    o = ((X .^ 2 + Y - 11) .^2) + ((X + (Y .^ 2) - 7) .^ 2);
end
%holder table
function o = F53(x)
    
    n = size(x, 2);
    assert(n == 2, 'The Holder-table function is only defined on a 2D space.')
    X = x(:, 1);
    Y = x(:, 2);
    
    expcomponent = exp( abs(1 - (sqrt(X .^2 + Y .^ 2) / pi)) );
    
    o = -abs(sin(X) .* cos(Y) .* expcomponent);
end
%kaenae
function o = F54(x)
    n = size(x, 2);
    assert(n == 2, 'Keane function is defined only on a 2D space.')
    X = x(:, 1);
    Y = x(:, 2);
    
    numeratorcomp = (sin(X - Y) .^ 2) .* (sin(X + Y) .^ 2); 
    denominatorcomp = sqrt(X .^2 + Y .^2);
    o = (- numeratorcomp ./ denominatorcomp);
end
%leon
function o = F55(x)
    n = size(x, 2);
    assert(n == 2, 'Leon function is defined only on a 2D space.')
    X = x(:, 1);
    Y = x(:, 2);
    
    o = 100 * ((Y - X.^3) .^2) + ((1 - X) .^2);
end
%matyas
function o = F56(x)
    n = size(x, 2);
    assert(n == 2, 'Matyas''s function is only defined on a 2D space.')
    X = x(:, 1);
    Y = x(:, 2);
    
    o = 0.26 * (X .^ 2 + Y.^2) - 0.48 * X .* Y;
end
%mcCormik 
function o = F57(x)
    
    n = size(x, 2);
    assert(n == 2, 'The McCormick function is only defined on a 2D space.')
    X = x(:, 1);
    Y = x(:, 2);
    
    o = sin(X + Y) + ((X - Y) .^2 ) - 1.5 * X + 2.5 * Y + 1;
end
%powel sum
function scores = F58(x)
    n = size(x, 2);
    absx = abs(x);
    
    scores = 0;
    for i = 1:n
        scores = scores + (absx(:, i) .^ (i + 1));
    end
end
%Quartic
function scores = F59(x)

    n = size(x, 2);
    
    scores = 0;
    for i = 1:n
        scores = scores + i *(x(:, i) .^ 4);
    end
     
    scores = scores + rand;
end
%Ridge
function scores = F60(x, d, alpha)

    if nargin < 3 
        alpha = 0.5;
    end
    if nargin < 2
        d = 1;
    end
        
    x1 = x(:, 1);
    scores = x1 + d * (sum(x(:, 2:end).^2, 2) .^ alpha);
end
%Schaffer N1
function scores = F61(x)
    n = size(x, 2);
    assert(n == 2, 'Schaffer function N. 1 is defined only on a 2D space.')
    X = x(:, 1);
    Y = x(:, 2);
    
    numeratorcomp = (sin((X .^ 2 + Y .^ 2) .^ 2) .^ 2) - 0.5; 
    denominatorcomp = (1 + 0.001 * (X .^2 + Y .^2)) .^2 ;
    scores = 0.5 + numeratorcomp ./ denominatorcomp;
end
%schaffer n2
function scores = F62(x)
    
    n = size(x, 2);
    assert(n == 2, 'The Schaffer N. 2 function is only defined on a 2D space.')
    X = x(:, 1);
    Y = x(:, 2);
    
    sincomponent = sin( (X .^ 2) - (Y .^ 2) ).^2;
    
    scores = 0.5 + ((sincomponent - 0.5) ./ (1 + 0.001 * (X .^2 + Y .^2)) .^2 ) ;
end
%schaffer n3
function scores = F63(x)
    n = size(x, 2);
    assert(n == 2, 'Schaffer function N. 3 is only defined on a 2D space.')
    X = x(:, 1);
    Y = x(:, 2);
    
    numeratorcomp = (sin(cos(abs(X .^ 2 - Y .^ 2))) .^ 2) - 0.5; 
    denominatorcomp = (1 + 0.001 * (X .^2 + Y .^2)) .^2 ;
    scores = 0.5 + numeratorcomp ./ denominatorcomp;
end
%shwefel 2.20
function scores = F64(x)
    scores = sum(abs(x), 2);
end
%schwefel 2.21
function scores = F65(x)
    scores = max(abs(x), [], 2);
end
%schwefel 2.23
function scores = F66(x)
    scores = sum(x .^10, 2);
end
%schwefel
function scores = F67(x)
    n = size(x, 2);
    scores = 418.9829 * n - (sum(x .* sin(sqrt(abs(x))), 2));
end
%shuburt
function scores = F68(x)
    n = size(x, 2);
    
    scores = 1;
    for i = 1:n
        inner_sum = 0;
        for j = 1:5
            inner_sum = inner_sum + j * cos(((j + 1) * x(:, i)) + j);
        end
        scores = inner_sum .* scores;
    end
end
%sum square function
function scores = F69(x)
   
   [m, n] = size(x);
   x2 = x .^2;
   I = repmat(1:n, m, 1);
   scores = sum( I .* x2, 2);
   
end
%three hump camel
function scores = F70(x)
    
    n = size(x, 2);
    assert(n == 2, 'The Three-hump camel function is only defined on a 2D space.')
    X = x(:, 1);
    Y = x(:, 2);
    
    scores = (2 * X .^ 2) - (1.05 * (X .^ 4)) + ((X .^ 6) / 6) + X .* Y + Y .^2;
end
%xing she yang
function scores = F71(x)
    n = size(x, 2);

    scores = 0;
    for i = 1:n
        scores = scores + rand * (abs(x(:, i)) .^ i);
    end
end 
%xing she yang 2
function scores = F72(x)
    n = size(x, 2);
    
    scores = sum(abs(x), 2) .* exp(-sum(sin(x .^2), 2));
end 
%xing she yang 4
function scores = F73(x)
     scores = (sum(sin(x) .^2, 2) - exp(-sum(x .^ 2, 2))) .* exp(-sum(sin(sqrt(abs(x))) .^2, 2));
end 
%zakrov 
function scores = F74(x)

    n = size(x, 2);
    comp1 = 0;
    comp2 = 0;
    
    for i = 1:n
        comp1 = comp1 + (x(:, i) .^ 2);
        comp2 = comp2 + (0.5 * i * x(:, i));
    end
     
    scores = comp1 + (comp2 .^ 2) + (comp2 .^ 4);
end
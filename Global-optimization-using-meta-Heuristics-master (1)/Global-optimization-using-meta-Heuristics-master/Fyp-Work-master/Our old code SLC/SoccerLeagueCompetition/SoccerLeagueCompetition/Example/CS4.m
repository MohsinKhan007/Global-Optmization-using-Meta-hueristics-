function z=CS4(x)

    global ProblemSettings;
   
    nVar=ProblemSettings.nVar;

    f1=x(1)^x(2)+x(2)*x(1)-5*x(1)*x(2)*x(3)-85;
    f2=x(1)^3-x(2)^x(3)-x(3)^x(2)-60;
    f3=x(1)^x(3)+x(3)^x(1)-x(2)-2;
    
    z=f1^2+f2^2+f3^2;

end
%%

% 2.6<x1<3.6
% 0.7<x2<0.8
% 17<x3<28
% 7.3<x4<8.3
% 7.3<x5<8.3
% 2.9<x6<3.9
% 5<x7<5.5
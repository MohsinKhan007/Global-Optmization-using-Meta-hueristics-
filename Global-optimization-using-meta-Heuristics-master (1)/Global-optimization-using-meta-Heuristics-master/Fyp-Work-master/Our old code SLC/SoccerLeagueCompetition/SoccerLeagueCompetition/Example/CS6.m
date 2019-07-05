function z=CS6(x)

    global ProblemSettings;
   
    nVar=ProblemSettings.nVar;

    f1=3*x(1)-cos(x(2)*x(3))-.5;
    f2=x(1)^2-625*x(2)^2-0.25;
    f3=exp(-x(1)*x(2))+20*x(3)+(10*pi-3)/3;
    
    z=f1^2+f2^2+f3^2
    
    

end
%%
% 0.05<x1<2  
% .25<x2<1.3
% 2<x3<15
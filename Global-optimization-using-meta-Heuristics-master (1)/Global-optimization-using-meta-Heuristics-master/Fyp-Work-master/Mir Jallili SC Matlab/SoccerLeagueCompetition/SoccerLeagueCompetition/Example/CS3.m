function z=CS3(x)

    global ProblemSettings;
   
    nVar=ProblemSettings.nVar;
    
    f1=x(1)+x(2)^4*x(4)*x(6)/4+.75;
    f2=x(2)+.405*exp(1+x(1)*x(2))-1.405;
    f3=x(3)-x(4)*x(6)/2+1.5;
    f4=x(4)-.605*exp(1-x(3)^2)-0.395;
    f5=x(5)-x(2)*x(6)/2+1.5;
    f6=x(6)-x(1)*x(5);
    
    z=f1^2+f2^2+f3^2+f4^2+f5^2+f6^2;

end
%%

% 0<xi<1 i=1,..,nVar
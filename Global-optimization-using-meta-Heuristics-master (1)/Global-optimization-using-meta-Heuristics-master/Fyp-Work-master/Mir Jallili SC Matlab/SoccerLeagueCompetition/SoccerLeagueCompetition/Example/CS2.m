function z=CS2(x)

    global ProblemSettings;
   
    nVar=ProblemSettings.nVar;

    f(1)=(3-5*x(1))*x(1)+1-2*x(2);
    for i=2:nVar-1
        f(i)=(3-5*x(i))*x(i)+1-x(i-1)-2*x(i+1);
    end
    f(nVar)=(3-5*x(nVar))*x(nVar)+1-x(nVar-1);
    
    z=0;
    for i=1:nVar
    z=z+f(i)^2;
    end
    
    
%%

% 0<xi<1 i=1,..,nVar
function z=CS7(x)

    global ProblemSettings;
   
    nVar=ProblemSettings.nVar;

    f1=x(1)^3-3*x(1)*x(2)^2-1;
    f2=3*x(1)^2*x(2)-x(2)^3+1;
    
    z=f1^2+f2^2;
    

end
%%
% 0.1<xi<2  i=1,4
% .1<xi<10  i=2,3

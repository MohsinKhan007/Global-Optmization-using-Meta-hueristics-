function z=CS5(x)

    global ProblemSettings;
   
    nVar=ProblemSettings.nVar;

    f1=exp(x(1)^2)-8*x(1)*sin(x(2));
    f2=x(1)+x(2)-1;
    f3=(x(3)-1)^3;
    
    z=f1^2+f2^2+f3^2;
    

end
%%
% 0<xi<100  i=1,2
% 10<xi<200 i=3,4

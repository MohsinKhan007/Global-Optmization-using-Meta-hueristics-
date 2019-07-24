function z=CP4(x)

    global ProblemSettings;
   
    nVar=ProblemSettings.nVar;

z=(x(1)^4+x(2)^4+x(3)^4-3)^2+(x(1)^3-x(2)^3+x(3)^3-1)^2+(x(1)^2+x(2)^2-x(3)^2-1)^2;

end
%%

% 0<xi<10 i=1,..,nVar
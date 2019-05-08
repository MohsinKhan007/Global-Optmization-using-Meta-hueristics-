function z=CB2(x)

    global ProblemSettings;
   
    nVar=ProblemSettings.nVar;

z=0;
for i=1:nVar
    z=z+(x(i)^2-1)^2;
end
%%

% 0<xi<1 i=1,..,nVar
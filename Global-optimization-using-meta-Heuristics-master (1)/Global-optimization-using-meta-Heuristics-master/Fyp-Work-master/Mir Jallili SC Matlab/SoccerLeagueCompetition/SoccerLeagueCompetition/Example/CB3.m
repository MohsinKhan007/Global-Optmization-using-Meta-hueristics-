function z=CB3(x)

    global ProblemSettings;
   
    nVar=ProblemSettings.nVar;

z=0;
for i=1:nVar
    z=z+(cos(x(i))-1)^2;

end


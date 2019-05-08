function z=CB1(x)

    global ProblemSettings;
   
    nVar=ProblemSettings.nVar;

z=0;
for i=1:nVar-1
    z=z+(x(i)*x(i+1)-1)^2;
end
z=z+(x(nVar)*x(1)-1)^2;
    

end
%%
% 0<xi<100  i=1,2
% 10<xi<200 i=3,4

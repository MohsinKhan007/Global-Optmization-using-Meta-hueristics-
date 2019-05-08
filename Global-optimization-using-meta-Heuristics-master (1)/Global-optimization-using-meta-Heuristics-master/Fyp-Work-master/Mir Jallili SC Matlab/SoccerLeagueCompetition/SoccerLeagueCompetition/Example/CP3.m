function z=CP3(x)

    global ProblemSettings;
   
    nVar=ProblemSettings.nVar;

   z=(x(1)^2+x(2)^2+x(3)^2-9)^2+(x(1)*x(2)*x(3)-1)^2+(x(1)+x(2)-x(3)^2)^2;

end
%%


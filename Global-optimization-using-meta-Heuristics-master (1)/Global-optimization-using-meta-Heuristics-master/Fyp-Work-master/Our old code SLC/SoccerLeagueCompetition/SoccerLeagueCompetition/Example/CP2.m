function z=CP2(x)

    global ProblemSettings;
   
    nVar=ProblemSettings.nVar;
z=(x(1)*x(3)+x(4)*x(1)+x(4)*x(3))^2+(x(2)*x(3)+x(4)*x(2)+x(4)*x(3))^2+(x(1)*x(2)+x(1)*x(3)+x(2)*x(3)-1)^2+(x(1)*x(2)+x(4)*x(1)+x(4)*x(2))^2;

end
%%
% 78<x1<102
% 33<x2<45
% 27<xi<45 i=3,4,5
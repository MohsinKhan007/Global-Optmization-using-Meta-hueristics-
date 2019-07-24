function [League,nEval]=WinnerFunctionResrve3(League,Winner,nEval)

    global ProblemSettings;
    global SCASettings;
   
   
    VarSize=ProblemSettings.VarSize;
    VarMin=ProblemSettings.VarMin;
    VarMax=ProblemSettings.VarMax;
    
    nMainPlayer=SCASettings.nMainPlayer;
    nReservePlayer=SCASettings.nReservePlayer;
    CostFunction=ProblemSettings.CostFunction;
     
for i=1:nReservePlayer
           xxx=0;
           for jj=1:nMainPlayer
             xxx=xxx+League(Winner,1).MPlayer(jj,1).Position;
           end
           Gravity=xxx/nMainPlayer;
        
           x=League(Winner,1).RPlayer(end,1).Position;

           beta=unifrnd(.9,1,VarSize);
           rq=min(max(Gravity+beta.*(Gravity-x),VarMin),VarMax);

           NewSol.Position=rq;
           nEval=nEval+1;
           NewSol.Cost=CostFunction(NewSol.Position);
        
           if NewSol.Cost<League(Winner,1).RPlayer(end,1).Cost
               League(Winner,1).RPlayer(end,1)=NewSol;   
           else
           beta=unifrnd(0.45,.45,VarSize);
           rq=min(max(Gravity+beta.*(x-Gravity),VarMin),VarMax);
           NewSol.Position=rq;
           nEval=nEval+1;
           NewSol.Cost=CostFunction(NewSol.Position);
           if NewSol.Cost<League(Winner,1).RPlayer(end,1).Cost
               League(Winner,1).RPlayer(end,1)=NewSol;
           else   
           zz.Position=unifrnd(VarMin,VarMax,VarSize);
           nEval=nEval+1;
           zz.Cost=CostFunction(zz.Position);
           League(Winner,1).RPlayer(end,1)=zz;
           end
           end
           MainPlayer=League(Winner,1).MPlayer;
           RvrsPlayer=League(Winner,1).RPlayer;
           Player=[MainPlayer;RvrsPlayer];
           PlayerCost=[Player.Cost];
           [a1, SortOrder]=sort(PlayerCost);
           Player=Player(SortOrder);
           League(Winner,1).MPlayer=Player(1:nMainPlayer);
           League(Winner,1).RPlayer=Player(nMainPlayer+1:nMainPlayer+nReservePlayer);
end
end
            


        



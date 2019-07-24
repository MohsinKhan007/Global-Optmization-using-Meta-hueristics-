function [League,nEval]=WinnerFunctionMain3(League,Winner,nEval)

    global ProblemSettings;
    global SCASettings;
   
    alpha=2;            % Coefficient
    beta=2;             % Coefficient
    
    VarSize=ProblemSettings.VarSize;
    VarMin=ProblemSettings.VarMin;
    VarMax=ProblemSettings.VarMax;

    nMainPlayer=SCASettings.nMainPlayer;
    CostFunction=ProblemSettings.CostFunction;
    
        for i=1:nMainPlayer
              w=unifrnd(.7,1,VarSize);
              xxx.Position=w.*League(Winner,1).MPlayer(i,1).Position...
                                +alpha*rand*(League(Winner,1).MPlayer(1,1).Position-League(Winner,1).MPlayer(i,1).Position)...
                                +beta*rand*(League(1,1).MPlayer(1,1).Position-League(Winner,1).MPlayer(i,1).Position);                     
              xxx.Position=min(max(xxx.Position,VarMin),VarMax);
              nEval=nEval+1;
              xxx.Cost=CostFunction(xxx.Position);
              if xxx.Cost<League(Winner,1).MPlayer(i,1).Cost
              League(Winner,1).MPlayer(i,1)=xxx;
              else
              w=unifrnd(0,.7,VarSize);
              xxx.Position=w.*League(Winner,1).MPlayer(i,1).Position...
                                +alpha*rand*(League(Winner,1).MPlayer(1,1).Position-League(Winner,1).MPlayer(i,1).Position)...
                                +beta*rand*(League(1,1).MPlayer(1,1).Position-League(Winner,1).MPlayer(i,1).Position);
              xxx.Position=min(max(xxx.Position,VarMin),VarMax);
              nEval=nEval+1;
              xxx.Cost=CostFunction(xxx.Position);             
              if xxx.Cost<League(Winner,1).MPlayer(i,1).Cost
                            League(Winner,1).MPlayer(i,1)=xxx;                       
                            MainPlayer=League(Winner,1).MPlayer;
                            Player=[MainPlayer];
                            PlayerCost=[Player.Cost];
                            [a1, SortOrder]=sort(PlayerCost);
                            Player=Player(SortOrder);
                            League(Winner,1).MPlayer=Player(1:nMainPlayer);
              end
              end
    
        end
end
        
                            
            
            

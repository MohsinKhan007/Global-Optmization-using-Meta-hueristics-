function League=CreateInitialLeague()

    global ProblemSettings;
    global SCASettings;

    CostFunction=ProblemSettings.CostFunction;
    VarSize=ProblemSettings.VarSize;
    VarMin=ProblemSettings.VarMin;
    VarMax=ProblemSettings.VarMax;
    

    nTeam=SCASettings.nTeam;
    nMainPlayer=SCASettings.nMainPlayer;
    nReservePlayer=SCASettings.nReservePlayer;
    
    
    
   for j=1:nTeam
    for i=1:nMainPlayer

        League(j,1).MPlayer(i,1).Position=unifrnd(VarMin,VarMax,VarSize);
        
        League(j,1).MPlayer(i,1).Cost=CostFunction(League(j,1).MPlayer(i,1).Position);
        
    end
    for i=1:nReservePlayer
        
        League(j,1).RPlayer(i,1).Position=unifrnd(VarMin,VarMax,VarSize);
        
        League(j,1).RPlayer(i,1).Cost=CostFunction(League(j,1).RPlayer(i,1).Position);
        
    end
   end
          
%% Takhsis
League=Takhsis(League);
%% 

League=UpdateTotalCost(League);
    
end
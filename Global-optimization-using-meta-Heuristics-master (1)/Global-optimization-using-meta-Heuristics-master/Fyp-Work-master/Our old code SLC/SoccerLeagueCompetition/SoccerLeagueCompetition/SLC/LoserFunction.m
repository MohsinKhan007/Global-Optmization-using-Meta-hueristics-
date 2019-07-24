function [League,nEval]=LoserFunction(League,Loser,nEval)

    global ProblemSettings;
    global SCASettings;
   
    nVar=ProblemSettings.nVar;
    
    VarMin=ProblemSettings.VarMin;
    VarMax=ProblemSettings.VarMax;
    
    nMainPlayer=SCASettings.nMainPlayer;
    nReservePlayer=SCASettings.nReservePlayer;
    CostFunction=ProblemSettings.CostFunction;
%%

    
        A=randperm(nMainPlayer);
        a=A(1);
        b=A(2);
        c=A(3);
           
        
        x=League(Loser,1).MPlayer(a,1);
        y=League(Loser,1).MPlayer(b,1);
        z=League(Loser,1).MPlayer(c,1);
%%       
        mu=.02;
        sigma=0.1*(VarMax-VarMin);
        nMu=ceil(mu*nVar);
        j=randsample(nVar,nMu);
        x1=x.Position;
        x1(j)=x.Position(j)+sigma*randn(size(j))';
%%        
        nMu=ceil(mu*nVar);
        j=randsample(nVar,nMu);
        y1=y.Position;    
        y1(j)=y.Position(j)+sigma*randn(size(j))';
%%
        nMu=ceil(mu*nVar);
        j=randsample(nVar,nMu);   
        z1=z.Position;   
        z1(j)=z.Position(j)+sigma*randn(size(j))';
%%                
        x1=min(max(x1,VarMin),VarMax);
        y1=min(max(y1,VarMin),VarMax);
        z1=min(max(z1,VarMin),VarMax);        
        xx.Position=x1;
        yy.Position=y1;
        zz.Position=z1;    
        
        nEval=nEval+3;
        xx.Cost=CostFunction(xx.Position);
        yy.Cost=CostFunction(yy.Position);
        zz.Cost=CostFunction(zz.Position);
        
        if xx.Cost<x.Cost
            League(Loser,1).MPlayer(a,1)=xx;
        end
               
        if yy.Cost<y.Cost
            League(Loser,1).MPlayer(b,1)=yy;
        end
               
        if zz.Cost<z.Cost
            League(Loser,1).MPlayer(c,1)=zz;
        end  
          
%%            % Crossover 
kkk=0;
for i=1:nReservePlayer   
    kkk=kkk+1;
        A=randperm(nReservePlayer);
            
        a=A(1);
        b=A(2);
      
        x1=League(Loser,1).RPlayer(a,1).Position;
        x2=League(Loser,1).RPlayer(b,1).Position;
        
        
         alpha=rand(size(x1));
    
         y1=alpha.*x1+(1-alpha).*x2;
         y2=alpha.*x2+(1-alpha).*x1;
       
        
        NewSol(kkk).Position=y1;
        nEval=nEval+1;
        NewSol(kkk).Cost=CostFunction(NewSol(kkk).Position);
        kkk=kkk+1;

        
        NewSol(kkk).Position=y2;
        nEval=nEval+1;
        NewSol(kkk).Cost=CostFunction(NewSol(kkk).Position);
        

end
%%             
        %% Sort
    MainPlayer=League(Loser,1).MPlayer;
    RvrsPlayer=League(Loser,1).RPlayer;

   Player=[MainPlayer;
            RvrsPlayer;
                NewSol'];
    PlayerCost=[Player.Cost];
    
    [a1, SortOrder]=sort(PlayerCost);

    Player=Player(SortOrder);
        

    League(Loser,1).MPlayer=Player(1:nMainPlayer);
    League(Loser,1).RPlayer=Player(nMainPlayer+1:nMainPlayer+nReservePlayer);

end



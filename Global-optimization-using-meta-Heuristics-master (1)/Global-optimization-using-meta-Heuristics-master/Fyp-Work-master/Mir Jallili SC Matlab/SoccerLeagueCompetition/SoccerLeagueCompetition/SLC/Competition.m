function [League,nEval]=Competition(League,it,nEval);

   
    global SCASettings;
    nTeam=SCASettings.nTeam;
    
    
   for ii=1:nTeam-2
        for jj=ii+1:nTeam
            [Winner, Loser]=ProbabilityHost(League,ii,jj);
            [League,nEval]=Imitation(League,Winner,nEval);
            [League,nEval]=LoserFunction(League,Loser,nEval);
            League=UpdateTotalCost(League);
        end
   end
            
end
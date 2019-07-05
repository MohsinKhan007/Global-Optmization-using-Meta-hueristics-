function [Winner Loser]=ProbabilityHost(League,ii,jj);
Psimple=(League(ii).TotalCost)/(League(ii).TotalCost+League(jj).TotalCost);
Phost=Psimple;
if rand<Phost
    Winner=ii;
    Loser=jj;
else
    Winner=jj;
    Loser=ii;
end
end

  
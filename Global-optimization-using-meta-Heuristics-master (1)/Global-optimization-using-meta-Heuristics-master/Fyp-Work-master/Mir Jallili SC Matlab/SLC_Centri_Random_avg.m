%Sunday 19/5/2019
%Adding Personal Best 
%covergencing with the Probolobility
avgsum=0;
 
for i=1:30
    
[lb,ub,dim,fobj] = Get_Functions_details('F23');
avsum=0;
%for av=1:30
%inicilize population
Leader_score=inf;
NU=5;
US=10;
Unit=[];
Unit_Cap=[];
Unit_Best=[];
convergence_curve=[];
MT=500;
spirit_power_factor=100/MT;
spirit_power_factor=spirit_power_factor/100;
AO=1/NU;

t=0;
SP=1; %SP(Stleath Parameter)



%inicilize The Captains of the Squads
for i=1:NU
Unit_Cap{i}.fitness=Leader_score;    
Unit_Cap{i}.index=1;
Unit_Cap{i}.upper_limit=ub;
Unit_Cap{i}.lower_limit=lb;

end
%check boundries of each soldeir position
    for i=1:NU  
       Boundary_no= size(ub,2);
       
       if Boundary_no==1
        Unit{i}=rand(US,dim).*(ub-lb)+lb;
       end
       
       if Boundary_no>1
    for j=1:dim
        ub_i=ub(j);
        lb_i=lb(j);
        %ij=Unit(i);
        Unit{i}(:,j)=rand(US,1).*(ub_i-lb_i)+lb_i;
    end
        end
    end
     
    
    for i=1:NU
    cap=Unit_Cap{i}.index;
    for k=1:US    
        fitness=fobj(Unit{i}(k,:));
        if(fitness<Unit_Cap{i}.fitness)
            Unit_Cap{i}.index=k;
            Unit_Cap{i}.fitness=fitness;
        end
    end
    Unit_best{i}=Unit{i}(Unit_Cap{i}.index,:);
    end



while t<MT
    
   
        %Random Movement of Captians
        for u=1:NU
        %random Position
        Boundary_no= size(ub,2);
       %random movement for 1d
       if Boundary_no==1
        randPos=rand(1,dim).*(ub-lb)+lb;
        Unit{u}(Unit_Cap{u}.index,:)=randPos;
        R=(AO/2)*abs(abs(ub)-abs(lb));
        for s=1:US
            r=-1+(1+1)*rand();
        Unit{u}(s,:)=randPos+r*R;
        end
       end
       %random movement for N_D
       if Boundary_no>1
    for j=1:dim
        ub_i=ub(j);
        lb_i=lb(j);
        randPos(j)=rand(1,1).*(ub_i-lb_i)+lb_i;
         R=(AO/2)*abs(abs(ub_i)-abs(lb_i));
        for s=1:US
            r=-1+(1+1)*rand();
        Unit{u}(s,j)=randPos(j)+r*R;
        end
    end
    Unit{u}(Unit_Cap{u}.index,:)=randPos;
       end
       %Update Cap and Best info of unit
        cap=Unit_Cap{u}.index;
    for s=1:US    
        fitness=fobj(Unit{u}(s,:));
        if(fitness<Unit_Cap{u}.fitness)
            Unit_Cap{u}.index=s;
            Unit_Cap{u}.fitness=fitness;
         end
    
    end
    if(fobj(Unit_best{u})>fobj(Unit{u}(Unit_Cap{u}.index,:)))
        Unit_best{u}=Unit{u}(Unit_Cap{u}.index,:);
    end
        end 
     
    %Aggresive scouting Attack(exploitation)
    for j=1:NU
     for k=1:US
    
        upper_range=2;
        lower_range=-2;
        better=Unit{j}(k,:);
         for z=0:4
        temp =(((upper_range-lower_range)*rand()-lower_range)*Unit{j}(k,:))+(2*rand())*(Unit_best{j}-Unit{j}(k,:));
       
         temp=inBounds(temp,ub,lb,dim);
        
        if(fobj(better)>fobj(temp))
        better=temp;
        end
        Unit{j}(k,:)= better;
        
        upper_range=upper_range/2;
        lower_range=lower_range/2;
         end
        
    end
    
end
      
        
       
       
   for u=1:NU
        cap=Unit_Cap{u}.index;
    for s=1:US    
        fitness=fobj(Unit{u}(s,:));
        if(fitness<Unit_Cap{u}.fitness)
            Unit_Cap{u}.index=s;
            Unit_Cap{u}.fitness=fitness;
         end
    
    end
    if(fobj(Unit_best{u})>fobj(Unit{u}(Unit_Cap{u}.index,:)))
        Unit_best{u}=Unit{u}(Unit_Cap{u}.index,:);
    end
   end
     
     min=Unit_best{1};
   for u=1:NU
   if(fobj(min)>fobj(Unit_best{u}))
   min=Unit_best{u};
   end
   end
   
    %BestPos=min
    BestVal=fobj(min);
    convergence_curve(t+1)= fobj(min);
    
    
    spf=spirit_power_factor;
    SP=SP-spirit_power_factor;
      
t=t+1;
end
avgsum=avgsum+BestVal;
%avsum=avsum+BestVal;
%end
 
 %avsum=avsum/30
 
 
end
Avg_value=avgsum/30
%  
% subplot(1,2,1);
% semilogy(convergence_curve,'Color','r')
% title('Objective space')
% xlabel('Iteration');
% ylabel('Best score obtained so far');
% 
% axis tight
% grid on
% box on
% legend('Scouting procedure')






function soldier=inBounds(soldier,ub,lb,dim)
        
        
        for z=1:dim
        if(size(ub,2)==1)
 % Return back the search agents that go beyond the boundaries of the search space
        Flag4ub=soldier(z)>ub;
        Flag4lb=soldier(z)<lb;
        soldier(z)=(soldier(z).*(~(Flag4ub+Flag4lb)))+ub.*Flag4ub+lb.*Flag4lb;
        end
        if(size(ub,2)>1)
              Flag4ub=soldier(z)>ub(z);
        Flag4lb=soldier(z)<lb(z);
        soldier(z)=(soldier(z).*(~(Flag4ub+Flag4lb)))+ub.*Flag4ub+lb.*Flag4lb;
            
            
        end
        
        
        end
end



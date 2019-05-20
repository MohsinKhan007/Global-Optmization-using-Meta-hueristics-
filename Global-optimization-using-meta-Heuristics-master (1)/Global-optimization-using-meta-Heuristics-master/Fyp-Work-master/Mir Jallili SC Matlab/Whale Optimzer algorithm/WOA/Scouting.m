clc 
clear 

[lb,ub,dim,fobj] = Get_Functions_details('F23');
%inicilize population
Leader_score=inf;
No_Units=3;
U_size=10;
Unit=[];
Unit_Cap=[];
convergence_curve=[];
max_iterations=200;
spirit_power_factor=100/max_iterations;
decreament_factor=spirit_power_factor/100;
decreament_factor=spirit_power_factor/100;
current_spirit_factor=decreament_factor;
t=0;
%ub

for i=1:U_size
Unit_Cap{i}.fitness=Leader_score;    
Unit_Cap{i}.index=1;
Unit_Cap{i}.upper_limit=ub;
Unit_Cap{i}.lower_limit=lb;    
end
%ub
%randomly Generating solutions
%&x=randi([-5, 5])
while t<max_iterations
  for i=1:No_Units  
       Boundary_no= size(ub,2);
       
       if Boundary_no==1
        Unit{i}=rand(U_size,dim).*(ub-lb)+lb;
       end
       if Boundary_no>1
    for j=1:dim
        ub_i=ub(j);
        lb_i=lb(j);
        Unit{i}(:,j)=rand(U_size,1).*(ub_i-lb_i)+lb_i;
    end
       end
  end
% If each variable has a different lb and ub

    %Unit{3}(:,30)
 
  % size(Unit{1},1);
    %Unit{1}(1,:)

for j=1:No_Units
    cap=Unit_Cap{j}.index;
    for k=1:U_size    
        fitness=fobj(Unit{j}(k,:));
        if(fitness<Unit_Cap{j}.fitness)
            Unit_Cap{j}.index=k;
            Unit_Cap{j}.fitness=fitness;
         end
    
    end
   
    if(cap==Unit_Cap{j}.index && t~=1)
        Unit_Cap{j}.upper_limit=ub-current_spirit_factor.*abs(ub);
        Unit_Cap{j}.lower_limit=lb+current_spirit_factor.*abs(lb);
        randPos=[];
        
        Boundary_no= size(ub,2);
       
       if Boundary_no==1
        randPos=rand(1,dim).*(Unit_Cap{j}.upper_limit-Unit_Cap{j}.lower_limit)+Unit_Cap{j}.lower_limit;
       end
       if Boundary_no>1
    for m=1:dim
        ub_i=Unit_Cap{j}.upper_limit(m);
        lb_i=Unit_Cap{j}.lower_limit(m);
        randPos{j}=rand(1,1).*(ub_i-lb_i)+lb_i;
        
    end
    
        
       end
        
       if fobj(randPos)<fobj(Unit{j}(cap,:))
          Unit{j}(cap,:)=randPos;
           
       end
    end
      
   
end


for j=1:No_Units
    for k=1:U_size
    cmnd = randi(1)*(Unit{j}(Unit_Cap{j}.index,:)-Unit{j}(k,:));
    Unit{j}(k,:)=Unit{j}(Unit_Cap{j}.index,:)+cmnd;
    
    
    end
    
end
current_spirit_factor=current_spirit_factor+decreament_factor;


    %if(Unit_Cap{1}.fitness<Unit_Cap{2}.fitness&&Unit_Cap{1}.fitness<Unit_Cap{3}.fitness)
min=Unit_Cap{1}.fitness;
        for x=1:No_Units
        
            if(min>Unit_Cap{x+1}.fitness)
            min=Unit_Cap{x+1}.fitness;
            end
        
        end
        
      convergence_curve(t+1)=min;
    
      
t=t+1;
end
convergence_curve
subplot(1,2,1);
semilogy(convergence_curve,'Color','r')
title('Objective space')
xlabel('Iteration');
ylabel('Best score obtained so far' );

axis tight
grid on
box on
legend('Scouting procedure')







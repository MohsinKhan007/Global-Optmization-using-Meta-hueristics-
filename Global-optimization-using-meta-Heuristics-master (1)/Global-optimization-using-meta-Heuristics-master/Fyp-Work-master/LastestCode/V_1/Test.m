clear;
clc;
Data = {};
%% Defining Strut
Member.Position = [];
Member.Cost = inf;

%% Defining Parameters & Declaring Units
TotalUnits = 5;
UnitSize = 15;
Iterations = 1500;
ScoutingRate = 0.0;
ReGroupingRate = 0.0;

Captains = {TotalUnits};
Units = {TotalUnits};
Chief = Member;

for i = 1:TotalUnits
    Units{i} = repmat(Member, 1, UnitSize);
end

%% Main Loop
Runs = 1;
a = 'F';
b = 1;
for b = 1:1
    Sum = [1:Runs];
    for run = 1:Runs
        fun = [a num2str(b)];
        [lb,ub,dim,fobj] = GetFunctionsDetails(fun);
        % Initialization
        for i = 1 : TotalUnits
            Positions = Initialization(UnitSize, dim, lb, ub);
            for j = 1 : UnitSize
                Units{i}(j).Position = Positions(j, :);
                Units{i}(j).Cost = fobj(Units{i}(j).Position);
            end
            Units{i} = SortStructs(Units{i});
            Captains{i} = Units{i}(1);
        end
        t = 1;
        BestCost = zeros(Iterations, 1);
        % Scouting
        while t < Iterations * ScoutingRate
            for i = 1:TotalUnits
                for j = 2:UnitSize
                    P = Captains{i}.Position + unifrnd(-1, 1, [1, dim]) * (1 - t / Iterations);
                    % Apply Bounds
%                     Flag4ub=Captains{i}.Position(1,:)>ub
%                     Flag4lb=Captains{i}.Position(1,:)<lb
%                     Captains{i}.Position(1,:)=(Captains{i}.Position(1,:).*(~(Flag4ub+Flag4lb)))+ub.*Flag4ub+lb.*Flag4lb;
%         
                    C = fobj(P);
                    if C < Captains{i}.Cost
                        Captains{i}.Position = P;
                        Captains{i}.Cost = C;
                    end
                    P = Units{i}(j).Position + ((Captains{i}.Position - Units{i}(j).Position) .* unifrnd(0, 1, [1 dim]) * 2);
                    % Apply Bounds
                    Flag4ub=Captains{i}.Position(1,:)>ub;
                    Flag4lb=Captains{i}.Position(1,:)<lb;
                    Captains{i}.Position(1,:)=(Captains{i}.Position(1,:).*(~(Flag4ub+Flag4lb)))+ub.*Flag4ub+lb.*Flag4lb;
                    C = fobj(P);
                    if C < Captains{i}.Cost
                        Captains{i}.Position = P;
                        Captains{i}.Cost = C;
                    end
                    if C < Units{i}(j).Cost
                        Units{i}(j).Position = P;
                        Units{i}(j).Cost = C;
                    end
                end
            end
            t = t + 1;
            rslt = inf;
            for i = 1:TotalUnits
                if rslt > Captains{i}.Cost
                    rslt = Captains{i}.Cost;
                end
            end
             disp(['Iteration: ' num2str(t) ' Best Cost: ' num2str(rslt)]);
            BestCost(t) = rslt;
        end
        %t
        % Regrouping
        index = 0;
        for i = 1:TotalUnits
            if Chief.Cost > Captains{i}.Cost
                Chief.Position = Captains{i}.Position;
                Chief.Cost = Captains{i}.Cost;
                index = i;
            end
        end
        while t < ((Iterations * ReGroupingRate)+(Iterations * ScoutingRate))
            for i = 1:TotalUnits
                for j = 2:UnitSize
                    % Chief having Random Walk
                    P = Captains{index}.Position + unifrnd(-1, 1, [1, dim]) * (1 - t / Iterations);
% %                     % Apply Bounds
%                     Flag4ub=Captains{i}.Position(1,:)>ub;
%                     Flag4lb=Captains{i}.Position(1,:)<lb;
%                     Captains{i}.Position(1,:)=(Captains{i}.Position(1,:).*(~(Flag4ub+Flag4lb)))+ub.*Flag4ub+lb.*Flag4lb;
                    C = fobj(P);
                    if C < Captains{index}.Cost
                        Captains{index}.Position = P;
                        Captains{index}.Cost = C;
                    end
                    % Captains following Chief
                    if i ~= index
                        P = Captains{i}.Position + ((Captains{index}.Position - Captains{i}.Position) .* unifrnd(0, 1, [1 dim]) * 2);
                        % Apply Bounds
%                         Flag4ub=Captains{i}.Position(1,:)>ub;
%                         Flag4lb=Captains{i}.Position(1,:)<lb;
%                         Captains{i}.Position(1,:)=(Captains{i}.Position(1,:).*(~(Flag4ub+Flag4lb)))+ub.*Flag4ub+lb.*Flag4lb;
                        C = fobj(P);
                        if C < Captains{index}.Cost
                            Captains{index}.Position = P;
                            Captains{index}.Cost = C;
                        end
                        if C < Captains{i}.Cost
                            Captains{i}.Position = P;
                            Captains{i}.Cost = C;
                        end
                    end
                    % Soldiers Following Captains
                    P = Units{i}(j).Position + ((Captains{i}.Position - Units{i}(j).Position) .* unifrnd(0, 1, [1 dim]) * 2);
                    % Apply Bounds
                    Flag4ub=Captains{i}.Position(1,:)>ub;
                    Flag4lb=Captains{i}.Position(1,:)<lb;
                    Captains{i}.Position(1,:)=(Captains{i}.Position(1,:).*(~(Flag4ub+Flag4lb)))+ub.*Flag4ub+lb.*Flag4lb;
                    C = fobj(P);
                    if C < Captains{i}.Cost
                        Captains{i}.Position = P;
                        Captains{i}.Cost = C;
                    end
                    if C < Units{i}(j).Cost
                        Units{i}(j).Position = P;
                        Units{i}(j).Cost = C;
                    end
                end
            end
            t = t + 1;
            rslt = inf;
            for i = 1:TotalUnits
                if rslt > Captains{i}.Cost
                    rslt = Captains{i}.Cost;
                end
            end
             disp(['Iteration: ' num2str(t) ' Best Cost: ' num2str(rslt)]);
            BestCost(t) = rslt;
        end
        %
        % Attack
        while t < Iterations
            for i = 1:TotalUnits
                
                CM1 = Captains{i}.Position - Units{i}(2).Position;
                    P1 = Units{i}(2).Position + (CM1.* unifrnd(0, 1, [1 dim]) * 2);
                    
                CM2= Captains{i}.Position - Units{i}(3).Position;
                    P2 = Units{i}(3).Position + (CM2 .* unifrnd(0, 1, [1 dim]) * 2);    
                
%                     Flag4ub=Captains{i}.Position(1,:)>ub;
%                     Flag4lb=Captains{i}.Position(1,:)<lb;
%                     %Captains{i}.Position(1,:)=(Captains{i}.Position(1,:).*(~(Flag4ub+Flag4lb)))+ub.*Flag4ub+lb.*Flag4lb;
                    C1 = fobj(P1);
                    C2 = fobj(P2);
                    
                    if C1 < Captains{i}.Cost
                        Captains{i}.Position = P1;
                        Captains{i}.Cost = C1;
                    end
                    if C1 < Units{i}(j).Cost
                        Units{i}(j).Position = P1;
                        Units{i}(j).Cost = C1;
                    end
                    
                    
                    
                    if C2 < Captains{i}.Cost
                        Captains{i}.Position = P2;
                        Captains{i}.Cost = C2;
                    end
                    if C2 < Units{i}(j).Cost
                        Units{i}(j).Position = P2;
                        Units{i}(j).Cost = C2;
                    end
                    
                    
                
                for j = 2:UnitSize/2
                    P = Captains{i}.Position + unifrnd(-1, 1, [1, dim]) * (1 - t / Iterations);
                    % Apply Bounds
                    Flag4ub=Captains{i}.Position(1,:)>ub;
                    Flag4lb=Captains{i}.Position(1,:)<lb;
                    Captains{i}.Position(1,:)=(Captains{i}.Position(1,:).*(~(Flag4ub+Flag4lb)))+ub.*Flag4ub+lb.*Flag4lb;
                    C = fobj(P);
                    if C < Captains{i}.Cost
                        Captains{i}.Position = P;
                        Captains{i}.Cost = C;
                    end
                    
%                     % add inverted Wedge formation
%                    for even 4,6,8
                    E1 = Captains{i}.Position - Units{i}(j+2).Position;
                    C1 = Units{i}(j+2).Position + (E1.* unifrnd(0, 1, [1 dim]) * 2);
                    
                    E2 = Units{i}(j).Position - Units{i}(j+2).Position;
                    C2 = Units{i}(j+2).Position + (E2.* unifrnd(0, 1, [1 dim]) * 2);
                    
                        % for odd 5,7,9
                    E3 = Captains{i}.Position - Units{i}(j+3).Position;
                    C3 = Units{i}(j+3).Position + (E3.* unifrnd(0, 1, [1 dim]) * 2);
                    
                    E4 = Units{i}(j+1).Position - Units{i}(j+3).Position;
                    C4 = Units{i}(j+3).Position + (E4.* unifrnd(0, 1, [1 dim]) * 2);
                    
                    
                    
                    
               
                    eq1 = fobj(C1);
                    eq2 = fobj(C2);
                    
                    if(eq1<eq2)
                    eq_1=eq1;
                    pos_1=C1;
                    else
                        eq_1=eq2;
                        pos_1=C2;
                    end
                    
                    
                    eq3 = fobj(C3);
                    eq4 = fobj(C4);
                    
                    
                    if(eq3<eq4)
                        eq_2=eq3;
                        pos_2=C3;
                    else
                        eq_2=eq4;
                        pos_2=C4;
                    end
                    
                    
                    if(eq_1<Captains{i}.Cost)
                        Captains{i}.Position = pos_1;
                        Captains{i}.Cost = eq1;
                    end
                    
                    if(eq_1<Units{i}(j+2).Cost)
                        Units{i}(j+2).Position=pos_1;
                        Units{i}(j+2).Cost=eq_1;
                    end  
                    
                    
                    
                    if(eq_2<Captains{i}.Cost)
                        Captains{i}.Position = pos_2;
                        Captains{i}.Cost = eq2;
                    end
                    
                    if(eq_2<Units{i}(j+3).Cost)
                        Units{i}(j+3).Position=pos_2;
                        Units{i}(j+3).Cost=eq_2;
                    end  
                    
                    
                    
                 
                    
                    
                    
                    
                    
                    

                end
            end
            t = t + 1;
            rslt = inf;
            for i = 1:TotalUnits
                if rslt > Captains{i}.Cost
                    rslt = Captains{i}.Cost;
                end
            end
             disp(['Iteration: ' num2str(t) ' Best Cost: ' num2str(rslt)]);
            BestCost(t) = rslt;
        end
        %}
        Sum(run) = BestCost(Iterations, 1);
        %
        figure;
        semilogy(BestCost, 'LineWidth', 1);
        xlabel('Iterations');
        ylabel([fun ' - Cost']);
        disp(fun);
        %}
        display([fun ' ---> Run: ' num2str(run)]);
    end
    Summation = 0;
    for h = 1:Runs
        Summation = Summation + Sum(h);
    end
    avg = Summation/Runs;
    disp([fun]);
    disp(['Avg: ' num2str(avg)]);
    % Check it, is it correct?
    StdDev = 0;
    for h = 1:Runs
        StdDev = StdDev + (Sum(h) - avg)^2;
    end
    StdDev = sqrt(StdDev / Runs);
    disp(['StdDev: ' num2str(StdDev)]);
    disp(['BestOne: ' num2str(min(Sum))]);
    
    Data{b, 1} = fun;
    Data{b, 2} = avg;
    Data{b, 3} = StdDev;
    Data{b, 4} = min(Sum);
    for k=1:Runs
        Data{b, 5+k} = Sum(k);
    end
    display(['--> ' fun ' - Done']);
end
%xlswrite('War Strategy Algo', Dat5a);
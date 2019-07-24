
%% Soccer League Competition Algorithm (For Continuous Decision Variables)
%% Developed By: Naser Moosavian
clc;clear all; close all;

[lb,ub,dim,fobj]=GetFunctionsDetails('F1')

%% Problem Definition
CostFunction=fobj; % Cost Function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
NumberofFunctionEvaluation=50000;
nVar=dim;         % Number of Decision Variables
nTeam=5;            % Number of Teams
nMainPlayer=nVar;      % Number of Main players
nReservePlayer=nVar;    % Number of Reserve players
VarMin=-100;         % Lower Bound of Variables
VarMax=100;       % Upper Bound of Variables
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


addpath('example');
addpath('SLC');
tedad=NumberofFunctionEvaluation;
VarSize=[1 nVar];   % Decision Variables Matrix Size
nEval=0;
%% SCA Parameters

MaxIt=10^8;          % Maximum Number of Iterations

%%
pMutation=0.1;    % Mutation Probability
SSay=0.2;            % Mutartion Rate
%%
%ShareSettings;




%% Initialization
League=CreateInitialLeague();

%% SLC Main Loop

for it=1:MaxIt
    
    %% Competition

    [League,nEval]=Competition(League,it,nEval);
   % Update Best Solution Ever Found
   
    League=Takhsis(League);
    
    % Update Best Cost 
    BestCost(it)=League(1,1).MPlayer(1,1).Cost;
    BestSol=League(1,1).MPlayer(1,1).Position;
    
    if nEval>tedad
        break
    end
    
    % Show Iteration Information
disp(['Season ' num2str(it) ': SuperStarPlayer = ' num2str(BestCost(it))])

end

%% Results
figure;
semilogy(BestCost,'LineWidth',2);
xlabel('Number of Seasons');
ylabel('Best Solution (SSP)');



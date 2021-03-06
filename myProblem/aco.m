clc;
clear;
close all;

%% Problem Definition

model=CreateModel();

% Define function handler for Goal Function
% Cost function is a unction of x and Returns MyCost(...)
CostFunction=@(x) MyCost(x,model);

nTasks=model.nTasks;
nMachines=model.nMachines;


%% ACO Parameters

MaxIt=500;      % Maximum Number of Iterations
nAnt=50;        % Number of Ants (Population Size)
Q=1;

tau0=1;         % Initial Phromone

alpha=1;        % Phromone Exponential Weight
beta=0;       % Heuristic Exponential Weight

rho=0.15;       % Evaporation Rate


%% Initialization

% eta=[model.w./model.v
%      model.v./model.w];           % Heuristic Information
eta=tau0*ones(nMachines,nTasks);

tau=tau0*ones(nMachines,nTasks);      % Phromone Matrix

BestCost=zeros(MaxIt,1);    % Array to Hold Best Cost Values

% Empty Ant
empty_ant.Tour=[];
empty_ant.Cost=[];
empty_ant.Sol=[];

% Ant Colony Matrix
ant=repmat(empty_ant,nAnt,1);

% Best Ant
BestAnt.Cost=inf;


%% ACO Main Loop

%iteration loop
for it=1:MaxIt

    % Move Ants
    for k=1:nAnt
        
        % empty current ant's Tour
        ant(k).Tour=[];
        
        for l=1:nTasks
            
            %Probabilities
            P=tau(:,l).^alpha.*eta(:,l).^beta;
            
            P=P/sum(P);
            
            j=RouletteWheelSelection(P);
            
            ant(k).Tour=[ant(k).Tour j];
            
        end
        
        ant(k).x=ant(k).Tour;
        
        % Calculate the cost
        [ant(k).Cost ant(k).Sol]=CostFunction(ant(k).x);
        
        %update the records if it improves the solution
        if ant(k).Cost<BestAnt.Cost
            BestAnt=ant(k);
        end
        
    end
    
    % Update Phromones
    for k=1:nAnt
        
        tour=ant(k).Tour;
        
        for l=1:nVar
            
            tau(tour(l),l)=tau(tour(l),l)+Q/ant(k).Cost;
            
        end
        
    end
    
    % Evaporation
    tau=(1-rho)*tau;
    
    % Store Best Cost
    BestCost(it)=BestAnt.Cost;
    
    % Show Iteration Information
    disp(['Iteration ' num2str(it) ': Best Cost = ' num2str(BestCost(it))]);
    
    %figure(1);
    %PlotSolution(BestAnt.Tour, model);
    
%     if ((BestAnt.Sol.V1 > 4750 && BestAnt.Sol.W1 > 480) && BestAnt.Sol.IsFeasible==1) 
%         break;
%     end
    
end

%% Results

figure;
plot(BestCost,'LineWidth',2);
xlabel('Iteration');
ylabel('Best Cost');

%good Solutions

%V1: 4955
%W1: 497
% [2 2 1 2 1 2 1 2 2 1 2 2 2 2 1 1 1 2 2 2]


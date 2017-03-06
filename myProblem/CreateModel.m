function model=CreateModel()

    nTasks=5;
    nMachines=3;
    % Resource Demand
    % ===============
    % Requested Resources(type 1:CPU) by tasks
%     R1=randi([50 500],1,nTasks);
    R1=[120 100 60 220 200];
    
    % Requested Resources(type 2:RAM) by tasks
%     R2=randi([200 2000],1,nTasks);
    R2=[1000 1500 2000 250 1000];

    % Resource Pool
    % ===============
    % Available Resources(type 1) by Machines
%     M1=randi([50 1000],1,nMachines);
    M1=[400 200 300];
    
    % Available Resources(type 1) by Machines
%     M2=randi([200 4000],1,nMachines);
    M2=[2000 4000 8000];

    Adjacency=zeros(nTasks,nTasks);
    Adjacency(1,3)=10;
    Adjacency(3,1)=Adjacency(1,3);
    Adjacency(1,4)=7;
    Adjacency(4,1)=Adjacency(1,4);
    Adjacency(2,4)=12;
    Adjacency(4,2)=Adjacency(2,4);
    Adjacency(3,5)=20;
    Adjacency(5,3)=Adjacency(3,5);
    Adjacency(4,5)=15;
    Adjacency(5,4)=Adjacency(4,5);
    
    
    model.nTasks=nTasks;
    model.nMachines=nMachines;
    model.r1=R1;
    model.r2=R2;
    model.m1=M1;
    model.m2=M2;
    model.adj=Adjacency;

end
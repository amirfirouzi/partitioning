function model=CreateModel()

    nTasks=5;
    nMachines=3;
    % Requested Resources(type 1) by tasks
    R1=randi([50 500],1,nTasks);
    
    % Requested Resources(type 2) by tasks
    R2=randi([200 2000],1,nTasks);

    % Available Resources(type 1) by Machines
    M1=randi([50 1000],1,nMachines);
    
    % Available Resources(type 1) by Machines
    M2=randi([200 4000],1,nMachines);
    
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
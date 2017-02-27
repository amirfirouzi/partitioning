function model=CreateModel()

    % Capacities for Resource type 1(CPU)
    W1=mat2str(randi([100 1000],1,5))
    % Capacities for Resource type 2(Mem)
    %W2=mat2str(randi([500 10000],1,5))

    % create 20 random integer numbers between 100-500 for tasks
    % v=mat2str(randi([100 500],1,20))
    v=[391 444 250 330 246 400 150 266 268 293 471 388 364 493 202 161 410 270 384 486];
    
    % create 20 random integer numbers between 20-70
    % v=mat2str(randi([20 70],1,20))
    w=[55 52 59 24 52 46 45 34 34 59 59 28 57 21 47 66 64 42 22 23];
    
    n=numel(v);
    
    % total weight of knapsack
    W=500;
    
    model.n=n;
    model.v=v;
    model.w=w;
    model.W=W;

end
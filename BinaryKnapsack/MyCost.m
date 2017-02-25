function [z sol]=MyCost(x,model)

    v=model.v;
    w=model.w;
    W=model.W;

    % Value of Selected Items
    V1=sum(v.*x);
    % Weight of Selected Items
    W1=sum(w.*x);
    % Value of unSelected Items
    V0=sum(v.*(1-x));
    % Weight of unSelected Items
    W0=sum(w.*(1-x));
    
    % Violation percent
    Violation=max(W1/W-1,0);
    
    % old goal function
%     beta=10;
%     z=V0*(1+beta*Violation);
%     
    alpha=10000;
    z=V0+alpha*Violation;
    
    sol.V1=V1;
    sol.W1=W1;
    sol.V0=V0;
    sol.W0=W0;
    sol.Violation=Violation;
    sol.z=z;
    sol.IsFeasible=(Violation==0);

end
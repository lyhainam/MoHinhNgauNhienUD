function [ L, Lq, Ls, W, Wq, Ws ] = mmqueue( c, lambda, mu, K )
    % mmqueues Returns steady state variables of a M/M queue
    %
    % Kendall Lee notation: M/M/c/GD/K/infty
    % PARAMETERS:
    % c: number of servers
    % K: capacity of the system (queue+service) if infinite K=-1
    % lambda: single arrival rate (per entity)
    % mu: single service rate (per server)
    %
    % RETURNS
    %L: Average number of entities in the system
    %Lq: Average number of entities in queue in the system
    %Ls: Average number of entities in service in the system
    %W: Average time spent by an entity in the system
    %Wq: Average time spent in queue by an entity in the system
    %Ws: Average time spent in service by an entity in the system
    % 


    %First case M/M/1
    
    if c==1 && K==-1
        L=lambda/(mu-lambda);
        Ls=lambda/mu;
        Lq=L-Ls;
        W=L/lambda;
        Wq=Lq/lambda;
        Ws=Ls/lambda;
    end

    %Second case M/M/1/GD/K

    if c==1 && K>0
       rho=lambda/mu;
        pi0=(1-rho)/(1-(rho)^(K+1));
        piK=pi0*((rho)^K);
        L=(rho*(1-(K+1)*(rho^K)+K*(rho^(K+1))))/((1-rho^(K+1))*(1-rho));
        W=L/(lambda*(1-piK));
        Ls=1-pi0;
        Lq=L-Ls;
        Wq=Lq/(lambda*(1-piK));
        Ws=Ls/(lambda*(1-piK));
    end

    %Third case M/M/c/GD/infty

    if c>1 && K==-1
        rhos=lambda/(c*mu);
        p=pjc(c,rhos);
        Lq=p*rhos/(1-rhos);
        Wq=Lq/lambda;
        L=Lq+lambda/mu;
        W=L/lambda;
        Ws=1/mu;
        Ls=lambda/mu;
    end

    %Fourth case M/M/infty/GD/infty

    if c==-1 && K==-1
        Lq=0;
        Ls=lambda/mu;
        L=Ls;
        Wq=0;
        Ws=1/mu;
        W=Ws;
    end
end

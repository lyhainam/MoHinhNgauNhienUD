function [ p ] = pjc( c, rhos )
    % pjc: Calculates P(j>=c) for a M/M/c/GD/infty/infty
    
    sumatory=0;
    
    for i=0:c-1
        sumatory=sumatory+(((c*rhos)^i)/factorial(i));
    end
    
    pi0=1/(sumatory+(((c*rhos)^c)/(factorial(c)*(1-rhos))));
    p=pi0*(((c*rhos)^c)/(factorial(c)*(1-rhos)));
end
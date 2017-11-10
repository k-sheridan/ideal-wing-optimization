function [new_wing] = optimizeWingDimensionsLocally(wing)
    
    objective_fn = formObjectiveMassFunctionDynamically(wing); % we seek to minimize this function
    
    x0 = wing2DimensionVector(wing); % initial guess of the wing dims
    
    ub = ones(1, length(x0));
    lb = zeros(1, length(x0));
    
    [x_optim, new_mass] = fmincon(objective_fn, x0, zeros(length(x0)), zeros(length(x0), 1), zeros(length(x0)), zeros(length(x0), 1), lb, ub);
    
    
    
    disp(new_mass)
end

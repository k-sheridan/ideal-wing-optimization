function [final_fn] = formObjectiveMassFunctionDynamically(wing)
%dynamically form a mass function to be minimized
%the order of x is like this: stringer area, skin thickness, [skin stringer
%areas], next stringer area, next skin thickness, [next skin stringer
%areas], etc...

index = 1; % the starting index of the x vector

%start with stringer1
mass_fn{index} = @(x)(x(index) * wing.stringer1.material.getDensity);
index = index + 1;

%top left skin and its stringers
mass_fn{index} = @(x)(x(index) * wing.skin_tl.length * wing.skin_tl.material.getDensity);
index = index + 1;

%skin stringers
for s = wing.skin_tl.stringers
    mass_fn{index} = @(x)(x(index) * s.material.getDensity);
    index = index + 1;
end

%-=-=-=-=-=-=-=-=-=-

% finally sum up these functions
final_fn = @(x) sum(cellfun(@(y) y(x), mass_fn));
end


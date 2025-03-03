clear;

z = 10;

M = [-2,0,2i;0,-8,0;2i,0,-6];
MZI = M - (10*eye(size(M,1)));

detMZI = @(x) det(M - (x*eye(size(M,1))));
d_detMZI = detMZI(z) * trace(inv(MZI) .* (-1));

exptected_g = - detMZI(z)/d_detMZI;

[f,g] = evaluate_characteristic(10,M);

fprintf('Test 1 - f: expected value: %d, actual value: %d\n',detMZI(z),f);
assert(isequal(f,detMZI(z)),'Test failed');
fprintf('Test 1 - g: expected value: %d, actual value: %d\n',exptected_g,g);
assert(isequal(g,exptected_g),'Test failed');


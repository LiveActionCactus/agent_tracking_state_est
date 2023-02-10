function sample = sample_norm_dist(b2)
%SAMPLE_NORM_DIST samples from a zero-centered normal distribution with
%variance b^2
%
% Inputs:
%       b2      : variance 
%
% Outputs: 
%       sample  : random sample taken from distribution
%

b = sqrt(b2);
a = -b;

r = 0;
for i = 1:12
    r = r + ( a + (b-a).*rand(1,1) );
end

sample = 0.5*r;

end
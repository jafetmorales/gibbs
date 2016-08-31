function [yon]=approveSample(alpha)

% alpha=numerator/denominator;

yon=boolean(0);
if(alpha>=1)
    yon=boolean(1);
else
    u=rand(1,1);
    if(u<alpha)
        yon=boolean(1);
    end
end

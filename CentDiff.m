function [y] = CentDiff(F,M,K,C,dt,x0,v0)
% [y] = CentDiff(F,M,K,C,dt,x0,v0)solves numerically the equation of motion
% of a damped system
% 
% 
% INPUT
% F : vector  -- size: [1x N] -- Time series representinf the time history of the load. 
% M : scalar  -- size: [1 x 1] -- Modal mass
% K : scalar  -- size: [1 x 1] -- Modal stifness
% C : scalar  -- size: [1 x 1] -- Modal damping
% dt : scalar  -- size: [1 x 1] -- time step
% x0 : scalar  -- size: [1 x 1] -- initial displacement
% v0 : scalar  -- size: [1 x 1] -- initial velocity
% 
% OUTPUT
% y: time history of the system response to the load
% 
% author: E. Cheynet  - UiB - last updated: 14-05-2020
% 

%%
% Initialisation
N = size(F,2);
% preallocation
y = zeros(size(F));

% initial acceleration
a0 = M\(F(1)-C.*v0-K.*x0);
% initialisation of y (first 2 values).
y0 = x0-dt.*v0+dt^2/2*a0;
y(:,1) = x0;
A = (M./dt.^2+C./(2*dt));
B = ((2*M./dt.^2-K).*y(:,1)+(C./(2*dt)-M./dt.^2).*y0+F(:,1));
y(:,2) = A\B;

% For the rest of integration points
for ii=2:N-1
    A = (M./dt.^2+C./(2*dt));
    B = ((2*M./dt.^2-K).*y(:,ii)+(C./(2*dt)-M./dt.^2).*y(:,ii-1)+F(:,ii)); 
    y(:,ii+1) = A\B;
end

end


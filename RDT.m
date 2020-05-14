function [R,t] = RDT(y,ys,T,dt)
%
% [R] = RDT(y,ys,T,dt) returns the free-decay response (R) by
% using the random decrement technique (RDT) to the time serie y, with a
% triggering value ys, and for a duration T
%
% INPUT:
%   y: time series of ambient vibrations: vector of size [1xN]
%   dt : Time step
%   ys: triggering values (ys < max(abs(y)) and here ys~=0)
%   T: Duration of subsegments (T<dt*(numel(y)-1))
% OUTPUT:
%   R: impusle response function
%   t: time vector asociated to R
% 
% Author: E. Cheynet - UiB - last modified 14-05-2020

%%

if T>=dt*(numel(y)-1)
    error('Error: subsegment length is too large');
else
    % number of time step per block
    nT = round(T/dt); % sec
end

if ys==0
    error('Error: ys must be different from zero')
elseif or(ys >=max(y),ys <=min(y)),
    error('Error:  ys must verifiy : min(y) < ys < max(y)')
else
    % find triggering value
    ind=find(diff(y(1:end-nT)>ys)~=0)+1;
    
end

% construction of decay vibration
R = zeros(numel(ind),nT);
for ii=1:numel(ind)
    R(ii,:)=y(ind(ii):ind(ii)+nT-1);
end

% averaging to remove the random part
R = mean(R);
% normalize the R
R = R./R(1);
% time vector corresponding to the R
t = linspace(0,T,numel(R));
end


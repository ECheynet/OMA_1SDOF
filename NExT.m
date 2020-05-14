function [R,t] = NExT(y,dt,Ts,method)
%
% [R] = NExT(y,ys,T,dt) implements the Natural Excitation Technique to
% retrieve the free-decay response (R) from the cross-correlation
% of the measured output y.
%
% 
% Synthax
% 
%   [R] = NExT(y,dt,Ts,1) calculates R with cross-correlation
%   calculated by using the inverse fast fourier transform of the
%   cross-spectral power densities without zero-padding(method = 1).
%
%   [R] = NExT(y,dt,Ts,2) calculate the R with cross-correlation
%   calculated by using the unbiased cross-covariance function (method = 2)
%
% Input
%   y: time series of ambient vibrations: vector of size [1xN]
%   dt : Time step
%   method: 1 or 2 for the computation of cross-correlation functions
%   T: Duration of subsegments (T<dt*(numel(y)-1))
% 
% Output
% 
% R: impusle response function
% t: time vector asociated to R
% 
% Author: E. Cheynet - UiB - last modified 14-05-2020

%%
if nargin<4, method = 2; end % the fastest method is the default method
if ~ismatrix(y), error('Error: y must be a vector or a matrix'),end


[Nyy,N]=size(y);
if Nyy>N
    y=y';
    [Nyy,N]=size(y);
end

% get the maximal segment length fixed by T
M = round(Ts/dt);
switch method
    case 1
        clear R
        for ii=1:Nyy
            for jj=1:Nyy
                y1 = fft(y(ii,:));
                y2 = fft(y(jj,:));
                h0 = ifft(y1.*conj(y2));
                R(ii,jj,:) = h0(1:M);
            end
        end
        % get time vector t associated to the R
        t = linspace(0,dt.*(size(R,3)-1),size(R,3));
        if Nyy==1
            R = squeeze(R)'; % if Nyy=1
        end
    case 2
        R = zeros(Nyy,Nyy,M+1);
        for ii=1:Nyy
            for jj=1:Nyy
                [dummy,lag]=xcov(y(ii,:),y(jj,:),M,'unbiased');
                R(ii,jj,:) = dummy(end-round(numel(dummy)/2)+1:end);
            end
        end
        if Nyy==1
            R = squeeze(R)'; % if Nyy=1
        end
        % get time vector t associated to the R
        t = dt.*lag(end-round(numel(lag)/2)+1:end);
end
% normalize the R
if Nyy==1
R = R./R(1);
else
end


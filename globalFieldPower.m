function [ gfpCurve ] = globalFieldPower( signal, dimension )
% This function computes the GFP curves from given dataset. 
%
% INPUTS:
%   signal - EEG record, number of channels X time samples
%   dimension - dimension of computation, 
%             - default 1 means that rows represent channels of the EEG
%             record and columns represent time samples
% 
% OUTPUTS:
%   gfpCurve - global field power
%
% Author: Marie Nezbedová, Václava Piorecká (vaclava.piorecka@fbmi.cvut.cz)
% Date: 2017-12-18

% Check the dimensions 
if nargin < 2
    dimension = 1;
end

switch dimension
    case 1
        [ numOfElecs,numOfTimes ] = size(signal);
        meanValue = mean(signal,dimension);
        gfpCurve = sqrt(sum(((signal - repmat(meanValue,[numOfElecs,1])).^2),dimension)/numOfElecs);
    case 2
        [ numOfTimes,numOfElecs ] = size(signal);
        meanValue = mean(signal,dimension);
        gfpCurve = sqrt(sum((signal - repmat(meanValue,[1,numOfElecs])).^2,dimension)/numOfElecs);
end

end

